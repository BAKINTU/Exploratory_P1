data <- read.table("household_power_consumption.txt", 
                   header= TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

data$Date <- as.Date(data$Date, "%d/%m/%Y")
data_sub <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

datetime <- paste(as.Date(data_sub$Date), data_sub$Time)
data_sub$Datetime <- as.POSIXct(datetime)

data_sub$global_activepower <- as.numeric(data_sub$Global_active_power)

plot(data_sub$global_activepower~data_sub$Datetime, type="l", 
     ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png,"plot2.png", width=480, height=480)
dev.off()