library(XML)
fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- xmlTreeParse(fileUrl, useInternal = TRUE)
rootNode <- xmlRoot(doc)
n <- 0
for (i in 1:xmlSize(rootNode[[1]])){
  z <- as.numeric(xmlValue(rootNode[[1]][[i]][["zipcode"]]))
  if (z == 21231) {
    n=n+1
  }
}
n