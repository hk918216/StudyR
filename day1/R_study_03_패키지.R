##패키지 설치 및 로드
'Hello World!'
"Hello World!"
install.packages('ggplot2')
library(ggplot2)

ggplot(data = iris, aes(x = Sepal.Length, y=Sepal.Width)) +
  geom_point()

#cowsay패키지
install.packages('cowsay')
library(cowsay)

say(what ='Hi~', by='pumpkin', by_color = 'yellow', what_color = 'red')


##생일맞추기   = (m * 4 + 9)* 25 + d  -> (m * 100) + 225 + d
# 소윤  주연  민철  석준  현석
#  931  754  1029   1139  1442

100 * m + d = 706
706 %% 100   # 나머지가 d
100 * x = 700
x <- 700/100

706 / 100   # 몫이 m 나머지가 d

val <- 1442
d <- (val -225)%%100
m <- ((val-225)-(val-225)%%100)/100
cat(m,'월', d,'일')





