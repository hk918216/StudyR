## 데이터 탐색
# 단일범주
library(carData)

tData <- Titanic
tData2 <- TitanicSurvival
str(tData2)

room.class <- TitanicSurvival$passengerClass
table(room.class)

tbl <- table(room.class)
sum(tbl)

barplot(tbl, main='선실별 탑승객 수',xlab = '선실등급',ylab = '탑승객 수',
        col = c('blue','green','purple'),names=c('1등실','2등실','3등실'))

tbl / sum(tbl)

library(plotrix)
pie3D(tbl, main='선실별 탑승객 수',radius = 1.5,
      col = c('blue','green','purple'),labels=c('1등실','2등실','3등실'),
      labelcol = 'white',labelcex = 1.0,explode = 0.1)

# 생사여부, 성별 모두 위와 동일

# 단일변수 수치형
state.x77
grads <- state.x77[,'HS Grad']

summary(grads)
min(grads)
var(grads)

hist(grads,main = '주별 졸업률', xlab = '졸업률',ylab = '주의 개수',
     col = 'orange')

boxplot(grads, main = '주별 졸업률',col='green')
idx <- which(grads == min(grads))
grads[idx]

idx <- which(grads < mean(grads))
grads[idx]



## 74~79 영국 폐질환 사망자 데이터
ds <- read.csv('C:/STUDY/StudyR/day5/fdeaths.csv', header = T,
               row.names = 'year')
my.col <- c('orange','blue','red','green','purple','darkgray')
my.lty <- 1:6
  
plot(1:12,                            # x축데이터    
     ds[1,],                          # y축데이터
     main='월별 사망자 추이',         # 그래프 제목   
     type='b',                        # 포인트 타입
     lwd = 2,                         # 라인 두께
     lty=my.lty[1],                   # 라인 종류
     xlab = '월',                     # x축 라벨
     ylab = '사망자수',               # y축 라벨
     las=1,                           # y축 수치 가로방향으로 전환
     ylim = c(300,1200),              # y축 범위
     col = my.col[1],                 # 선의 색
     ) 

for (i in 2:6) {
  lines(1:12,
        ds[i,],
        type= 'b',
        lty = my.lty[i],
        col = my.col[i]
        )
}
legend(x='topright',
       legend=rownames(ds),
       lty = my.lty,
       lwd = 2,
       col = my.col,
       inset = c(0,0)
       )


## LAB 미국 자동차 판매가격 데이터
library(DAAG)
str(carprice)
carprice$Price
range(carprice$Price)
summary(carprice$Price)

hist(carprice$Price, 
     main='자동차 가격 분포',
     xlab='가격대($1,000)',
     ylab = '빈도수',
     col = rainbow(8)
     )

tbl <- table(carprice$Type)
barplot(tbl,
        main = '차종별 빈도수',
        xlab = '차종',
        ylab = '빈도수',
        col = rainbow(length(tbl))
        )
summary(tbl)     

idx <- which(carprice$Price == max(carprice$Price))
carprice[idx, c('Type','Price')]


## 다중변수 탐색(분석)
pressure
plot(pressure$temperature, 
     pressure$pressure,
     main = '온도와 기압',
     xlab = '온도(섭씨)',
     ylab = '기압',
     type = 'b'
     )
