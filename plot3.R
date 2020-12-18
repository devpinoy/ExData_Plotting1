# plot3.R

##### set working dir and file name ###
setwd("D:/Learn Data Science/ExData_Plotting1")
fn <- "household_power_consumption.txt"

library(sqldf)

##### define sql query string to select only 2 days in Feb 2007 ###
qstr = "select * from file where Date = '1/2/2007' or Date = '2/2/2007' "

x <- read.csv.sql(fn, sql = qstr, sep = ";", header = TRUE )

### create new variable datetime with class POSIXlt ###
x$datetime <- strptime(paste(x$Date,x$Time),format = "%d/%m/%Y %T",tz = "cet")

sqldf()      # close sql connection

# plot 3
par(mfrow=c(1,1))
plot(x$datetime, x$Sub_metering_1, ylab = "Energy sub metering",xlab = "" ,type = "l")
lines(x$datetime,x$Sub_metering_2,col="red")
lines(x$datetime,x$Sub_metering_3,col="blue")
legend("topright",legend = names(x[7:9]),col = c("black","red","blue"),lty = 1)

# plot into a png file ###
png(filename = "plot3.png",width = 480, height = 480)

plot(x$datetime, x$Sub_metering_1, ylab = "Energy sub metering",xlab = "" ,type = "l")
lines(x$datetime,x$Sub_metering_2,col="red")
lines(x$datetime,x$Sub_metering_3,col="blue")
legend("topright",legend = names(x[7:9]),col = c("black","red","blue"),lty = 1)

dev.off()