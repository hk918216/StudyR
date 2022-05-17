## 그래프2
# 원그래프(pie chart)
favorite.season <- c('WINTER','SUMMER','SPRING','SUMMER','SUMMER','FALL',
                     'FALL','SUMMER','SPRING','SPRING','SUMMER','SUMMER')
ds <- table(favorite.season)
pie(ds, main='선호계절',radius = 1)

# 원그래프2
install.packages('plotrix')
library(plotrix)
                          # 라벨 이름       라벨 색상          라벨 글자 크기  파이 쪼개짐
pie3D(ds, mian='선호계절',labels=names(ds), labelcol = 'black', labelcex = 1.0, explode = 0.1, radius = 1.5,
      col=c('orangered','seagreen4','skyblue','white'))


# 선그래프
month = 1:12
late = c(5,8,7,9,4,6,12,13,8,6,6,4)          # lty - 선의 종류, lwd - 선의 굵기
plot(month,late, main='지각생 통계', type='o', lty = 1, lwd=2, xlab = '월', ylab = '지각생 수', las=1)

# 선그래프 2개 이상
month = 1:12
late1 = c(5,8,7,9,4,6,12,13,8,6,6,4)          # lty - 선의 종류, lwd - 선의 굵기
late2 = c(4,6,5,8,7,8,10,11,6,5,7,3)
plot(month,late2, main='지각생 통계', type='o', lty = 1, lwd=2,
     xlab = '월', ylab = '지각생 수', ylim = c(2,15), las=1, col='red')
lines(month,late1, type='b', col='blue')

## LAB
install.packages('DAAG')
library(DAAG)
View(science)

ds <- table(science$like)
length(ds)

pie(ds, radius = 1, main='선호 점수별 비율', col = rainbow(length(ds)))

pie3D(ds, radius = 1, main='선호 점수별 비율', col = rainbow(length(ds)),
      labels=names(ds), labelcol = 'black', labelcex = 1.0, explode = 0.1)

### 산점도
wt <- mtcars$wt
mpg <- mtcars$mpg


plot(wt,mpg,main='중량-연비 산점도',xlab = '중량', ylab = '연비', las=1,
     col='red', pch=19)

srt(mtcars)
# 아래의 세가지 산점도는 동일
plot(mtcars$wt, mtcars$mpa)
plot(mtcars[,c('wt','mpg')])
plot(mpg~wt, data=mtcars)

vars <- c('mpg','disp','drat','wt')
target <- mtcars[vars]
plot(target,main='다중 산점도')

## IRIS
iris.2 <- iris[,3:4]
levels(iris$Species)
group <- as.numeric(iris$Species)
color.3 <- c('red','green','blue')
plot(iris.2, main = '붓꽃 꽃잎 길이-넓이 산점도',
     pch=group, col=color.3[group], xlab='꽃잎길이', ylab='꽃잎넓이', las=1)
legend(x='bottomright', legend = levels(iris$Species), pch = (1:3), col=color.3)


## LAB 자동차의 선팅 분석하기
library(DAAG)
str(tinting)

plot(tinting$it, tinting$csoa)

group <- as.numeric(tinting$tint)
color <- c('red','green','blue')
plot(tinting$it, tinting$csoa, col=color[group],pch=c(group))

## 호주의 사회복지 서비스와 만족도
library(DAAG)
str(socsupport)

library(plotrix)
ds <- table(socsupport$age)
pie3D(ds, main='연령분포',labels = names(ds),labelcex = 1.0, radius = 1.5, explode = 0.1,
      col=rainbow(length(ds)))

group <- as.numeric(socsupport$gender)
color <- c('blue','red')
plot(socsupport[,c('emotionalsat','tangiblesat','age')], pch=group, col=color[group])





