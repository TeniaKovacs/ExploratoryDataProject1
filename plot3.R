# Read data
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
# Set date format
data[,"Date"] <- as.Date(data[,"Date"],format = "%d/%m/%Y")
# Filter data
sdata<-subset(data,Date == "2007-02-01" | Date == "2007-02-02")
# Date-time format
datet<-strptime(paste(sdata$Date,sdata$Time,sep = " "), "%Y-%m-%d %H:%M:%S" )
# Convert string to numeric format
sub1<-as.numeric(sdata[,"Sub_metering_1"])
sub2<-as.numeric(sdata[,"Sub_metering_2"])
sub3<-as.numeric(sdata[,"Sub_metering_3"])

# Make and save plot
png("plot3.png",width = 480, height = 480)
plot(datet,sub1,col = "black",type = "l", xlab = " ", ylab = "Energy sub metering")
lines(datet, sub2, col = "red")
lines(datet, sub3, col = "blue")
legend("topright",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = c(1,1,1), col = c("black","red","blue"))
dev.off()
