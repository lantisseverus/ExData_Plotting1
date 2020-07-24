getwd()
setwd("/Users/test/Desktop/Rcode")
## Plot 1:
#read file and add variable description:
power <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(power) <-c("Date","Time","Global_active_power","Global_reactive_power",
                 "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
#select data:
powerdata <- subset(power, power$Date == "1/2/2007" | power$Date == "2/2/2007")
# histogram plot
hist(as.numeric(as.character(powerdata$Global_active_power)),col="red",main="Global Active Power",
     xlab="Global Active Power(kilowatts)")
title(main = "Global Active Power" )

## Plot 2:
#read file and add variable description:
power <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(power) <-c("Date","Time","Global_active_power","Global_reactive_power",
                 "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
#select data:
powerdata <- subset(power, power$Date == "1/2/2007" | power$Date == "2/2/2007")
#change date formatting:
powerdata$Date <- as.Date(powerdata$Date, format="%d/%m/%Y")
powerdata$Time <- strptime(powerdata$Time, format="%H:%M:%S")
powerdata[1:1440, "Time"] <- format(powerdata[1:1440, "Time"], "2007-02-01 %H:%M:%S")
powerdata[1441:2880, "Time"] <- format(powerdata[1441:2880, "Time"], "2007-02-02 %H:%M:%S")
#Graphic plotting
plot(as.numeric(as.character(powerdata$Global_active_power)), type="l",xlab="",ylab="Global Active Power (kilowatts)")
title(main = "Global Active Power Vs Time")

##Plot 3
#read file and add variable description:
power <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(power) <-c("Date","Time","Global_active_power","Global_reactive_power",
                 "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
#select data:
powerdata <- subset(power, power$Date == "1/2/2007" | power$Date == "2/2/2007")
#change date formatting:
powerdata$Date <- as.Date(powerdata$Date, format="%d/%m/%Y")
powerdata$Time <- strptime(powerdata$Time, format="%H:%M:%S")
powerdata[1:1440, "Time"] <- format(powerdata[1:1440, "Time"], "2007-02-01 %H:%M:%S")
powerdata[1441:2880, "Time"] <- format(powerdata[1441:2880, "Time"], "2007-02-02 %H:%M:%S")
#Graphic plotting
plot(powerdata$Time,powerdata$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(powerdata,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(powerdata,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(powerdata,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
title(main = "Energy sub-metering")
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

##Plot 4
#read file and add variable description:
power <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(power) <-c("Date","Time","Global_active_power","Global_reactive_power",
                 "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
#select data:
powerdata <- subset(power, power$Date == "1/2/2007" | power$Date == "2/2/2007")
#change date formatting:
powerdata$Date <- as.Date(powerdata$Date, format="%d/%m/%Y")
powerdata$Time <- strptime(powerdata$Time, format="%H:%M:%S")
powerdata[1:1440, "Time"] <- format(powerdata[1:1440, "Time"], "2007-02-01 %H:%M:%S")
powerdata[1441:2880, "Time"] <- format(powerdata[1441:2880, "Time"], "2007-02-02 %H:%M:%S")
#Graphic plotting:
par(mfrow = c(2, 2))
with(powerdata, {
    plot(as.numeric(as.character(powerdata$Global_active_power)), type="l",xlab="",ylab="Global Active Power (kilowatts)")
    plot(powerdata$Time,as.numeric(as.character(powerdata$Voltage)), type="l",xlab="datetime",ylab="Voltage")
    plot(powerdata$Time,powerdata$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
    with(powerdata,lines(Time,as.numeric(as.character(Sub_metering_1))))
    with(powerdata,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
    with(powerdata,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
    legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3") , cex = 0.6)
    plot(powerdata$Time,as.numeric(as.character(powerdata$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})
