Y <- toyModel("CP")

out1 <- MultiCX(Y, rank=NULL, modes=1:3, thr=0.9,
    c.method="best.match")
out2 <- MultiCX(Y, rank=c(5,5,5), modes=1:3, thr=0.9,
    c.method="best.match")
out3 <- MultiCX(Y, rank=c(5,5,5), modes=1:3, thr=0.9,
    c.method="random")
out4 <- MultiCX(Y, rank=c(5,5,5), modes=1:3, thr=0.9,
    c.method="exact.num.random")
out5 <- MultiCX(Y, rank=c(5,5,5), modes=1:3, thr=0.9,
    c.method="top.scores")

expect_equivalent(
    dim(Y),
    dim(ttl(out1$U,
        list(out1$C[[1]]$C, out1$C[[2]]$C, out1$C[[3]]$C), m=1:3)))
expect_equivalent(
    dim(Y),
    dim(ttl(out2$U,
        list(out2$C[[1]]$C, out2$C[[2]]$C, out2$C[[3]]$C), m=1:3)))
expect_equivalent(
    dim(Y),
    dim(ttl(out3$U,
        list(out3$C[[1]]$C, out3$C[[2]]$C, out3$C[[3]]$C), m=1:3)))
expect_equivalent(
    dim(Y),
    dim(ttl(out4$U,
        list(out4$C[[1]]$C, out4$C[[2]]$C, out4$C[[3]]$C), m=1:3)))
expect_equivalent(
    dim(Y),
    dim(ttl(out5$U,
        list(out5$C[[1]]$C, out5$C[[2]]$C, out5$C[[3]]$C), m=1:3)))

# 1,2
out6 <- MultiCX(Y, rank=NULL, modes=1:2, thr=0.9,
    c.method="best.match")
out7 <- MultiCX(Y, rank=c(5,5), modes=1:2, thr=0.9,
    c.method="best.match")
out8 <- MultiCX(Y, rank=c(5,5), modes=1:2, thr=0.9,
    c.method="random")
out9 <- MultiCX(Y, rank=c(5,5), modes=1:2, thr=0.9,
    c.method="exact.num.random")
out10 <- MultiCX(Y, rank=c(5,5), modes=1:2, thr=0.9,
    c.method="top.scores")

expect_equivalent(
    dim(Y),
    dim(ttl(out6$U,
        list(out6$C[[1]]$C, out6$C[[2]]$C), m=1:2)))
expect_equivalent(
    dim(Y),
    dim(ttl(out7$U,
        list(out7$C[[1]]$C, out7$C[[2]]$C), m=1:2)))
expect_equivalent(
    dim(Y),
    dim(ttl(out8$U,
        list(out8$C[[1]]$C, out8$C[[2]]$C), m=1:2)))
expect_equivalent(
    dim(Y),
    dim(ttl(out9$U,
        list(out9$C[[1]]$C, out9$C[[2]]$C), m=1:2)))
expect_equivalent(
    dim(Y),
    dim(ttl(out10$U,
        list(out10$C[[1]]$C, out10$C[[2]]$C), m=1:2)))

# 1,3
out11 <- MultiCX(Y, rank=NULL, modes=c(1,3), thr=0.9,
    c.method="best.match")
out12 <- MultiCX(Y, rank=c(5,5), modes=c(1,3), thr=0.9,
    c.method="best.match")
out13 <- MultiCX(Y, rank=c(5,5), modes=c(1,3), thr=0.9,
    c.method="random")
out14 <- MultiCX(Y, rank=c(5,5), modes=c(1,3), thr=0.9,
    c.method="exact.num.random")
out15 <- MultiCX(Y, rank=c(5,5), modes=c(1,3), thr=0.9,
    c.method="top.scores")

expect_equivalent(
    dim(Y),
    dim(ttl(out11$U,
        list(out11$C[[1]]$C, out11$C[[3]]$C), m=c(1,3))))
expect_equivalent(
    dim(Y),
    dim(ttl(out12$U,
        list(out12$C[[1]]$C, out12$C[[3]]$C), m=c(1,3))))
expect_equivalent(
    dim(Y),
    dim(ttl(out13$U,
        list(out13$C[[1]]$C, out13$C[[3]]$C), m=c(1,3))))
expect_equivalent(
    dim(Y),
    dim(ttl(out14$U,
        list(out14$C[[1]]$C, out14$C[[3]]$C), m=c(1,3))))
expect_equivalent(
    dim(Y),
    dim(ttl(out15$U,
        list(out15$C[[1]]$C, out15$C[[3]]$C), m=c(1,3))))

# 2,3
out16 <- MultiCX(Y, rank=NULL, modes=c(2,3), thr=0.9,
    c.method="best.match")
out17 <- MultiCX(Y, rank=c(5,5), modes=c(2,3), thr=0.9,
    c.method="best.match")
