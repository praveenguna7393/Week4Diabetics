
# First practical session in udemy.
mydata <- read.csv(file.choose())
mydata

remove.packages("ggplot2")
install.packages("ggplot2")
library(ggplot2)

ggplot(data = mydata[mydata$carat<2.5,],
       aes(x=carat,y=price, color=clarity)) +
  geom_point(alpha=0.1) +
  geom_smooth()





