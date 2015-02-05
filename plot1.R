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

##### CREATE PLOT 1
png(filename="plot1.png")
hist(data[,3], col=2, xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()
