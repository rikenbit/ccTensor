CXTensor <- function(Y, rank=NULL, thr=0.8,
    c.method=c("best.match", "random", "exact.num.random", "top.scores"),
    u.method=c("FSTD1", "FSTD2", "MultiCX")){
    # Argument check

    # Initialization

    # CX Tensor Decomposition
    # 1. Calculate C

    # 2. Calculate U

    # Reconstruction Error
    # RecError <- norm(Y - C %*% X, "F")
    # Output
    list(U=U, C=C, RecError=RecError)
}

.checkCXTensor <- function(){

}

.initCXTensor <- function(){

}
