A <- toyModel("NMF")

out1 <- CUR(A, c.rank=NULL, r.rank=NULL, thr=0.8,
    c.method="best.match", r.method="best.match")
out2 <- CUR(A, c.rank=5, r.rank=6, thr=0.8,
    c.method="best.match", r.method="best.match")
out3 <- CUR(A, c.rank=5, r.rank=6, thr=0.8,
    c.method="random", r.method="random")
out4 <- CUR(A, c.rank=5, r.rank=6, thr=0.8,
    c.method="exact.num.random", r.method="exact.num.random")
out5 <- CUR(A, c.rank=5, r.rank=6, thr=0.8,
    c.method="top.scores", r.method="top.scores")

expect_equivalent(dim(A), dim(out1$C %*% out1$U %*% out1$R))
expect_equivalent(dim(A), dim(out2$C %*% out2$U %*% out2$R))
expect_equivalent(dim(A), dim(out3$C %*% out3$U %*% out3$R))
expect_equivalent(dim(A), dim(out4$C %*% out4$U %*% out4$R))
expect_equivalent(dim(A), dim(out5$C %*% out5$U %*% out5$R))
