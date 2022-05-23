## 함수
y <- sqrt(100)  #제곱근계산
y <- sqrt(x =100)

d <- c(1,7,4,2,3)

sort(d)   #오름차순 정렬 출력
sort(x=d, decreasing = T)    # decreasing = F 오름차순 정렬, T = 내림차순 정렬

y <- c(1,7,4,2,3,NA)
sort(x=y)
sort(x=y, decreasing = T)   # NA 안나옴
sort(x=y, decreasing = T, na.last = T)  # NA 포함 내림차순 NA 마지막에 출력
sort(x=y, decreasing = T, na.last = F)  # NA 포함 오름차순 NA 처음에 출력


# 문자열 붙이기 함수
str <- paste('Hello', 'World','!')   #갯수 제약 없음. str 없어도 가능
paste('Hello', 'World','!', sep = ' | ')

a <- '제 나이는'
b <- 25
c <-'입니다'
paste(a,b,c)


a <- 1:12
b <- '월'
c <- paste(a,b, sep='')

## 월별 매출액 분석
sales <- c(750,740,760,680,700,710,850,890,700,720,690,730)
names(sales) <- paste(1:12, '월', sep = '')

sales['7월']
sales['1월'] + sales['2월']
max(sales)
max.sales.month <- sort(sales, decreasing = T)
max.sales.month[1]

sum(sales[1:6])
sum(sales[7:12])
