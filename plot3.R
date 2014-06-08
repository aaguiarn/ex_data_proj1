#Reading & Setting the data
setwd("C://Users//aaguiarn//Documents//Classes//Coursera//explo_data_analysis//week1//project1")
all_dat<-read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
all_dat$Date <- as.Date(all_dat$Date, format="%d/%m/%Y")
dat<-subset(all_dat, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
time <- paste(as.Date(dat$Date), dat$Time)
dat$time <- as.POSIXct(time)
rm(all_dat)


#Plotting & Saving the file
with(dat, {
        plot(Sub_metering_1~time, type="l", ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~time,col='Red')
        lines(Sub_metering_3~time,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("sub metering 1", "sub metering 2", "sub metering 3"))
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()