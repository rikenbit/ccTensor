\name{MultiCX}
\docType{methods}
\alias{MultiCX}

\title{
MultiCX Tensor Decomposition
}
\description{
The input data is assumed to be a tensor.
MultiCX decomposes the tensor into a core tensor and some factor matrices.
The factor matrices are not estimated values but the actual column vectors sampled from the unfolded matrix in each mode.
}
\usage{
MultiCX(Y, rank=NULL, modes=1:3, thr=0.9,
  c.method=c("best.match", "random", "exact.num.random", "top.scores"))
}

\arguments{
\item{Y}{
The input tensor (e.g. N times M times L).
}
\item{rank}{
The number of low-dimension of factor matrices (e.g. J1, J2, and J3).
If this argument is not specified or specified as NULL, the low-dimension is estimated based on the cumulative singular value (Default: NULL).
}
\item{modes}{
The vector of the modes on whih to perform the decomposition
(Default: 1:3 <all modes>).
}
\item{thr}{
The threshold to determine the low-dimension of factor matrices.
The value must be range 0 to 1 (Default: 0.9).
}
\item{c.method}{
The column sampling algorithm (Default: best.match).
}
}

\value{
  U: Core tensor (e.g. J1 times J2 times J3).
  C: Factor matrices (e.g. C_1: ????????)
  RecError : The reconstruction error between data tensor and reconstructed
  tensor from C and X.
}

\references{
Maria F. K. B. et. al. (2019). Multidimensional CX Decomposition of Tensors.
 \emph{WCNPS}
}

\author{Koki Tsuyuzaki}

\examples{
    library("ccTensor")
    library("nnTensor")
    # Test data
    tensdata <- toyModel(model = "CP")
    # Simple usage
    out <- MultiCX(tensdata, rank=c(3,4,5))
}
\keyword{methods}