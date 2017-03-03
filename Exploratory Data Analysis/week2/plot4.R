#reading data file
powerconsumption<- read.table("./data/household_power_consumption.txt", sep = ";",header = TRUE)

#extacting required data
subdata <- subset(powerconsumption,powerconsumption$Date=="1/2/2007" | powerconsumption$Date =="2/2/2007")
dateandtime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#opening png gaphic device
png("plot4.png", width=480, height=480)

#defining plot parameter
par(mfrow=c(2,2))

#plot1
globalactivepower<-as.numeric(as.character(subdata$Global_active_power))
plot(dateandtime,globalactivepower,type = "l" ,col = "black",main = "Global Active Power",xlab="",ylab="Global Active Power (Killowatts)")

#plot2
voltage<-as.numeric(as.character(subdata$Voltage))
plot(dateandtime,voltage,type = "l" ,col = "black",xlab="datetime",ylab="Voltage")

#plot3
submeter1<- as.numeric(as.character(subdata$Sub_metering_1))
submeter2<- as.numeric(as.character(subdata$Sub_metering_2))
submeter3<- as.numeric(as.character(subdata$Sub_metering_3))

plot(dateandtime,submeter1,type = "l",col="black", ylab = "Energy Sub metering",xlab = "")
lines(dateandtime,submeter2,type = "l",col="red")
lines(dateandtime,submeter3,type = "l",col="blue")
legend("topright",c("sub_metering_1","sub_metering_2","sub_metering_3"),lty=1 ,lwd=2.5, col=c("black","red","blue"))

#plot4
globalreactivepower<-as.numeric(as.character(subdata$Global_reactive_power))
plot(dateandtime,globalreactivepower,type = "l" ,col = "black",xlab="",ylab="Global Active Power")

#closing png graphic device
dev.off()