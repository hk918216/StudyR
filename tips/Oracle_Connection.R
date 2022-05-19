## Oracle연결
##1. RODBC 패키지 설치
# 한글해결 DBMSencoding='eur-kr' not 'utf-8'
install.packages('RODBC')  #Open DataBase Connectity
# Java DataBase Connectity = JDBC

##2. Library 연결
library(RODBC)

##3. ODBC 데이터원본(64비트) 설정
conn1 = odbcConnect('Scott_DSN',uid = 'scott',pwd = 'tiger',
                    DBMSencoding = 'euc-kr',
                    believeNRows = F)

##4.연결확인
summary(conn1)

##5.쿼리실행
res <- sqlQuery(conn1,'SELECT * FROM dept')
str(res)

sqlQuery(conn1, 'SELECT * FROM memberTBL')

##6. 접속(close)
odbcClose(conn1)
