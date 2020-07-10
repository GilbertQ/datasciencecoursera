############  This is the first:

##Create a new oauth:
##1. in Github
##          Public profile
##              Developer settings
##                  OAuth Apps
##                     New OAuth App
##2.  Homepage URL: https://api.github.com/users/jtleek/repos
##    Authorization callback URL: http://localhost:1410
##
##3.  Save and get the Client ID and the Client Secret to use in the first step.

myapp <- oauth_app("github",
      key = "xxxxxxxxxxxxxxxxx",
      secret = "zzzzzzzzzzzzzzzzzzzzzzzzzzzzzz")
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

##Authentication complete

list(output[[15]]$name, output[[15]]$created_at)
req <- GET("https://api.github.com/users/jtleek/repos", config(token = github_token))
stop_for_status(req)
output <- content(req)
datashare <- which(sapply(output, FUN=function(X) "datasharing" %in% X))
list(output[[datashare]]$name, output[[datashare]]$created_at)

############  This is the second:
fileUrl <-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl,destfile="./survey.csv")
d <- read.csv("./survey.csv")
sqldf("select pwgtp1 from acs where AGEP<50")

############  This is the third:
sqldf("select distinct AGEP from acs")

############  This is the fourth:
library(httr)
HTML = url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode = readLines(HTML)
c(nchar(htmlCode[10]),nchar(htmlCode[20]),nchar(htmlCode[30]),nchar(htmlCode[100]))

############  This is the fourth:
library(dplyr)
uRl_5 = "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
data <- read.fwf(file = uRl_5,skip=4, widths=c(12,7,4,9,4,9,4,9,4))
c4 <- as.numeric(data[,4])
sum(c4, na.rm=T)