#Exploratory Data Analysis - Course Project 1
#plot.R
#This script takes data from the file "household_power_consumption.txt" and plots the data 
#simillar to the sample answers shown in the course project page.  

# Read file
pwdata <- read.table("./data/household_power_consumption.txt", sep=";", na.string="?", header=TRUE)

# Convert to Date column to Date type
pwdata$Date <- strptime(pwdata$Date, "%d/%m/%Y")

#Subset data
myset <- pwdata[as.Date(pwdata$Date) >= as.Date("2007-02-01") & as.Date(pwdata$Date) <= as.Date("2007-02-02"), ]

#--- Script to generate plot3.png
png(file="plot3.png")
plot(as.POSIXct(paste(myset$Date, myset$Time),format("%Y-%m-%d %H:%M:%S")), myset$Sub_metering_1, type= "n", xlab = "", ylab= "Energy sub metering")
points(as.POSIXct(paste(myset$Date, myset$Time),format("%Y-%m-%d %H:%M:%S")), myset$Sub_metering_1, type = "l", col="black")points(as.POSIXct(paste(myset$Date, myset$Time),format("%Y-%m-%d %H:%M:%S")), myset$Sub_metering_1, type = "l", col="black")
points(as.POSIXct(paste(myset$Date, myset$Time),format("%Y-%m-%d %H:%M:%S")), myset$Sub_metering_2, type = "l", col="red")
points(as.POSIXct(paste(myset$Date, myset$Time),format("%Y-%m-%d %H:%M:%S")), myset$Sub_metering_3, type = "l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1, 1), lwd=c(2.5,2.5,2.5), col=c("black", "red", "blue") )
dev.off()