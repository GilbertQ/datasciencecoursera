## In case the XLS library can't be installed

fileUrl <-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl,destfile="./houses.csv")
library("readxl")
d <-read_excel("./book.xlsx")
library(dplyr)
dd <- tbl_df(d)
d1<-select(dd,7:15)
dat <-slice(d1,18:23)
dat$...7 <- as.numeric(dat$...7, na.rm=T)
dat$...12 <- as.numeric(dat$...12, na.rm=T)
sum(dat$...7*dat$...12, na.rm=T)