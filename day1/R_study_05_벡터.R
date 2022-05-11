## 벡터 = 파이썬 리스트
#학생 성적
score <- c(68,95,83,76,90,80,85,91,82,70)
mean(score)

score

c(51:80)
v <- 51:80
mean(c(51:80))


x<- c(1,2,3)
x1<-1:3
y<-c('a','b','c')
z <-c(TRUE, FALSE, F,T)

w <-c(1,2,3,4,5,'6') # 문자하나라도 들어가면 모두 문자로 전환

v3 <- seq(1, 100, 3)  #1부터 100까지 3씩 증가하면서 값 출력

v4 <- seq(0.1 , 1.0 , 0.1)
v4

v5 <- rep(1, time=5)
v6 <- rep(1:5, time=3)
v7 <- rep(c(1,3,5), times=3)
v8 <- rep(seq(1,10,2),time=2)
v9 <- rep(c('a','b', 3), each=4)


#벡터 이름 붙이기
absent = c(8,2,0,4,1)
absent
names(absent) <- c('Mon','Tue','Wed','Thu','Fri')

absent[0]   #인덱스는 1부터 시작
absent[1]
absent[6]   # 값이 없으므로 NA 로 출력하지만 에러는 안남
absent['Mon']

vec.1 <- c('Mon','Tue','Wed','Thu','Fri')
names(vec.1) <- c(1,2,3,4,5)
names(vec.1)
vec.1
vec.1[0]

var.1 <- 10
var.1 <- '10'
var.1 <- T





