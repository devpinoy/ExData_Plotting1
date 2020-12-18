# plot4.R

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

# plot 4

par(mfcol=c(2,2))
#1
plot(x$datetime, x$Global_active_power, ylab = "Global Active Power (kilowatts)",xlab = "" ,type = "l")
#2
plot(x$datetime, x$Sub_metering_1, ylab = "Energy sub metering",xlab = "" ,type = "l")
lines(x$datetime,x$Sub_metering_2,col="red")
lines(x$datetime,x$Sub_metering_3,col="blue")
legend("topright",legend = names(x[7:9]),col = c("black","red","blue"),lty = 1,bty = "n")
#3
with(x,plot(datetime, Voltage, type = "l"))
#4
with(x,plot(datetime, Global_reactive_power, type = "l"))


# plot into a png file ###
png(filename = "plot4.png",width = 480, height = 480)

par(mfcol=c(2,2))

plot(x$datetime, x$Global_active_power, ylab = "Global Active Power (kilowatts)",xlab = "" ,type = "l")

plot(x$datetime, x$Sub_metering_1, ylab = "Energy sub metering",xlab = "" ,type = "l")
lines(x$datetime,x$Sub_metering_2,col="red")
lines(x$datetime,x$Sub_metering_3,col="blue")
legend("topright",legend = names(x[7:9]),col = c("black","red","blue"),lty = 1,bty = "n")

with(x,plot(datetime, Voltage, type = "l"))

with(x,plot(datetime, Global_reactive_power, type = "l"))

dev.off()