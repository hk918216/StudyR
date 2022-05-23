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
condi <- d > 5 & d < 8
d[condi]

## LAB 카페 매출액
#스스로
es <- c(4,5,3,6,5,4,7)
am <- c(63,68,64,68,72,89,94)
cl <- c(61,70,59,71,71,92,88)
w <- c('월','화','수','목','금','토','일')
names(es) <- w
names(am) <- w
names(cl) <- w

es.total <- es*2000

#w.강의
esp <- c(4,5,3,6,5,4,7)
ame <- c(63,68,64,68,72,89,94)
lat <- c(61,70,59,71,71,92,88)
price <- c(2000,2500,3000)
names(price) <- c('espresso','americano','latte')

sale.esp <- price['espresso'] * esp
sale.ame <- price['americano'] * ame
sale.lat <- price['latte'] * lat

sale.day <- sale.esp + sale.ame + sale.lat
sale.day
names(sale.day) <- c('Mon','Tue','Wed','Thu','Fri','Sat','Sun')

sale.sum <- sum(sale.day)
cat('총 매출액 :',sale.sum,'원')

sale.mean <- mean(sale.day)
cat('평균 매출액 :',sale.mean,'원')

result <- names(sale.day[sale.day >= sale.mean])
cat('평균 매출액보다 높은 요일 :', result)


