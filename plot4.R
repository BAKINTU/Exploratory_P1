data <- read.table("household_power_consumption.txt", 
                   header= TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

data$Date <- as.Date(data$Date, "%d/%m/%Y")
data_sub <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

datetime <- paste(as.Date(data_sub$Date), data_sub$Time)
data_sub$Datetime <- as.POSIXct(datetime)

data_sub$global_activepower <- as.numeric(data_sub$Global_active_power)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

with(data_sub, {
  plot(global_activepower~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime, type="l", ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(global_activepower~Datetime, type="l", ylab="Global Rective Power (kilowatts)",xlab="")
})

dev.copy(png,"plot4.png", width=480, height=480)
dev.off()