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

#--- Script to generate plot1.png
png(file="plot1.png")
hist(myset$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main="Global Active Power")
dev.off()