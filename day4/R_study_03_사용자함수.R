## 외부 파일 함수 실행
getwd()
setwd('./day4')
getwd()

# 함수파일 호출
source('myFunc.R')   # myFunc.R에 함수 만들어 놈.

result <- mydiv(109,6)

## LAB 자격증 합격 여부 판단
sub1 <- c(14,16,12,20,8,6,12,18,16,10)
sub2 <- c(18,14,14,16,10,12,10,20,14,14)
sub3 <- c(44,38,30,48,42,50,36,52,54,32)
score <- data.frame(sub1, sub2,sub3)

result <- determine(score)
source('determine.R')

# 조건에 맞는 데이터 위치 리턴 함수
score.two <- c(76,84,69,50,95,60,82,71,88,84)
which(score.two==69)
which(score.two==84)
which(score.two>84)
max(score.two)
which.max(score.two)

idx <- which(score.two <=60)
score.two[idx]

score.two[idx] <- 61

idx <- which(score.two>=80)
score.two[c(2,5,7,9,10)]
score.high <- score.two[idx]

## iris 꽃잎길이가 5.0 이상인 건 (iris.big.1와 iris.big.2 둘다 값 같음)
idx <- which(iris$Petal.Length > 5.0)
idx
iris.big.1 <- iris[idx,]

iris.big.2 <- subset(iris, iris$Petal.Length>5.0)


## LAB 언어발달 상황 진단 프로그램
install.packages('Stat2Data')
library(Stat2Data)
data("ChildSpeaks")

# 말문 트인 개월수로 등급 부여
idx <- which(ChildSpeaks$Age < 9)
ChildSpeaks[idx,]
ChildSpeaks[idx,'m1'] <- 5

idx <- which(ChildSpeaks$Age >= 9 & ChildSpeaks$Age < 14)
ChildSpeaks[idx,'m1'] <-4

idx <- which(ChildSpeaks$Age >= 15 & ChildSpeaks$Age < 21)
ChildSpeaks[idx,'m1'] <-3

idx <- which(ChildSpeaks$Age >= 21 & ChildSpeaks$Age < 27)
ChildSpeaks[idx,'m1'] <-2

idx <- which(ChildSpeaks$Age >= 27)
ChildSpeaks[idx,'m1'] <-1

# 언어 이해력 점수(Gesell) 등급환산
idx <- which(ChildSpeaks$Gesell < 70)
ChildSpeaks[idx,'m2'] <- 1

idx <- which(ChildSpeaks$Gesell >= 70 & ChildSpeaks$Gesell < 90)
ChildSpeaks[idx,'m2'] <- 2

idx <- which(ChildSpeaks$Gesell >= 90 & ChildSpeaks$Gesell < 110)
ChildSpeaks[idx,'m2'] <- 3

idx <- which(ChildSpeaks$Gesell >= 110 & ChildSpeaks$Gesell < 130)
ChildSpeaks[idx,'m2'] <- 4

idx <- which(ChildSpeaks$Gesell >= 130)
ChildSpeaks[idx,'m2'] <- 5

ChildSpeaks$total <- ChildSpeaks$m1 + ChildSpeaks$m2

idx <- which(ChildSpeaks$total <3)
ChildSpeaks[idx,'result'] <- '매우 늦음'

idx <- which(ChildSpeaks$total >= 3 &ChildSpeaks$total < 5)
ChildSpeaks[idx,'result'] <- '늦음'

idx <- which(ChildSpeaks$total >= 5 &ChildSpeaks$total < 7)
ChildSpeaks[idx,'result'] <- '보통'

idx <- which(ChildSpeaks$total >= 7 &ChildSpeaks$total < 9)
ChildSpeaks[idx,'result'] <- '빠름'

idx <- which(ChildSpeaks$total >=9)
ChildSpeaks[idx,'result'] <- '매우 빠름'

ChildSpeaks[which.min(ChildSpeaks$total),]


## 종업원 팁 분석
install.packages('reshape2')
library(reshape2)
str(tips)

View(tips)
#성별 따라 주는 팁 정도
idx <- which(tips$sex == 'Female')
avg.F <- mean(tips[idx,'tip'])

idx <- which(tips$sex == 'Male')
avg.M <- mean(tips[idx,'tip'])

#흡연 유무 따라 팁 주는 정도
idx <- which(tips$smoker == 'Yes')
avg.smoker <- mean(tips[idx,'tip'])
idx <- which(tips$smoker == 'No')
avg.nonsmoker <- mean(tips[idx,'tip'])

#----------------------------------------------
meanbycol.tip <- function(colname){
  value <- unique(tips[, colname])     # 값의 종류를 구함
  result <- list()
  for(i in 1:length(value)){              # 값의 종류별로 평균 구함
    idx <- which(tips[,colname] == value[i])  # 하나의 값에 해당하는 인덱스 구함
    result[i] <- mean(tips[idx,'tip'])        # 인덱스로 해당 값의 평균 구해 저장
  }
  names(result) <- value     # 결과값에 이름 붙임
  return(result)             # list 결과값 반환
}
source('myfunc.R')      #작성을 마치면 스크립트 파일을 ‘myfunc.R’로 저장한다
meanbycol.tip('sex')
meanbycol.tip('smoker')
meanbycol.tip('size')
meanbycol.tip('day')

# 결제 금액 대비 받은 팁의 비율
categorize.tip <- function(tips){
  tip_ratio <- tips$tip/tips$total_bill * 100
  class <- c()
  for(i in 1:nrow(tips)){
    if(tip_ratio[i] < 10){
      class[i] <- 1
    } else if(tip_ratio[i] < 15){
      class[i] <- 2
    } else if(tip_ratio[i] < 20){
      class[i] <- 3
    } else{
      class[i] <- 4
    }
  }
  tips.new <- cbind(tips, type = class, ratio = tip_ratio)
  return(tips.new)
}
source('myfunc.R')
tips.new <- categorize.tip(tips)











