fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl,destfile="./survey.csv")
d <-read.csv("./survey.csv")
library(dplyr)
dd <- tbl_df(d)
d1 <- select(dd,VAL)
t<-d1 %>% count(VAL)
as.numeric(t[24,2])
