## 고급그래프
# treemap
install.packages('treemap')
library(treemap)

data(GNI2014)
str(GNI2014)

treemap(GNI2014, index = c('continent','iso3'),
        vSize = 'population', vColor = 'GNI',
        title = '대륙간 인구수/GNI',
        type = 'value', na.rm = T,
        #bg.labels = 'yellow' 사용불가
        )

## LAB 미국 주요도시 통계 데이터 분석
library(carData)
head(Ericksen)
str(Ericksen)

ds <- subset(Ericksen, city=='state')  #city가 state인것만
ds$stname <- rownames(ds)  #행 이름이 하나의 열로 추가됨

treemap(ds, index = c('stname'),
        vSize = 'poverty', vColor = 'crime',
        type = 'value',    # 타일 컬러링 방법
        title = '미국 주요 도시 통계 범죄율/빈곤율',
        )

## 방사형 차트
install.packages('fmsb')
library(fmsb)

score <- c(80,60,95,85,40)
max.score <- rep(100,5)   # 100을 5회 반복
min.score <- rep(0,5)
ds <-rbind(max.score,min.score, score)
ds <- data.frame(ds)
class(ds)
colnames(ds) <- c('국어','영어','수학','물리','음악')

radarchart(ds)

##매개변수(옵션)
# R에서는 RGB(RR,GG,BB,투명도AA)
radarchart(ds, 
           pcol = 'darkgreen',    # 다각형 선의 색
           pfcol = '#337E7F7F',  #rgb(0.2,0.5,0.5,0.5)  # 다각형 내부 색. 가장 마지막 값은 투명도
           plwd=2,            # 다각형 선의 두께
           cglcol='grey',      # 거미줄의 색
           cglwd=0.1,          #거미줄두께
           axistype = 1,       #축의 레이블 타입
           axislabcol = 'darkgray',   
           seg = 4,            # 축의 눈금 분할
           caxislabels = seq(0,100,25) # 축의 레이블 값
           ) 


## LAB 종교 조사 데이터
str(WVS)

pop <- table(WVS$country)   #국가별 응답자수
tmp <- subset(WVS, religion=='yes')  
length(tmp$religion)  
rel <- table(tmp$country)  # 국가별 종교가 있는 응답자 수
stat <- rel / pop  # 국가별 종교가 있는 응답자수 비율

max.score <- rep(1,4)
min.score <- rep(0,4)
ds <- rbind(max.score, min.score, stat)  #matrix
ds <- data.frame(ds)  # matrix -> data.frame

radarchart(ds,  #방사형차트로
           pcol = 'red',
           pfcol = '#7F33337F',
           plwd = 2,
           cglcol = 'grey',
           cglty = 1,
           cglwd = 0.1,
           axistype = 1,
           seg = 3,
           caxislabels = seq(0,1,0.3),  # 0에서 1까지 0.3 범위로
           )   


## ggplot
library(ggplot2)

month <- c(1:6)
rain <- c(55,50,45,50,60,70)
df <- data.frame(month, rain)

ggplot(df, aes(x=month, y=rain)) + 
  geom_bar(stat = 'identity',   #stat='identity＇ : 막대 높이는 y축에 해당하는 열
           width = 0.8,       # 막대의 폭
           fill = 'skyblue')

#막대그래프 가로
ggplot(df, aes(x=month, y=rain)) + 
  geom_bar(stat = 'identity',   
           width = 0.8,       
           fill = 'skyblue') +
  ggtitle('월별 강수량(1~6월)')+
  labs(x = '월', y='강수량')+
  coord_flip() +
  theme(plot.title = element_text(size = 20,
                                  face = 'italic',
                                  color = 'darkblue',
                                  hjust = 0.5))

# 히스토그램
ggplot(data = iris, aes(x= Petal.Length)) +
  geom_histogram(binwidth=0.5)
  #binwidth는 구간의 길이를 지정하는 매개변수, 이 경우는 꽃잎의 길이를 0.5 간격으로 나누라는 의미

#------------                  
ggplot(data = iris, aes(x= Sepal.Width, fill = Species)) +
  geom_histogram() + #fill = Species 히스토그램 막대 내부를 Species로 채움
  #geom_histogram(position = 'dodge') = Species 막대가 개별로 따로 만들어짐
  ggtitle('붓꽃 품종별 꽃잎별 꽃받침 넓이 히스토그램')
  theme( legend.position = 'top')

# 산점도
ggplot(data = iris, aes(x= Petal.Length, y= Petal.Width,
                        color=Species)) +
  geom_point(size=3) +
  ggtitle('붓꽃 품종별 꽃잎 산점도')+
  theme(plot.title = element_text(size = 20,
                                  face = 'italic',
                                  color = 'darkblue',
                                  hjust = 0.5))

## 선그래프
year <- 1937:1960
cnt <- as.vector(airmiles)
df <- data.frame(year, cnt)
df

ggplot(df, aes(x=year, y=cnt)) +
  geom_line(col='red', stat='identity')


## LAB 기후 변화 그래프. Airquality
df <- aggregate(airquality[,'Temp'],
                by=list(month=airquality$Month),
                FUN = mean)
colnames(df) <- c('month','temp')
df
ggplot(data=df, aes(x=month, y= temp)) +
  geom_bar(stat = 'identity', width = 0.6,
           fill = 'darkgreen') +
  ggtitle('5개월 평균기온(화씨)')

#산점도
df <-  airquality[complete.cases(airquality),]

ggplot(data = df, aes(x= Temp, y=Ozone, color = 'orange')) +
  geom_point(size = 2)

cor(df$Temp, df$Ozone)

#선그래프
df.7 <- subset(df, Month==7)

ggplot(data = df.7 , aes(x=Day, y= Ozone)) +
  geom_line(col='red', linetype='dashed') +
  geom_point(col='orange', size=3) +
  ggtitle('일별 오존지수') +
  theme(plot.title = element_text(size = 20,
                                  face = 'bold',
                                  color = 'darkred',
                                  hjust = 0.5)) +
  labs(x='일',y='오존지수')



## 실전분석
# 세계 가국의 다양한 지표 분석
str(UN98)

df <- UN98[,c('region','tfr')]
df <- df[complete.cases(df),]
df <- aggregate(df[,'tfr'], by=list(region=df$region), FUN = mean)

ggplot(data = df, aes(x=region, y=x))+
  geom_bar(stat = 'identity', width = 0.8,
           col = '#333333',
           fill = rainbow(5))+
  ggtitle('대륙별 평균 여성출산률')+
  labs(x='대륙',y='평균출산률')

##treemap
df.tm <- UN98[,c('region','lifeFemale','illiteracyFemale')]
df.tm <- df.tm[complete.cases(df.tm),]  #결측치 제거
df.tm$country <- rownames(df.tm)

treemap(df.tm, index = c('region','country'),
        vSize = 'lifeFemale',
        vColor = 'illiteracyFemale',
        type = 'value')

## 산점도
df.edu <- UN98[,c('region','educationMale',
                  "educationFemale")]
df.edu <- df.edu[complete.cases(df.edu),]

ggplot(data=df.edu, aes(x=educationMale, y=educationFemale, col = region))+
  geom_point(size = 2)+
  ggtitle('대륙별 남녀 교육수준')+
  theme(plot.title = element_text(size = 16,
                                  face = 'bold',
                                  color = 'steelblue',
                                  hjust = 0.5)) +
  labs(x = '교육수준(남)',y='교육수준(여)')

cor(df.edu$educationMale, df.edu$educationFemale)  
