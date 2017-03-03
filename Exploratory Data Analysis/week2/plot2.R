#reading data file
powerconsumption<- read.table("./data/household_power_consumption.txt", sep = ";",header = TRUE)

#extacting required data
subdata <- subset(powerconsumption,powerconsumption$Date=="1/2/2007" | powerconsumption$Date =="2/2/2007")
dateandtime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalactivepower<-as.numeric(as.character(subdata$Global_active_power))

#opening png gaphic device
png("plot2.png", width=480, height=480)

#plotting
plot(dateandtime,globalactivepower,type = "l" ,col = "black",main = "Global Active Power",xlab="",ylab="Global Active Power (Killowatts)")

#closing png graphic device
dev.off()