out18 <- MultiCX(Y, rank=c(5,5), modes=c(2,3), thr=0.9,
    c.method="random")
out19 <- MultiCX(Y, rank=c(5,5), modes=c(2,3), thr=0.9,
    c.method="exact.num.random")
out20 <- MultiCX(Y, rank=c(5,5), modes=c(2,3), thr=0.9,
    c.method="top.scores")

expect_equivalent(
    dim(Y),
    dim(ttl(out16$U,
        list(out16$C[[2]]$C, out16$C[[3]]$C), m=c(2,3))))
expect_equivalent(
    dim(Y),
    dim(ttl(out17$U,
        list(out17$C[[2]]$C, out17$C[[3]]$C), m=c(2,3))))
expect_equivalent(
    dim(Y),
    dim(ttl(out18$U,
        list(out18$C[[2]]$C, out18$C[[3]]$C), m=c(2,3))))
expect_equivalent(
    dim(Y),
    dim(ttl(out19$U,
        list(out19$C[[2]]$C, out19$C[[3]]$C), m=c(2,3))))
expect_equivalent(
    dim(Y),
    dim(ttl(out20$U,
        list(out20$C[[2]]$C, out20$C[[3]]$C), m=c(2,3))))

# 1
out21 <- MultiCX(Y, rank=NULL, modes=1, thr=0.9,
    c.method="best.match")
out22 <- MultiCX(Y, rank=5, modes=1, thr=0.9,
    c.method="best.match")
out23 <- MultiCX(Y, rank=5, modes=1, thr=0.9,
    c.method="random")
out24 <- MultiCX(Y, rank=5, modes=1, thr=0.9,
    c.method="exact.num.random")
out25 <- MultiCX(Y, rank=5, modes=1, thr=0.9,
    c.method="top.scores")

expect_equivalent(
    dim(Y),
    dim(ttl(out21$U,
        list(out21$C[[1]]$C), m=1)))
expect_equivalent(
    dim(Y),
    dim(ttl(out22$U,
        list(out22$C[[1]]$C), m=1)))
expect_equivalent(
    dim(Y),
    dim(ttl(out23$U,
        list(out23$C[[1]]$C), m=1)))
expect_equivalent(
    dim(Y),
    dim(ttl(out24$U,
        list(out24$C[[1]]$C), m=1)))
expect_equivalent(
    dim(Y),
    dim(ttl(out25$U,
        list(out25$C[[1]]$C), m=1)))

# 2
out26 <- MultiCX(Y, rank=NULL, modes=2, thr=0.9,
    c.method="best.match")
out27 <- MultiCX(Y, rank=5, modes=2, thr=0.9,
    c.method="best.match")
out28 <- MultiCX(Y, rank=5, modes=2, thr=0.9,
    c.method="random")
out29 <- MultiCX(Y, rank=5, modes=2, thr=0.9,
    c.method="exact.num.random")
out30 <- MultiCX(Y, rank=5, modes=2, thr=0.9,
    c.method="top.scores")

expect_equivalent(
    dim(Y),
    dim(ttl(out26$U,
        list(out26$C[[2]]$C), m=2)))
expect_equivalent(
    dim(Y),
    dim(ttl(out27$U,
        list(out27$C[[2]]$C), m=2)))
expect_equivalent(
    dim(Y),
    dim(ttl(out28$U,
        list(out28$C[[2]]$C), m=2)))
expect_equivalent(
    dim(Y),
    dim(ttl(out29$U,
        list(out29$C[[2]]$C), m=2)))
expect_equivalent(
    dim(Y),
    dim(ttl(out30$U,
        list(out30$C[[2]]$C), m=2)))

# 3
out31 <- MultiCX(Y, rank=NULL, modes=3, thr=0.9,
    c.method="best.match")
out32 <- MultiCX(Y, rank=5, modes=3, thr=0.9,
    c.method="best.match")
out33 <- MultiCX(Y, rank=5, modes=3, thr=0.9,
    c.method="random")
out34 <- MultiCX(Y, rank=5, modes=3, thr=0.9,
    c.method="exact.num.random")
out35 <- MultiCX(Y, rank=5, modes=3, thr=0.9,
    c.method="top.scores")

expect_equivalent(
    dim(Y),
    dim(ttl(out31$U,
        list(out31$C[[3]]$C), m=3)))
expect_equivalent(
    dim(Y),
    dim(ttl(out32$U,
        list(out32$C[[3]]$C), m=3)))
expect_equivalent(
    dim(Y),
    dim(ttl(out33$U,
        list(out33$C[[3]]$C), m=3)))
expect_equivalent(
    dim(Y),
    dim(ttl(out34$U,
        list(out34$C[[3]]$C), m=3)))
expect_equivalent(
    dim(Y),
    dim(ttl(out35$U,
        list(out35$C[[3]]$C), m=3)))
