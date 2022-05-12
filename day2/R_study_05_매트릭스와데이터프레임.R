## 매트릭스와 데이터프레임
z <- matrix(1:20, nrow=4, ncol = 5)
z2 <- matrix(1:20, nrow=4, ncol=5, byrow=T)

z[1,3]

x <- 1:4
y <- 5:8
z3 <- matrix(1:20, nrow=4, ncol=5, byrow=T)

m1 <- cbind(x,y)
m1
m2<-rbind(x,y)
m2

m3 <- rbind(m2, x)
m3.1 <- cbind(m2,x)  #cbind는 컬럼(열)으로 붙임. 갯수가 맞지 않아서 결과 안나옴

m4 <- cbind(z,x)

rbind(z,x)
