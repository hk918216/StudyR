d <- c(1,2,3,4,5)
d
d[1]
d[1:3]
d[c(1,3,5)]  #1,3,5번째 값 출력
d[seq(1,5,2)]  #1부터 5까지 2씩 증가
d[-2]  #2번째값 제외하고 출력.   '-'는 제외한다는 뜻뜻
d[-c(2,4)]  #2,4번째 값 제외하고 출력

e <- 10:1
f <- seq(10,1,-2)


## 1~4월까지 1분기 매출액
sales <- c(640,720,680,540)
names(sales) <- c('M1','M2','M3','M4')  #이름부여
names(sales)
sales
sales[1]
sales['M2']   #M2 2월달 매출액
sales[c(1,4)]
sales[c('M2','M3')]   #2,3월 매출액

# 벡터의 원소값 변경
v1 <- c(1,5,7,8,9)
v1[2] <- 4
v1[3] <- c(2)
v1[c(1,5)] <- c(100,200)
v1 <- c(100,200,300)

#LAB 적금 만기 금액 계산하기
#   kim          lee         park        choi       seo
#5,000,000    4,500,000   4,000,000   5,500,000   6,000,000
#   3.5           3          4           5          4.5     이율
#    2            2          5           7           4      기간
# 만기금액 = 원금 * (1 + 연이율 / 100)^ 기간

customer <- c('kim','lee','park','choi','seo')
deposit <- c(5000000,4500000,4000000,5500000,6000000)
rate <- c(3.5, 3.0, 4.0, 5.0, 4.5)
period <- c(2,2,5,7,4)

names(deposit) <- customer
names(rate) <- customer
names(period) <- customer

#방법1
kim_total <- deposit['kim'] * (1 + rate['kim']/100) ^ period['kim']
lee_total <- deposit['lee'] * (1 + rate['lee']/100) ^ period['lee']

#방법2 - 최종코드
who <- 'choi'
sum <- deposit[who] * (1 + rate[who]/100) ^ period[who]

# 모든 결과 한번에 나옴
deposit * (1 + rate/100) ^ period











