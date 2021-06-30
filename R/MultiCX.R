MultiCX <- function(Y, rank=NULL, modes=1:3, thr=0.9,
    c.method=c("best.match", "random", "exact.num.random", "top.scores")){
    # Argument check
    c.method <- match.arg(c.method,
        c("best.match", "random", "exact.num.random", "top.scores"))
    .checkMultiCX(Y, rank, modes, thr)
    # Initialization
    init <- .initMultiCX(Y, rank, modes, thr)
    unfoldY <- init$unfoldY
    res.svd <- init$res.svd
    ks <- init$ks
    C <- init$C
    # CX Tensor Decomposition
    # 1. Calculate C
    for(m in modes){
        if(c.method != "best.match"){
            C[[m]] <- .colSampling(unfoldY[[m]], res.svd[[m]]$v,
                c.method, ks[[m]])
        }else{
            C[[m]] <- .bestMatch(unfoldY[[m]], res.svd[[m]]$u,
                ks[[m]])
        }
    }
    # 2. Calculate U
    gCs <- lapply(modes, function(x){ginv(C[[x]]$C)})
    U <- ttl(Y, gCs, ms=modes)
    # Reconstruction Error
    Cs <- lapply(modes, function(x){C[[x]]$C})
    RecError <- fnorm(Y - ttl(U, Cs, ms=modes))
    # Output
    list(U=U, C=C, RecError=RecError)
}

.checkMultiCX <- function(Y, rank, modes, thr){
    # Y
    stopifnot(is(Y) == "Tensor")
    # rank / modes
    if(!is.null(rank)){
        stopifnot(length(rank) == length(modes))
        stopifnot(length(dim(Y)) >= length(rank))
    }
    stopifnot(length(dim(Y)) >= length(modes))
    # thr
    stopifnot(thr > 0)
    stopifnot(thr <= 1)
}

.initMultiCX <- function(Y, rank, modes, thr){
    unfoldY <- list()
    res.svd <- list()
    ks <- list()
    C <- list()
    length(unfoldY) <- length(dim(Y))
    length(res.svd) <- length(dim(Y))
    length(ks) <- length(dim(Y))
    length(C) <- length(dim(Y))
    if(!is.null(rank)){
        names(rank) <- modes
    }
    for(m in modes){
        unfoldY[[m]] <- rs_unfold(Y, m=m)@data
        res.svd[[m]] <- svd(unfoldY[[m]])
        if(is.null(rank)){
            ks[[m]] <- min(which(cumsum(res.svd[[m]]$d) /
                sum(res.svd[[m]]$d) >= thr))
        }else{
        	ks[[m]] <- as.numeric(rank[as.character(m)])
        }
        res.svd[[m]] <- list(d=res.svd[[m]]$d[seq(ks[[m]])],
                            u=res.svd[[m]]$u[,seq(ks[[m]])],
                            v=res.svd[[m]]$v[,seq(ks[[m]])])
    }
    list(unfoldY=unfoldY, res.svd=res.svd, ks=ks, C=C)
}
