setwd("~/Programming/Projects/R/NepalOSMStats/")

nepal <- read.csv("nepal.csv", header=F, quote = "")
colnames(nepal)<-c("timestamp","user")
nepal$timestamp <- as.Date(nepal$timestamp)

write_column_summary <- function(columnname){
  summaryDataFrame <- as.data.frame(table(subset(nepal, select=c(columnname))))
  write.csv(summaryDataFrame, file = sprintf("data/%sSummary.csv",columnname) )
}


lapply(c("user","timestamp"), write_column_summary)
