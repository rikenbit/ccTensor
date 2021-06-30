\name{CUR}
\docType{methods}
\alias{CUR}

\title{
CUR Matrix Decomposition
}
\description{
The input data is assumed to be a matrix.
CUR decomposes the matrix to three low-dimensional factor matices.
C and R are not estimated values but the actual column and row vectors sampled from the matrix.
}
\usage{
CUR(A, c.rank=NULL, r.rank=NULL, thr=0.9,
  c.method=c("best.match", "random", "exact.num.random", "top.scores"),
  u.method=c("invCR", "invW"),
  r.method=c("best.match", "random", "exact.num.random", "top.scores"))
}

\arguments{
\item{A}{
The input matrix which has N-rows and M-columns.
}
\item{c.rank}{
The number of low-dimension of C (J1 < {N,M}).
If this argument is not specified or specified as NULL, the low-dimension is estimated based on the cumulative singular value (Default: NULL).
}
\item{r.rank}{
The number of low-dimension of R (J2 < {N,M}).
If this argument is not specified or specified as NULL, the low-dimension is estimated based on the cumulative singular value (Default: NULL).
}
\item{thr}{
The threshold to determine the low-dimension J1 and J2.
The value must be range 0 to 1 (Default: 0.9).
}
\item{c.method}{
The column sampling algorithm (Default: best.match).
}
\item{u.method}{
The algorithm to calculate U (Default: invCR).
}
\item{r.method}{
The row sampling algorithm (Default: best.match).
}
}

\value{
  C: A N-rows and J1-columns matrix contains the sampled column vectors from the input matrix A.
  U: A J1-rows and J2-columns matrix.
  R: A J2-rows and M-columns matrix contains the sampled row vectors from the input matrix A.
  indC: The sampled column indices.
  indC: The sampled row indices.
  RecError : The reconstruction error between data matrix and reconstructed
  matrix from C and X.
}

\references{
Michael W. Mahoney, et. al., (2009). CUR matrix decompositions for improved data analysis. \emph{PNAS}
}

\author{Koki Tsuyuzaki}

\examples{
    library("ccTensor")
    library("nnTensor")
    # Test data
    matdata <- toyModel(model = "NMF")
    # Simple usage
    out <- CUR(matdata, c.rank=3, r.rank=4)
}
\keyword{methods}