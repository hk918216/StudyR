## 벡터 심화

d <- c(1,2,3,4)
f <- 2*d
d-5
3*d+4

x <- c(1,2,3,4)
y <- c(5,6,7,8)
x + y 
x - y
x * y
z <- x+ y

#벡터와 벡터연산
m <- c(x, y)
m
n <- c(y, x)
n
p <- c(m,n,90,100)


#벡터 연산2
v1 <- c(1,2,3)
v2 <- c('John','Jane','Tom')
v3 <- c(v1,v2)
v4 <- c(v1, T,F,T,v2)


##벡터사용함수
datas <- 1:10
sum(datas)
sum(2*datas)
length(datas)
mean(datas)
sort(datas)
sort(datas, decreasing = T)


v2 <- sum(datas)/ length(datas)

var(datas)   #분산
sd(datas)    #표준편차

##논리연산자
d <- 1:9
d
d <= 5

d[d>5]
sum(d>5)  # TRUE 개수 출력
sum(d[d>5])
condi<- d > 5 & d < 8
d[condi]


