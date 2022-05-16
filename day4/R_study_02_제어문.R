## 제어문
# if 문

job.type <- 'A'

if(job.type == 'B') {  # job.type = 'B' 은 사용불가
  bonus <- 200
} else {
  bonus <- 100
}
print(bonus)

# --------------------
a <- 10
b<-20
if (a > 5 & b>5) {
  print(a + b)
}
if (a >5 | b >30) {
  print(a*b)
}

#ifelse(비교 조건, 조건이 참일 때 선택할 값, 조건이 거짓일 때 선택할 값)

a <- 10; b<-20
if(a>b) {
  c <- a
} else {
  c <- b
}
print(c)

c <- ifelse(a>b, a,b)

## 반복문
# for문
for (i in 1:5){
  print(i)
}

for (i in 1:5){
  cat(i,'')
}

# 구구단 -2단
for(y in 1:9){
  cat('2 x',y,'=',2*y,'\n')
}

# 구구단 - 파이썬과 비교
for(x in 2:9){
  for(y in 1 :9) {
    cat(x,'x',y,'=',x*y,' ')
  }
  cat('\n')
}

# 짝수 확인
for (i in 1:20) {
  if(i %% 2 == 0){
    cat(i, ' ')
  }
}

#iris 꽃잎 크기 분류
norow <- nrow(iris)
mylabel <- c()
for (i in 1:norow){
  if(iris$Petal.Length[i] <= 1.6){
    mylabel[i] <- 'L'
  } else if (iris$Sepal.Length[i] >= 5.1){
    mylabel[i] <- 'H'
  } else {
    mylabel[i] <- 'M'
  }
}
print(mylabel)
str(mylabel)
newds <- data.frame(iris$Petal.Length, mylabel, iris$Species)

write.csv(newds, './day4/iris_petal.csv', row.names = F)


#while 문 - 조건이 참인 동안 계속 반복
sum <- 0
i <- 1
while (i <= 100) {
  sum <- sum+i
  i <- i+1
}
print(sum)

#사용자 정의 함수
mymax <- function(x,y){
    num.max <- x
  if (y>x){
    num.max <- y
  } 
    return(num.max)
}
 max(1,2)
mymax(1,3)
max(1,2,3,4,5)
mymax(1,2,3,4,5)  # 두 개 이상 안됨...

mydiv <- function(x,y=2){
  result <- x /y
  return(result)
}
mydiv(10,3)
mydiv(10)

myfunc <- function(x,y) {
  val.sum <- x+y
  val.mul <- x*y
  return(list(sum=val.sum, mul=val.mul))
}
result <- myfunc(5,8)
result$sum
result$mul


## 내장함수 apply(데이터셋, 행/열 방향 지정, 적용 함수)
apply(iris[,1:4], 2, mean)      # 행/열 방향 지정 : 행 방향 작업의 경우 1, 열 방향 작업의 경우 2를 지정.
apply(iris[,1:4], 2, sum)




