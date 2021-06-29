# ccTensor
R package for CUR/CX Tensor Decomposition


Installation of Dependent Packages
======
```r
library("BiocManager")
BiocManager::install(
  c("??????????"),
  suppressUpdates=TRUE)
```

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
  - **MultiCX**: Multidimensional CX Decomposition of Tensors, Maria F. K. B. et. al., WCNPS 2019, 2019
  - **FSTD1/2**: Generalizing the column-row matrix decomposition to multi-way arrays, Cesar F. Caiafa and Andrzej Cichocki, Linear Algebra and its Applications, 2010


# License
Copyright (c) 2021 Koki Tsuyuzaki and Laboratory for Bioinformatics Research, RIKEN Center for Biosystems Dynamics Reseach
Released under the [Artistic License 2.0](http://www.perlfoundation.org/artistic_license_2_0).

# Authors
- Koki Tsuyuzaki
- Itoshi Nikaido