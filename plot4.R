# Read data
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
# Set date format
data[,"Date"] <- as.Date(data[,"Date"],format = "%d/%m/%Y")
# Filter data
sdata <- subset(data,Date == "2007-02-01" | Date == "2007-02-02")

GlobActPow <- suppressWarnings(as.numeric(sdata[,"Global_active_power"]))
datet <- strptime(paste(sdata$Date,sdata$Time,sep = " "), "%Y-%m-%d %H:%M:%S" )
sub1 <- as.numeric(sdata[,"Sub_metering_1"])
sub2 <- as.numeric(sdata[,"Sub_metering_2"])
sub3 <- as.numeric(sdata[,"Sub_metering_3"])
GlobReaPow <- as.numeric(sdata[,"Global_reactive_power"])
Volt <- as.numeric(sdata[,"Voltage"])

png("plot4.png",width = 480, height = 480)

par(mfrow = c(2,2))

# Plot 1
plot(datet,GlobActPow,type = "l",xlab = " ",ylab = "Global Active Power")

# Plot 2
plot(datet,Volt,type = "l",xlab = "datetime",ylab = "Voltage")

#Plot 3
plot(datet,sub1,col = "black",type = "l", xlab = " ", ylab = "Energy sub metering")
lines(datet, sub2, col = "red")
lines(datet, sub3, col = "blue")
legend("topright",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = c(1,1,1), col = c("black","red","blue"))

#Plot 4
plot(datet,GlobReaPow,type = "l",xlab = "datetime",ylab = "Global_reactive_power")

dev.off()