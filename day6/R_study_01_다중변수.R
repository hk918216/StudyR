## 다중변수 데이터
# 데이터 확인
head(cars)

plot(cars$speed,
     cars$dist,
     main='자동차 속도와 제동거리',
     xlab = '속도',
     ylab = '제동거리')

cor(cars$speed, cars$dist)  #속도와 제동거리의 상관관계

class(state.x77)
st <- data.frame(state.x77)
class(st)

plot(st)

cor(st$Life.Exp, st$Murder)
cor(st$Illiteracy, st$Murder)


## LAB 경제지표
str(longley)

df <- longley[,c('GNP','Unemployed','Armed.Forces','Population','Employed')]
plot(df)
cor(df)


getwd()
load('./result_sales_dt.RData')
# RDATA 저장
save(result_sales_dt, file='./result_dt.RData')

## 실전분석
install.packages('Ecdat')
library(Ecdat)
str(Hdma)

tbl <- table(Hdma$deny)
tbl2 <- tbl / sum(tbl)


names(tbl) <- c('승인','거절')
names(tbl2) <- c('승인','거절')

barplot(tbl2,
        main = '주택담보대출 승인/거절 비율',
        col = c('green','red'),
        ylim = c(0,1),
        las = 1,
        ylab = '거절비율')

barplot(tbl,
        main = '주택담보대출 승인/거절 건수',
        col = c('green','red'),
        ylim = c(0,2500),
        las = 1,
        ylab = '거절건수',
        )

hist(Hdma$lvr,
     main = 'LTV',
     col = rainbow(10),
     ylim = c(0,1200),
     las = 1
     )

# dir 수입대비 보증금 비율. hir 수입대비 주택유지비용
# ccs 고객신용등급. mcs 대출신용등급    -> 상관관계그리기
df <- Hdma[,c('dir','hir','ccs','mcs')]
point.color <- c('green','red')
plot(df, col = point.color[Hdma$deny])
cor(df)

