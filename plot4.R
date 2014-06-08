#Reading & Setting the data
setwd("C://Users//aaguiarn//Documents//Classes//Coursera//explo_data_analysis//week1//project1")
all_dat<-read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
all_dat$Date <- as.Date(all_dat$Date, format="%d/%m/%Y")
dat<-subset(all_dat, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
time <- paste(as.Date(dat$Date), dat$Time)
dat$time <- as.POSIXct(time)
rm(all_dat)


#Plotting & Saving the file
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(dat, {
        plot(Global_active_power~time, type="l", ylab="Global Active Power (kilowatts)", xlab="")
        plot(Voltage~time, type="l", ylab="Voltage (volt)", xlab="")
        plot(Sub_metering_1~time, type="l", ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~time,col='Red')
        lines(Sub_metering_3~time,col='Blue')
        legend(x="topright", c("sub metering 1", "sub metering 2", "sub metering 3"), col=c("black", "red", "blue"), lty=NA, lwd=2, bty="n")
        plot(Global_reactive_power~time, type="l", ylab="Global Rective Power (kilowatts)", xlab="")
})
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
