## 매트릭스 계속

z <- matrix(1:20, nrow=4, ncol = 5, byrow=T)
x <- c(20,25,30,35)
m1 <- cbind(z,x)  # 컬럼(열)으로 붙인다
rbind(z,x)  # 안됨

y <- 36:41
m2 <- rbind(m1,y)  #행기준 결합


# 값추출
m2[1,3]
m2[1,6]

z
z[1,6]
z[1,5]
z[4,5]

z[2,1:3]   #2행에 1열부터 3열까지
z[1,c(1,2,4)]
z[1:3,4]   #1,2,3행의 4열값
z[1:2,c(2,4)]
z[,]
z[,c(1,4)]   #1,4열 전부 


#매트릭스 이름붙이기
score <- matrix(c(90,85,69,78,85,96,49,95,90,80,70,60), nrow = 4)
rownames(score) <- c('John','Tom','Mark','Jane')
colnames(score) <- c('English','Math','Science')

score['John','Math']
score['Tom',]
score[,'Science']
colnames(score)[2]

##LAB 햄버거 영양성분 정보 제공하기
#스스로
m <- c(514,917,11)
l <- c(533,853,13)
b <- c(566,888,10)

burger <- rbind(m,l,b)
colnames(burger) <- c('열량','나트륨','포화지방')

#강의
burger2 <- matrix(c(514,533,566,917,853,888,11,13,10), nrow=3)
rownames(burger2) <- c('Macdonald','Lotteria','Burgerking')
colnames(burger2) <- c('Kcal','Na','Fat')

burger3 <- matrix(c(514,917,11,533,853,13,566,888,10), nrow=3, byrow=T)

burger['m','나트륨']

# 데이터프레임
physical <- matrix(c(160,169,62,65,'M','F'), nrow = 2)  #벡터와 같이 문자를 넣으면 모두 문자로 바뀜

city <- c('Seoul','Tokyo','Washington')
rank <- c(1,3,2)
city.info <- data.frame(city,rank)

## iris 데이터 셋
iris
head(iris)
tail(iris)
str(iris)    # 요약정보 보기

levels(iris[,5])
iris[,c('Sepal.Length','Petal.Length','Species')]

## LAB2 햄버거 영양정보2
#스스로
Menu <- c('새우버거','불고기버거','치킨버거')
burger4 <- data.frame(burger2, Menu)

#강의
kcal <- c(514,533,566)
na <- c(917,853,888)
fat <- c(11,13,10)
menu <- c('새우버거','불고기버거','치킨버거')
bur <- data.frame(kcal, na, fat, menu)
rownames(bur) <- c('맥도날드','롯데리아','버거킹')

bur.sum <- bur[,'na'] * bur[,'fat']
bur['맥도날드',]

##
dim(iris)
dim(bur)

nrow(iris)
ncol(iris)

head(iris, n=2)
head(x = iris, n =10)

# 행별, 열별 합계, 평균 산술계산
colSums(iris[,-5])  #5번째 행은 제외
colSums(iris[,-'Species'])  #오류
colSums(iris[,c(1,2)])  #최소 열이 두개이상 돼야 colSums 가능

colMeans(iris[,-5])
head(iris)

z <- matrix(1:20, nrow = 4)
t(z)
t(bur)

iris.subset.1 <- subset(iris, Species == 'setosa')   # =이 하나면 모든 값 다 나옴
iris.subset.2 <- subset(iris, Sepal.Length>5.0 & Sepal.Width>3.0)
str(iris.subset.2)

iris.subset.2$Sepal.Length

iris.subset.2[,c(1,2,5)]


a <- matrix(1:20, 4,5)
b <- matrix(21:40, 4,5)
a + b



class(iris)
str(iris)
z <- matrix(1:20,4)
class(z)
str(z)
is.matrix(iris)


## LAB 벚나무 판매
trees
class(trees)
str(trees)

girth.mean <- mean(trees$Girth)
girth.mean1 <- mean(trees[,1])

candidate <- subset(trees, Girth >= girth.mean&Height >=80 & Volume >= 50)
nrow(candidate)

# 종업원 팁계산
install.packages('reshape2')
library(reshape2)
tips

is.matrix(tips)
is.array(tips)
is.data.frame(tips)
class(tips)
str(tips)
levels(tips$day)
head(tips)
tail(tips)

table(tips$day)
class(table(tips$day))

dinner <- subset(tips, time=='Dinner')
lunch <- subset(tips, time='Lunch')
table(dinner$day)
table(lunch$day)

head(dinner)
dinner.data <- dinner[c('total_bill','tip','size')]
lunch.data <- lunch[c('total_bill','tip','size')]
str(dinner.data)
str(lunch.data)

colSums(dinner.data)
colMeans(dinner.data)
colSums(lunch.data)
colMeans(lunch.data)

tips.rate <- tips$tip/tips$total_bill
mean(tips.rate) * 100
