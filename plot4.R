##read and format data
data<-read.delim("household_power_consumption.txt",sep = ";")
data$DT<-paste(data$Date,data$Time)
data$DT<-strptime(data$DT,format = "%d/%m/%Y %H:%M:%S")
data$Global_active_power<-as.numeric(as.character(data$Global_active_power))
data$Global_reactive_power<-as.numeric(as.character(data$Global_reactive_power))
data$Voltage<-as.numeric(as.character(data$Voltage))
data$Sub_metering_1<-as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2<-as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3<-as.numeric(as.character(data$Sub_metering_3))
data<-data[data$DT>="2007-02-01 00:00:0"& data$DT<="2007-02-02 23:59:00",]
data<-na.omit(data)

##creating plot and png file
png(filename = "plot4.png")
par(mfrow=c(2,2))
plot(data$DT,data$Global_active_power,xlab="",ylab="Global Active Power",type = "l")
plot(data$DT,data$Voltage,xlab="datetime",ylab="Voltage",type = "l")
plot(data$DT,data$Sub_metering_1,type="l",ylab="Energy sub metering",xlab = "")
lines(data$DT,data$Sub_metering_2,col="red")
lines(data$DT,data$Sub_metering_3,col="blue")
legend("topright",lty=c(1,1,1),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),bty = "n")
plot(data$DT,data$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type = "l")
dev.off()
  