CUR <- function(A,
    c.rank=NULL,
    r.rank=NULL,
    thr=0.9,
    c.method=c("best.match", "random", "exact.num.random", "top.scores"),
    u.method=c("invCR", "invW"),
    r.method=c("best.match", "random", "exact.num.random", "top.scores")){
    # Argument check
    c.method <- match.arg(c.method,
        c("best.match", "random", "exact.num.random", "top.scores"))
    u.method <- match.arg(u.method,
        c("invCR", "invW"))
    r.method <- match.arg(r.method,
        c("best.match", "random", "exact.num.random", "top.scores"))
    .checkCUR(A, c.rank, r.rank, thr)
    # Initialization
    init <- .initCUR(A, c.rank, r.rank, thr)
    res.svd <- init$res.svd
    k1 <- init$k1
    k2 <- init$k2
    # CUR Decomposition
    # 1. Calculate C
    # 2. Calculate R
    if(c.method != "best.match"){
        C <- .colSampling(A, res.svd$v, c.method, k2)
        R <- .colSampling(t(A), res.svd$u, r.method, k1)
    }else{
        C <- .bestMatch(A, res.svd$u, k2)
        R <- .bestMatch(t(A), res.svd$v, k1)
    }
    # 3. Calculate U
    if(u.method == "invCR"){
        U <- ginv(C$C) %*% A %*% ginv(t(R$C))
    }else{
    	W <- A[R$indC, C$indC]
        U <- ginv(W)
    }
    # Reconstruction Error
    RecError <- norm(A - C$C %*% U %*% t(R$C), "F")
    # Output
    list(C=C$C, U=U, R=t(R$C), indC=C$indC, indR=R$indC, RecError=RecError)
}

.checkCUR <- function(A, c.rank, r.rank, thr){
    # A
    stopifnot(is.matrix(A))
    # c.rank
    if(!is.null(c.rank)){
        stopifnot(is.numeric(c.rank))
        stopifnot(c.rank <= min(dim(A)))
    }
    # r.rank
    if(!is.null(r.rank)){
        stopifnot(is.numeric(r.rank))
        stopifnot(r.rank <= min(dim(A)))
    }
	# thr
    stopifnot(thr > 0)
    stopifnot(thr <= 1)
}

.initCUR <- function(A, c.rank, r.rank, thr){
    res.svd <- svd(A)
    if(is.null(c.rank) || is.null(r.rank)){
        k1 <- k2 <- min(which(cumsum(res.svd$d) / sum(res.svd$d) >= thr))
    }else{
        k1 <- c.rank
        k2 <- r.rank
    }
    res.svd$u <- res.svd$u[,seq(k1)]
    res.svd$d <- res.svd$d[seq(max(k1,k2))]
    res.svd$v <- res.svd$v[,seq(k2)]
    list(res.svd=res.svd, k1=k1, k2=k2)
}