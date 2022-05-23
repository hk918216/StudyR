## 데이터전처리
z <- c(1,2,3,NA,5,NA,7,8,9,10)
z
summary(z)

is.na(z)
sum(is.na(z))
sum(c(T,T,F))
sum(z, na.rm = T)   #na.rm = T -> NA 제외 하고

#결측값 제거/대체
z1 <- c(1,2,3,NA,5,NA,7)
z2 <- c(5,8,1,NA,3,NA,7)
z1[is.na(z1)] <- 0   # NA 값을 0으로 대체
z3 <- as.vector(na.omit(z2))  #z2의 NA 값 제거

z4 <- c(1,2,3,NA,5,NA,7)
z4[is.na(z4)] <- ceiling(sum(z4, na.rm = T) / length(z4)) #NA가 중앙값으로 치환

## 2차원 결측값
iris.na <- iris
iris.na[1,2] <- NA
iris.na[1,3] <- NA
iris.na[2,3] <- NA
iris.na[3,4] <- NA
head(iris.na)


## 결측값 확인 방법
for (i in 1:ncol(iris.na)) {
  this.na <- is.na(iris.na[,i])
  cat(colnames(iris.na)[i], '\t', sum(this.na), '\n')
}

# apply 이용 방법
col_na = function(y){
  return(sum(is.na(y)))
}
na_count <- apply(iris.na, 2, FUN = col_na)

# 결측값 확인 (행별)
result <- rowSums(is.na(iris.na))
sum(result > 0)        # NA가 포함된 행의 개수
sum(is.na(iris.na))    # 데이터셋 전체에서 NA 개수

## 매트릭스 NA 제외 전처리
head(iris.na)
iris.na[complete.cases(iris.na),] # NA가 없는걸 표시 / NA가 포함된 행들을 제거
iris.na[complete.cases(iris.na) == F,]  # NA가 포함된 행들을 나타냄
iris.na[!complete.cases(iris.na),]  # NA가 포함된 행들을 나타냄

iris.comp <- iris.na[complete.cases(iris.na),]


## LAB 전 세계 국가들의 통계데이터 분석
library(carData)
str(UN)
levels(UN$region)

col_na <- function(y){
  return(sum(is.na(y)))
}
apply(UN,2,FUN = col_na)

mean(UN$lifeExpF, na.rm = T)

tmp <- UN[,c('pctUrban','infantMortality')]
tmp <- tmp[complete.cases(tmp),]
length(tmp$pctUrban)
colMeans(tmp)
mean(tmp$pctUrban)

tmp.asia <- subset(UN, region=='Asia')
mean(tmp.asia$fertility)


## 정렬
v1 <- c(1,7,6,8,4,2,3,9)
sort(v1, decreasing = T)

name <- c('정대일','강재구','신현석','홍길동')
sort(name)  # 오름차순
sort(name, decreasing = T)  # 내림차순

idx <- order(name)   # 2.3.1.4번째 순서에 있는 값이 순서대로 정렬됨
name[idx]

a <- c(1,2,3,4,5)
b <- c(11,24,55,23,9)
z<- rbind(a,b)
str(z)
colnames(z) <- c('C1', 'C2','C3','C4','C5')
z[,1]

## 데이터프레임 정렬
sort(iris$Sepal.Length)

sl.order <- order(iris$Sepal.Length)  # 값의 자리번호 나옴
iris[sl.order,]
iris.new <- iris[sl.order,]
iris.ag <- iris[order(iris$Species, iris$Petal.Length, iris$Sepal.Length, decreasing = T),]


## LAB 교통사고 통계 데이터
library(carData)
str(Highway1)
levels(Highway1$htype)

Highway1[order(Highway1$rate),]

tmp <- Highway1[order(Highway1$len, decreasing = T), 'len']
sum(tmp[1:10])

tmp.2 <- sort(Highway1$len, decreasing = T)

tmp <- Highway1[order(Highway1$adt), c('adt','rate')]
tmp[1:10,]

tmp <- Highway1[order(Highway1$slim, decreasing = T), c('len','adt','rate')]
tmp[1:5,]


