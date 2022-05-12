## 팩터와 리스트
# 팩터
bt <- c('A','B','B','O','AB','A')
bt.new <- factor(bt)
bt[5]
bt.new[5]
levels(bt.new)
as.integer(bt.new)  #문자값을 숫자로 변경하여 출력

bt.new[7] <- 'B'
bt.new
bt.new[8] <- 'C'   #요인의 수준(factor level)이 올바르지 않아 NA가 생성되었습니다. NA할당
bt.new[9]   # 아예 값이 없음

#리스트
h.list <- c('balling','tennis','ski') #벡터
person <- list(name='Tom', age='25', student=T,hobby=h.list)
person[[1]]
person[['name']]
person$name
person$hobby[1]


## R 카페 매출 분석2
cafe <- list(espresso = c(4,5,3,6,5,4,7),
             americano = c(63,68,64,68,72,89,94),
             americano = c(61,70,59,71,71,92,88),
             price = c(2000,2500,3000),
             menu = c('espresso','americano','latte'))

sale.espresso <- cafe$espresso * cafe$price[1]

cafe$menu <- factor(cafe$menu)
names(cafe$price) <- cafe$menu

sale.espresso <- cafe$espresso * cafe$price[1]
sale.espresso <- cafe$espresso * cafe$price['espresso']

sale.americano <- cafe$americano * cafe$price[2]

sale.latte <- cafe$americano * cafe$price[3]

sale.day <- sale.espresso + sale.americano + sale.latte
sale.total <- sum(sale.day)
sale.mean.new <- mean(sale.day)

names(sale.day) <- c('Mon','Tue','Wed','Thu','Fri','Sat','Sun')

names(sale.day[sale.day >= sale.mean.new])

##월별 감전사고 통계 분석
accident <- c(31,26,42,47,50,54,70,66,43,32,32,22)
mon <- 1:12
mon.name <- paste('M', mon, sep='')
mon.name
names(accident) <- mon.name

sum(accident)
max(accident)
min(accident)

accident - (accident * 0.1)  #사고율이 10% 감소하면 사고수를 예측
accident+0.9

names(accident[accident >=50])

mean((accident))
accident[accident >= mean(accident)]
