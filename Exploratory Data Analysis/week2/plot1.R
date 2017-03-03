#reading data file
powerconsumption<- read.table("./data/household_power_consumption.txt", sep = ";",header = TRUE)

#extacting required data
subdata <- subset(powerconsumption,powerconsumption$Date=="1/2/2007" | powerconsumption$Date =="2/2/2007")

#opening png gaphic device
png("plot1.png", width=480, height=480)

#plotting
hist(as.numeric(as.character(subdata$Global_active_power)), col = "red",main = "Global Active Power",xlab="Global Active Power (Killowatts)")

#closing png graphic device
dev.off()