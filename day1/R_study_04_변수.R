## 변수
total <- 5050
cat('합계 :',total)

변수 <- 100
a<-10
b<-20
c<-a+b
cat(a, b, c)

# r에서 변수 특이성은 변수명에 . 사용가능
.total <- 5051

val <- NULL
10/0  #Inf
-10/0 #-Inf
sqrt(-2) #NaN

## 숫자형 변수
age.1<-20
age.2<-25
print(age.1 +age.2)
name.1 <-'John'
print(name.1+3)

##논리형
 5>3
2 < 7
2> 7
b <- F

a<- NA
a


## 소금물의 농도
# 변수 salt  소금양
# 변수 water 물의 양
# 변수 result 농도
# 결과를 "소금 =()mg, 물=()ml : 농도=()%"  

salt <- 10
water <- 100
result<- (salt/(salt+water))*100
cat('소금 =',salt,'mg, 물 =',water,'ml : 농도 =',result, '%')



