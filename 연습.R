purchase <- 62000
if ( purchase >= 50000){
  price <- purchase * 0.9
} else {
  price <- purchase * 0.95
}
print(price)

## ifelse
# 날씨가 '비'일때 '우산'출력 / '비'가 아니면 '모자' 출력되게
weather <- '맑음'
choice <- ifelse(weather == '비','우산','모자')
print(choice)

age <- 6

if(age < 6 ){
  group <- '영유아'
} else if(age <13) {
  group <- '어린이'
} else if(age >= 13 & age < 19){
  group <- '청소년'
} else {
  group <- '성인'
}
print(group)
cat(age,'세는', group,'입니다.')

##for
num <- 1:200
label <- c()

for (i in num) {
  label[i] <- ifelse(i%%2 != 0 , 'odd','even') 
}
print(label)
num.new <- data.frame(num, label)

i <- 1
result <-1
while (i <= 10) {
  result <- result * 2
  i <- i + 1
}
print(result)
