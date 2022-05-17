## 다중그래프
par(mfrow=c(2,2), mar=c(3,3,4,2))  #화면분할2X2

hist(iris$Sepal.Length, main='붓꽃 꽃받침 길이', col='orange')  #히스토그램

table(mtcars$cyl)
barplot(table(mtcars$cyl), main = '자동차 실린더', col = c('red','green','blue'))

barplot(table(mtcars$gear), main = '자동차 기어수', col = rainbow(3), horiz = T)

pie(table(mtcars$cyl), main='자동차 실린더',col = topo.colors(3), radius = 1)

par(mfrow=c(1,1), mar=c(5,4,4,2)+.1) #화면복귀

## LAB 정책 지지도 그래프
install.packages('carData')
library(carData)

ds <- Chile
colors <- rainbow(20)

par(mfrow=c(2,3))  #, mar=c(3,3,4,2)
ds_region <- table(ds$region)  #2700 행의 (C,M,N,S,SA) 의 개수 취합해서 하나의 테이블로 보여줌
ds_gender <- table(ds$sex)
ds_edu <- table(ds$education)
barplot(ds_region, main='지역별 분포',col=colors[1:5])
barplot(ds_gender, main='성별 분포',col=colors[6:7])
barplot(ds_edu, main = '교육수준별 분포', col=colors[8:10])
hist(ds$age, breaks = 6,main='연령별',xlab = 'ages',col=colors[11:16])
hist(ds$income, breaks = 4, main='수입별',col = colors[17:20])
hist(ds$statusquo, breaks = 9,main='지지도', col = colors[11:19])

## 종업원 팁 정보 그래프
library(reshape2)
str(tips)

#색상
color.6 <- rep('#A8DADC',6)
color.6[2] <- '#1D3557'
color.4 <- rep('#A8DADC',4)
color.4[2] <- '#1D3557'
color.4[3] <- '#457B9D'
color.2 <- c('#A8DADC','#1D3557')
color.2[2]

par(mfrow=c(2,2))
barplot(table(tips$sex),main='성별',col = color.2)
barplot(table(tips$day),main='요일별',col = color.4)
barplot(table(tips$time),main='시간대별',col=c(color.2[2],color.2[1]))
barplot(table(tips$size),main='인원수별',col = color.6)

par(mfrow=c(1,1))

#-----------------
tips.new <- tips
tips.new$perHead <- tips.new$total_bill/tips.new$size

## 1행 3열로 1인당 주문금액별 차트 그리기
color.5 <- rep('#A8DADC',5)
color.5[2] <- '#1D3557'

par(mfrow=c(1,3))  # = (, mar=c(5,4,4,2)+.1)

hist(tips.new$perHead, breaks = 5,main='1인당 주문액',xlab = '단위:$',ylab = '빈도수',col = color.5)

lunch.perHead <- tips.new[tips.new$time == 'Lunch','perHead']
hist(lunch.perHead, breaks = 4,main='1인당 주문액(점심)',xlab = '단위:$',ylab = '빈도수',col = color.5)

dinner.perHead <- tips.new[tips.new$time == 'Dinner','perHead']
hist(dinner.perHead, breaks = 4,main='1인당 주문액(저녁)',xlab = '단위:$',ylab = '빈도수',col = color.5)

par(mfrow=c(1,1))


## 주문금액 대비 팁 비율
tips.new$percent <- (tips.new$tip/tips.new$total_bill) * 100

par(mfrow=c(1,2))
res.lunch <- hist(tips.new[tips.new$time == 'Lunch', 'percent'], main = '주문액 비율 팁비율(점심)',
                  xlab = 'per(%)', breaks = 5)
res.dinner <- hist(tips.new[tips.new$time == 'Dinner', 'percent'], main = '주문액 비율 팁비율(저녁)',
                  xlab = 'per(%)', breaks = 5)

par(mfrow=c(1,1))

res.lunch$counts
res.dinner$counts[1:6]

res <- rbind(lunch=c(0,res.lunch$counts),
      dinner=res.dinner$counts[1:6])
colnames(res) <- res.dinner$breaks[2:7]

barplot(res, main = '식사시간에 따른 팁비율 분포', col = color.2,
        legend.text = c('Lunch','Dinner'), las=2)
