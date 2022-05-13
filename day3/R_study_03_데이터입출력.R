## 데이터 입출력
age <- c(28,17,35,46,23,67,30,50)
class(age)
str(age)

min(age)
max(age)
cat('가장 젊은 나이는',min(age),'세 이고\n가장 많은 나이는',max(age),'세 입니다.')

# 화면에서 데이터 입력받기
library(svDialogs)
user.input <- dlgInput('수입을 입력하세요.')$res
income <- as.numeric(user.input)
tax <- income * 0.05

# 5e+05 -> 500000으로 변경해서 출력
options(scipen = 1) 
cat('세금',tax,'원')

x<-1
y <- 10
print(iris[1:6,])  # = head(iris)
cat(iris[1:6,])  # 안됨

## LAB 체질량 지수 계산1
height <- dlgInput('키를 입력하세요(cm)',)$res
weight <- dlgInput('몸무게를 입력하세요(kg)',)$res

height <- as.numeric(height)
weight <- as.numeric(weight)
height.res <- height / 100
bmi <- weight / (height.res^2)

cat('키',height,'cm, 몸무게',weight,'kg\n체질량 지수',bmi,'입니다.\n(25이상 과체중. 30이상 비만)')

#숫자 천단위 콤마
install.packages('formattable')
library(formattable)

num.data <- c(1250000, 22500, 123.456, 123.444, 1789.34)
comma(num.data)


## 파일 입출력
getwd()
setwd('C:/STUDY/StudyR')

# CSV 파일 읽기
air.quality <- read.csv('./day3/airquality.csv',header =T)  #header=F 하면 헤더값도 하나의 값으로 취급.
head(air.quality)
tail(air.quality)
str(air.quality)

setosa.iris <- subset(iris, Species=='setosa')
str(setosa.iris)
# row.names = F -> 행번호 같이저장 안됨
write.csv(setosa.iris,'./day3/setosa_iris.csv', row.names = F)

## 엑셀 읽고 쓰기
air.quality.xlsx <- read.xlsx('./day3/airquality.xlsx',header=T,sheetIndex=1)  #오류. 다음시간에 정비

## LAB 다이아몬드 정보
library(ggplot2)
diamonds
str(diamonds)

levels(diamonds$cut)
levels(diamonds$color)
levels(diamonds$clarity)

diamonds.new <- subset(diamonds, cut == 'Premium' & carat >=2)
write.csv(diamonds.new, './day3/shiny_diamonds.csv', row.names = F)

diamonds.new.without.D <- subset(diamonds.new, color != 'D' & color != 'H')
write.csv(diamonds.new.without.D, './day3/shiny_diamonds_without_DH.csv', row.names = F)
