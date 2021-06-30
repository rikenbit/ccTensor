\name{CX}
\docType{methods}
\alias{CX}

\title{
CX Matrix Decomposition
}
\description{
The input data is assumed to be a matrix.
CX decomposes the matrix to two low-dimensional factor matices.
C is not an estimated values but the actual column vectors sampled from the matrix.
}
\usage{
CX(A, rank=NULL, thr=0.9,
  c.method=c("best.match", "random", "exact.num.random", "top.scores"))
}

\arguments{
\item{A}{
The input matrix which has N-rows and M-columns.
}
\item{rank}{
The number of low-dimension (J < {N,M}).
If this argument is not specified or specified as NULL, the low-dimension is estimated based on the cumulative singular value (Default: NULL).
}
\item{thr}{
The threshold to determine the low-dimension J.
The value must be range 0 to 1 (Default: 0.9).
}
\item{c.method}{
The column sampling algorithm (Default: best.match).
}
}

\value{
  C: A N-rows and J-columns matrix contains the sampled column vectors from the input matrix A.
  X: A J-rows and M-columns matrix.
  indC: The sampled column indices.
  RecError : The reconstruction error between data matrix and reconstructed
  matrix from C and X.
}

\references{
Petros Drineas et.al., (2008). Relative-error CUR Matrix Decompositions. \emph{SIAM J. Matrix Anal. Appl.}
}

\author{Koki Tsuyuzaki}

\examples{
    library("ccTensor")
    library("nnTensor")
    # Test data
    matdata <- toyModel(model = "NMF")
    # Simple usage
    out <- CX(matdata, rank=5)
}
\keyword{methods}