##포브스 기업 리포트 데이터 분석
install.packages('HSAUR')
library(HSAUR)
data('Forbes2000')
ds <- Forbes2000
ds[!complete.cases(ds),]  #결측값 확인

str(ds)
head(ds)
View(ds)

table(ds$country)
tmp <- sort(table(ds$country), decreasing = T)  #내림차순 정렬
top.10.contry <- tmp[1:10]  #상위10개국

par(mar=c(8,4,4,2))         #그래프여백 조정 
barplot(top.10.contry,      
        main='기업수 상위 10개국',
        ylim = c(0,800),    #y축 범위를 0에서 800으로
        col=rainbow(10),
        las=2
        )
par(mar=c(5,4,4,2))

#업종별 기업 통계
table(ds$category)
tmp <- sort(table(ds$category), decreasing = T)  #내림차순 정렬
top.10.category <- tmp[1:10]

par(mar=c(10,4,4,2))         #그래프여백 조정 
barplot(top.10.category,      
        main='기업수 상위 10개국',
        ylim = c(0,350),
        col='pink',
        las=2
)
par(mar=c(5,4,4,2))

# 업종별 기업 통계
tmp <- ds[ds$category %in% names(top.10.category),]   
tmp                 #여기서 %in% 는 카테고리 안에 이름이 상위 탑10 카테고리랑 이름이 같으면 가져옴
levels(tmp$category)
tmp$category <- factor(tmp$category)
levels(tmp$category)

par(mar=c(10,4,4,2))
boxplot(assets~category, data=tmp,
        ylim = c(0,100),
        xlab = ' ',
        las=2
        )
par(mar=c(5,4,4,2))  #그래프 여백 조정 초기화

# 기업 가치 상위 10대 기업
tmp <- ds[order(ds$marketvalue, decreasing = T),]  
tmp[1:10, c('name','country','category','marketvalue')]
head(tmp$marketvalue)

# 한국 기업 정보
korea <- subset(ds, country == 'South Korea')
korea[,c('rank','name','category','marketvalue')]

#기업 가치와 타 변수와의 상관관계
tmp <- ds[,5:8]
tmp <- tmp[complete.cases(tmp),]
plot(tmp, lower.panel=NULL)
cor(tmp)
