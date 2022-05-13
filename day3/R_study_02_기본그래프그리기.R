## 기본그래프
# 막대그래프 - Bar char

favorite.season <- c('WINTER','SUMMER','SPRING','SUMMER','SUMMER','FALL',
                     'FALL','SUMMER','SPRING','SPRING')
table(favorite.season)  #도수분포
ds <- table(favorite.season)
barplot(ds, main = '좋아하는 계절')

barplot(ds, main = '좋아하는 계절', col = rainbow(4),
        xlab = '계절', ylab = '빈도수')

barplot(ds, main = '좋아하는 계절', col = rainbow(4),
        xlab = '계절', ylab = '빈도수', horiz = T)

barplot(ds, main = '좋아하는 계절', col = rainbow(4),
        xlab = '계절', ylab = '빈도수', horiz = F, 
        names= c('가을','봄','여름','겨울'), las =1) 
#las = 2 : X축의 글자 세로로. 3은 X,Y축 글자 세로. 0는 y축만 세로

