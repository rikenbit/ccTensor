A <- toyModel("NMF")

out1 <- CX(A, rank=NULL, thr=0.8, c.method="best.match")
out2 <- CX(A, rank=20, thr=0.8, c.method="best.match")
out3 <- CX(A, rank=20, thr=0.8, c.method="random")
out4 <- CX(A, rank=20, thr=0.8, c.method="exact.num.random")
out5 <- CX(A, rank=20, thr=0.8, c.method="top.scores")

expect_equivalent(dim(A), dim(out1$C %*% out1$X))
expect_equivalent(dim(A), dim(out2$C %*% out2$X))
expect_equivalent(dim(A), dim(out3$C %*% out3$X))
expect_equivalent(dim(A), dim(out4$C %*% out4$X))
expect_equivalent(dim(A), dim(out5$C %*% out5$X))
