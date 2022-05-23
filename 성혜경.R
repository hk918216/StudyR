##1번
#1-1
x <- seq(1.0, 3.0, 0.2)
x

#1-2
x <- 1:11
x <- rep(x[1:3], times= 3)
x

##2번
max.temp <- c(22,27,26,24,23,26,28)
barplot(max.temp)
barplot(max.temp,
        main = '주간 최대 기온',
        names =  c('월','화','수','목','금','토','일'),
        xlab = '섭씨',
        ylab = '요일',
        col = rainbow(7),
        horiz = T,
        las= 2)

##3번 grith volume
View(trees)

gr <- trees$Girth
vol <- trees$Volume

plot(gr, vol,
     main = '나무 둘레-용적 산점도',
     xlab = '둘레',
     ylab = '용적',
     col = 'skyblue',
     pch = 19
     )

##4번
View(airquality)

color.1 <- rep('#A8DADC',9)
color.1[1] <- '#1D3557'
color.2 <- rep('#A8DADC',5)
color.2[4] <- '#1D3557'
color.3 <- rep('#A8DADC',7)
color.3[6] <- '#1D3557'
color.4 <- rep('#A8DADC',5)
color.4[2] <- '#1D3557'

par(mfrow=c(2,2), mar=c(5,5,4,2))

hist(airquality$Ozone, main='오존분포', col=color.1, xlab = '오존')
hist(airquality$Temp, main='기온분포',breaks = 5, col=color.2, xlab = '기온')
hist(airquality$Solar.R, main='자외선분포', col=color.3, xlab = '자외선')
hist(airquality$Wind, main='풍량분포',breaks = 5, col=color.4, xlab = '풍량')

##5번
library(carData)

str(TitanicSurvival)
sum(is.na(TitanicSurvival))
t <- na.omit(TitanicSurvival) 
str(t)

class <- t$passengerClass
tbl <- table(class)
str(class)

survived <- t$survived
tbl2 <- table(survived)

a <- data.frame(survived, class)
aa <- table(a)
aaa <- aa[c(2,1),]

barplot(aaa, main='타이타닉 클래스별 생존자', col = c('red','turquoise1'),
        horiz = F, beside = F,
        names = c('Frist', 'Second','Third'),
        legend.text = c('생존자','사망자'),
        args.legend = list(x='topleft', bty='y',inset=c(0.12,0)))






