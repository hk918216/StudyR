## 통계분석기법이용 가설검정
library(ggplot2)

mpg <- as.data.frame(ggplot2::mpg)

library(dplyr)
mpg_diff <- mpg%>%  #%>% > ctrl+shift+m 단축키/ 컬럼 골라줌.mpg 안에서 select해서 mpg_diff에 넣음
  select(class, cty) %>%
  filter(class %in% c('compact', 'suv'))

head(mpg_diff)

table(mpg_diff$class)

#t.test(두 집단의 평균에 통계적으로 유의한 차이가 있는지 알아볼 때 사용하는 통계 분석 기법)
t.test(data = mpg_diff, cty ~ class, var.equal = T) # T > 분산이 같다는 전제하에 실행하겠다

#일반 휘발유 고급 휘발유 도시 연비 t검정
mpg_diff2 <- mpg %>% 
  select(fl, cty) %>% 
  filter(fl %in% c('r','p'))  #regular, premium

table(mpg_diff2$fl)


##실업자 수와 개인 소비 지출의 상관관계
economics <- as.data.frame(ggplot2::economics)

#상관분석
cor.test(economics$unemploy, economics$pce)

#상관행렬 히트맵
head(mtcars)

install.packages('corrplot')
library(corrplot)

car_cor <- cor(mtcars)
round(car_cor,2)

corrplot(car_cor)
corrplot(car_cor, method = 'number')

#다양한 파라미터 지정
col <- colorRampPalette(c('#BB4444','#EE9988','#FFFFFF','#77AADD','#4477AA'))

corrplot(car_cor,
         method = "color",       #색깔으로 표현
         col = col(200),         #색상 200개 선정
         type = 'lower',         #왼쪽 아래 행렬만 표시
         order = 'hclust',       #유사한 상관계수끼리 군집화
         addCoef.col = 'black',  #상관계수 색깔
         tl.col='black',         #변수명 색깔
         tl.srt = 45,            #변수명 45도 기울임
         diag = F                #대각 행렬 제외
         )
