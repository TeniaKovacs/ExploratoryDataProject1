# Read data
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
# Set date format
data[,"Date"] <- as.Date(data[,"Date"],format = "%d/%m/%Y")
# Filter data
sdata<-subset(data,Date == "2007-02-01" | Date == "2007-02-02")
# Date-time format
datet<-strptime(paste(sdata$Date,sdata$Time,sep = " "), "%Y-%m-%d %H:%M:%S" )
# Convert string to numeric format
GlobActPow<-as.numeric(sdata[,"Global_active_power"])
# Make and save plot
png("plot2.png",width = 480, height = 480)
plot(datet,GlobActPow,type = "l",xlab = " ",ylab = "Global Active Power (kilowatts)")
dev.off()
