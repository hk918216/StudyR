## 데이터 전처리
# 샘플링
x <- 1:100
y <- sample(x, size = 10, replace = FALSE)  #replace = F -> 비복원추출(한번뽑은 값 제외하고)

idx <- sample(1:nrow(iris), size= 15, replace = F)
iris.15 <- iris[idx,]

## set.seed()
sample(1:20, size = 5)
sample(1:20, size = 5)
sample(1:20, size = 5)
set.seed(100)    # 샘플링을 한 번하면 효과 사라짐. 실행 안하면 매번 다른 결과
sample(1:20, size = 5)
set.seed(100)
sample(1:20, size = 5)
sample(1:20, size = 5)

# 1~5까지 수에서 열을 임의로 조합
combn(1:5, 4)
combn(1:10 , 4)

x <- c('red','green','blue','black','white')
com <- combn(x,2)

for(i in 1:ncol(com)) {
  cat(com[,i], '\n')
}


## LAB 편두통 치료 데이터
str(KosteckiDillon)
View(KosteckiDillon)
tot.mean <- mean(KosteckiDillon$dos)
summary(KosteckiDillon$dos)

set.seed(100)
idx <- sample(nrow(KosteckiDillon), nrow(KosteckiDillon)*0.3)


for (rt in (1:5)*0.1) {
  set.seed(100)
  idx <- sample(nrow(KosteckiDillon), nrow(KosteckiDillon)*rt)
  sam.data <- KosteckiDillon[idx,'dos']
  tmp.mean <- mean(sam.data)
  cat('비교:',rt*100,'% 샘플링 평균치료일수=',tmp.mean,':',tot.mean-tmp.mean,'\n')
}
#평균치료일수 646.7059

##
agg.result <- aggregate(iris[,-5], by=list(iris$Species),FUN= mean)
str(agg.result)
median <- aggregate(iris[,-5], by=list(iris$Species),FUN= median)
agg.result1 <- aggregate(iris[,-5], by=list(품종=iris$Species),FUN= mean)


## LAB 2011캐나다 전국 선거 통계
str(CES11)
table(CES11$abortion)
table(CES11$abortion)/nrow(CES11)
View(CES11)

agg <- aggregate(CES11[,'abortion'], by = list(성별=CES11$gender),
                 FUN = table)

agg.2 <- agg[,2]

colnames(agg[,2]) <- c('낙태찬성','낙태반대')

agg.2[1,] <- agg.2[1,]/sum(agg.2[1,])
agg.2[2,] <- agg.2[2,]/sum(agg.2[2,])

rownames(agg.2) <- agg[,1]
agg


## 실전분석 : 칠레 대통령 선거 여론조사
help(Chile)
str(Chile)

nrow(Chile) - sum(is.na(Chile))

ch <- Chile[complete.cases(Chile),]

set.seed(100)
idx <- sample(nrow(ch), nrow(ch)*0.6)
ch60 <- ch[idx,]
dim(ch60)

agg <- aggregate(ch60[,'population'], by=list(지역=ch60$region),FUN=sum)
str(ch60$region)
str(agg)

table(ch60$vote)

no.people <- table(ch60$sex)
tmp <- subset(ch60, vote=='Y')
agg <- aggregate(tmp[,'vote'], by=list(성별=tmp$sex), length)
yes.ratio <- agg$x / no.people

no.region <- table(ch60$region)
tmp <- subset(ch60, vote=='Y')
agg <- aggregate(tmp[,'vote'], by = list(지역=tmp$region), length)
yes.region <- agg$x / no.region
