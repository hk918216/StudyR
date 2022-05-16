## 데이터 입출력
setwd('C:/STUDY/StudyR/day4')  #워킹디렉토리 지정
print('Hello R')

#실행결과 저장 작업
sink('result.txt', append = T)   # 텍스트파일에 저장 append -> 문서 뒤에 계속 이어 붙이기
a <- 10                          # append = F -> 파일 새로생성
b <- 20
cat('a+b =',a+b, '\n')
sink()  #sink 종료 -> 해야지 결과 저장된 저장파일 열림

sink('result.txt', append = T)
tail(iris)
sink()

## txt 파일 읽기/ 구분자는 공백 혹은 탭
air.txt <- read.table('C:/STUDY/StudyR/day4/airquality.txt',header = T, sep='')
air.txt           # 위에서 day4 까지 경로 검색했기때문에 './airquality.txt' 로 해도 결과 나옴

# csv 파일도 read.table()로 로드 가능. 단 구분자가 ','
air.csv <- read.table('C:/STUDY/StudyR/day3/airquality.csv',header = T, sep=',')
air.csv


## LAB 체질량 지수 계산2
library(svDialogs)
#마지막에 ctrl+enter로 실행 할 것
height <- dlgInput('키 입력(cm)')$res
weight <- dlgInput('몸무게 입력(kg)')$res
height <- as.numeric(height)   #문자에서 숫자로 형변환
weight <- as.numeric(weight)
height.unit <- height / 100 
bmi <- weight / (height.unit^2)

sink('bmi.txt', append = T)
cat('heigth','weight','bmi\n')
cat(height.unit * 100 , weight, bmi)
cat('\n')
sink()

result <- read.table('./bmi.txt', header= T , sep=' ')

names(result) <- c('키','몸무게','체질량지수')
write.table(result, './bmi2.txt',row.names = F)


##엑셀 패키지
install.packages('readxl')  # 엑셀 읽기용 패키지
library(readxl)
air.xlsx <- read_excel('../day3/airquality.xlsx')


install.packages('openxlsx')  # 엑셀 쓰기용 패키지
library(openxlsx)

write.xlsx(result, 'bmi_result.xlsx' , rowNames = F)

## 실전분석 차정보 조회
library(svDialogs)
library(readxl)
library(openxlsx)

carprice.new <- read.csv('./carprice.csv', header = T)
View(carprice.new)
str(carprice.new)

input.type <- dlgInput('차량타입 입력(Compact, Small, Midsize, Large, Sporty, Van)')$res
input.city <- dlgInput('최소 시내연비 입력')$res
input.city <- as.numeric(input.city)

result <- subset(carprice.new, Type == input.type & MPG.city >= input.city)

write.xlsx(result, './Van_result.xlsx', rowNames = F)


## 오라클 연동
install.packages('rJava')
install.packages('RJDBC')
library(rJava)
library(RJDBC)

# DB 연결 설정
jdbcDriver <- JDBC(driverClass = 'oracle.jdbc.OracleDriver',
                   classPath = './day4/ojdbc6.jar')



