[![DOI](https://zenodo.org/badge/380413918.svg)](https://zenodo.org/badge/latestdoi/380413918)
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/ccTensor)](
https://cran.r-project.org/package=ccTensor)
[![Downloads](https://cranlogs.r-pkg.org/badges/ccTensor)](https://CRAN.R-project.org/package=ccTensor)
[![Total Downloads](https://cranlogs.r-pkg.org/badges/grand-total/ccTensor?color=orange)](https://CRAN.R-project.org/package=ccTensor)
[![:name status badge](https://rikenbit.r-universe.dev/badges/:name)](https://rikenbit.r-universe.dev)
[![:registry status badge](https://rikenbit.r-universe.dev/badges/:registry)](https://rikenbit.r-universe.dev)
[![:total status badge](https://rikenbit.r-universe.dev/badges/:total)](https://rikenbit.r-universe.dev)
[![ccTensor status badge](https://rikenbit.r-universe.dev/badges/ccTensor)](https://rikenbit.r-universe.dev)
![GitHub Actions](https://github.com/rikenbit/ccTensor/actions/workflows/build_test_push.yml/badge.svg)

# ccTensor
R package for CUR/CX Tensor Decomposition

Installation
======
```r
git clone https://github.com/rikenbit/ccTensor/
R CMD INSTALL ccTensor
```
or type the code below in the R console window
```r
install.packages("devtools", repos="http://cran.r-project.org")
library(devtools)
devtools::install_github("rikenbit/ccTensor")
```

# Reference
- **CUR Matrix Decomposition**
  - CUR matrix decompositions for improved data analysis, Michael W. Mahoney and Petros Drineas, PNAS, 2009

- **CX Matrix Decomposition**
  - Relative-error CUR Matrix Decompositions, Petros Drineas et.al. SIAM J. Matrix Anal. Appl. 2008

- **CX Tensor Decomposition**
  - Multidimensional CX Decomposition of Tensors, Maria F. K. B. et. al., WCNPS 2019, 2019


# License
Copyright (c) 2021 Koki Tsuyuzaki and Laboratory for Bioinformatics Research, RIKEN Center for Biosystems Dynamics Reseach
Released under the [Artistic License 2.0](http://www.perlfoundation.org/artistic_license_2_0).

# Authors
- Koki Tsuyuzaki
- Itoshi Nikaido