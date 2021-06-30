CX <- function(A, rank=NULL, thr=0.9,
    c.method=c("best.match", "random", "exact.num.random", "top.scores")){
    # Argument check
    c.method <- match.arg(c.method,
        c("best.match", "random", "exact.num.random", "top.scores"))
    .checkCX(A, rank, thr)
    # Initializatin
    init <- .initCX(A, rank, thr)
    res.svd <- init$res.svd
    k <- init$k
    # CX Decomposition
    # 1. Calculate C
    if(c.method != "best.match"){
        C <- .colSampling(A, res.svd$v, c.method, k)
    }else{
        C <- .bestMatch(A, res.svd$u, k)
    }
    # 2. Calculate X
    X <- ginv(C$C) %*% A
    # Reconstruction Error
    RecError <- norm(A - C$C %*% X, "F")
    # Output
    list(C=C$C, X=X, indC=C$indC, RecError=RecError)
}

.checkCX <- function(A, rank, thr){
    # A
    stopifnot(is.matrix(A))
    # rank
    if(!is.null(rank)){
        stopifnot(is.numeric(rank))
        stopifnot(rank <= min(dim(A)))
    }
	# thr
    stopifnot(thr > 0)
    stopifnot(thr <= 1)
}

.initCX <- function(A, rank, thr){
    res.svd <- svd(A)
    if(is.null(rank)){
        k <- min(which(cumsum(res.svd$d) / sum(res.svd$d) >= thr))
    }else{
        k <- rank
    }
    res.svd$u <- res.svd$u[,seq(k)]
    res.svd$d <- res.svd$d[seq(k)]
    res.svd$v <- res.svd$v[,seq(k)]
    list(res.svd=res.svd, k=k)
}