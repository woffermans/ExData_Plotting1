# Clean workspace
	rm(list=ls())

# Load libraries
	library(dplyr)
	library(lattice)
	library(lubridate)

# Read in the household power consumption data
	hpc<-read.table("./data/household_power_consumption.txt",sep=";",dec=".",na.strings = "?",header = TRUE)

# Change date and time column to new DateTime column
	hpc<-mutate(hpc,DateTime=dmy_hms(paste(Date,Time)))

# Create a subset of the household power consumption data
# Only data from the dates 2007-02-01 and 2007-02-02
	hpcSub<-filter(hpc,DateTime>=ymd_hms(c("2007-02-01 00:00:00")) & DateTime<ymd_hms(c("2007-02-03 00:00:00")))

# Open png file device
	png(file = "plot3.png", bg = "white", width = 480, height = 480, units = "px")

# Plot lineplot
	plot(hpcSub$DateTime, hpcSub$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
	lines(hpcSub$DateTime,hpcSub$Sub_metering_2,col="red")
	lines(hpcSub$DateTime,hpcSub$Sub_metering_3,col="blue")
	legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1))

# Close png device
	dev.off()
