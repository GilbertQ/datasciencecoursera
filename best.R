best <- function(state, outcome) {
    ##Read outcome data
  
    outcome <-gsub("(^|[[:space:]])([[:alpha:]])", "\\1\\U\\2", outcome, perl=TRUE)
    data <- read.csv("outcome-of-care-measures.csv", colClasses ="character")
    criteria <- paste("Hospital.30.Day.Death..Mortality..Rates.from.", sub(" ",".",outcome), sep="")
    
    ## Check that state and outcome are valid
    
    Es <- any(state %in% data$State)
    Eo <- any(criteria %in% colnames(data))
    if (!Es) {
      stop("invalid state")
    } else if (!Eo){
      stop("invalid condition")
    } else {
      ## Return hospital name in that state with lowest 30-day death
      ## rate
      t <-subset(data,State==state)[,c("Hospital.Name",criteria)]
      td <- data.frame(H=character(), N=numeric())
      suppressWarnings(t[,2]<-as.numeric(t[,2]))
      for(i in 1:nrow(t)) {
        row <- t[i,]
        if (!is.na(row[,2])){
          td[nrow(td) + 1,] <- c(row[,1],row[,2])
        }
      }
      td[,2]<-as.numeric(td[,2])
      td <- td[order(td[,2],td[,1]),]
      return(td[1,1])
    }
}