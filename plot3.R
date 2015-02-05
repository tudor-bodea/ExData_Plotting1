rm(list=ls(all=TRUE))
setwd("C:/Work/Personal/Personal/Coursera/4-ExploratoryDataAnalysis/wk1_Project1/ExData_Plotting1")

##### LOAD DATA SET
data <- read.table(file="household_power_consumption.txt", header=TRUE, sep=";",
	na.strings="?", colClasses=c("character","character",	rep("numeric", times=7)), 
	check.names=FALSE)
# SELECT SEQUENCE OF DTES OF INTEREST
data <- data[data[,1] %in% c("1/2/2007","2/2/2007"),]
# FORMAT Date AND Time COLUMNS
data <- transform(data, DateTime = strptime(paste(data[,1], data[,2]), format="%d/%m/%Y %H:%M:%S"))
data[,1] <- as.Date(data[,1], format="%d/%m/%Y")
# SOME DATA QUALITY CHECKS
str(data)
head(data)
tail(data)

##### CREATE PLOT 3
png(filename="plot3.png")
with(data, plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
with(data, lines(DateTime, Sub_metering_2, col="red"))
with(data, lines(DateTime, Sub_metering_3, col="blue"))
legend("topright", legend=names(data)[7:9], lty=1, col=c(1, "red", "blue"))
dev.off()
