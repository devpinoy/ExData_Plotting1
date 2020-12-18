# plot1.R

##### set working dir and file name ###
setwd("D:/Learn Data Science/ExData_Plotting1")
fn <- "household_power_consumption.txt"

library(sqldf)

##### define sql query string to select only 2 days in Feb 2007 ###
qstr = "select * from file where Date = '1/2/2007' or Date = '2/2/2007' "

x <- read.csv.sql(fn, sql = qstr, sep = ";", header = TRUE )

### create new variable datetime with class POSIXlt ###
x$datetime <- strptime(paste(x$Date,x$Time),format = "%d/%m/%Y %T",tz = "cet")

sqldf()    # close sql connection

# plot 1 -- histogram of Global Active Power ###
par(mfrow=c(1,1))
hist(x$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red",main = "Global Active Power")

# plot into a png file ###
png(filename = "plot1.png",width = 480, height = 480)
hist(x$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red",main = "Global Active Power")
dev.off()