.levScores <- function(score, k){
    if(k == 1){
        score[,1]^2
    }else{
        apply(score[,seq(k)]^2, 1, sum) / k
    }
}

.colSampling <- function(A, score, method, k){
    c.score <- .levScores(score, k)
    n <- ncol(A)
    if(n == k){
    	indC <- seq(k)
        list(C=A[,indC], indC=indC)
    }else{
        f <- .flist[[method]]
        f(A, c.score, k, n)
    }
}

.random <- function(A, c.score, k, n){
    repeat{
        indC = which(k * c.score >= runif(n))
        if(length(indC) > 0){
            break
        }
    }
    list(C=A[,indC], indC=indC)
}

.exact.num.random <- function(A, c.score, k, n){
    indC = order(k*c.score - runif(n), decreasing=TRUE)[seq(k)]
    list(C=A[,indC], indC=indC)
}

.top.scores <- function(A, c.score, k, n){
    indC = order(c.score, decreasing=TRUE)[seq(k)]
    list(C=A[,indC], indC=indC)
}

.flist <- list(
    "random" = .random,
    "exact.num.random" = .exact.num.random,
    "top.scores" = .top.scores
)

.bestMatch <- function(A, score, k){
    if(k == 1){
        list(C=A[, 1], indC=1)
    }else{
        evec <- paste0("EV", seq(ncol(score)))
        cor.matrix <- abs(cor(score, A))
        rownames(cor.matrix) <- evec
        colnames(cor.matrix) <- seq(ncol(A))
        cor.matrix[which(is.na(cor.matrix))] <- 0
        g <- graph_from_incidence_matrix(cor.matrix, weighted=TRUE)
        indC <- as.numeric(as.vector(max_bipartite_match(g)$matching[evec]))
        list(C=A[, indC], indC=indC)
    }
}
