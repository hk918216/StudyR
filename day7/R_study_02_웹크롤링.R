## 웹 크롤링
#1. rvest 패키지 설치
install.packages('rvest')
library(rvest)

#2. 보배드림 URL 검색 -> URL가져오기
url <- 'https://www.bobaedream.co.kr/cyber/CyberCar.php?gubun=K&page=245&order=S11&view_size=20'
usedcar <- read_html(url)

#3. HTML .mode-cell.title 안에 차정보 확인
carInfors <- html_nodes(usedcar, css='.mode-cell.title')

#4. .tit.ellipsis 안에 있는 나머지 요소를 제거
cartitles <- carInfors %>% html_nodes('.tit.ellipsis') %>% html_text()

#5. 불필요한 요소 제거
cartitles <- gsub('  ','', cartitles)  # '  ' 제거
cartitles <- gsub('\r\n\t','',cartitles)

#6. 연식 가져오기
carYears <- html_nodes(usedcar, css='.mode-cell.year')
carYears

#7. css text 정보 가져오기
carYears <- carYears %>% html_nodes('.text') %>% html_text()
carYears <- carYears[2:length(carYears)]

#8. 연료 정보 가져오기
carFuels <- html_nodes(usedcar, css='.mode-cell.fuel')

#9. css text 정보 가져오기
carFuels <- carFuels %>% html_nodes('.text') %>% html_text()
carFuels <- carFuels[2:length(carFuels)]
carFuels <- factor(carFuels)

#10. 정제
# cartitles[수정하고싶은 행번호] <- '대체할 값'

#11. 합치기
carUsed <- data.frame(cartitles,carYears,carFuels)

#12. 차트데이터셋 만들기
ds <- table(carUsed$carFuels)
ds <- data.frame(ds)

#13. 차트 만들기
library(ggplot2)

ggplot(data = ds, aes(x=Var1, y=Freq, fill=Var1))+
  geom_bar(stat='identity')+
  ggtitle('보배드림 1페이지 외제차 연료별') +
  theme(plot.title = 
          element_text(size=16,
                       face = 'bold',
                       color = 'steelblue',
                       hjust = 0.5)) +
  labs(x ='연료별',y='차량수')
