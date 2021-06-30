library("ccTensor")
library("nnTensor")
library("testthat")

# Setting
options(testthat.use_colours = FALSE)

test_file("testthat/test_CUR.R")
test_file("testthat/test_CX.R")
test_file("testthat/test_MultiCX.R")
