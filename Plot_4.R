#read in the data from the file
data <- read.table(pipe('findstr /B /R ^[1-2]/2/2007 household_power_consumption.txt'), sep=";" , as.is=F,na.strings=c('?'),stringsAsFactors=F)

#naming the columns
colnames(data) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))

#adjust dates
dateTime<-strptime(paste(data$Date,data$Time),format = "%d/%m/%Y %H:%M:%S")

##Create a png
png('plot4.png')

##Plot
par(mfrow = c(2, 2))

with(data, {
  plot(dateTime, Global_active_power, xlab = "", ylab = "Global Active Power", type="l")
  plot(dateTime, Voltage, ylab = "voltage", type="l")
  plot(dateTime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type="l")
  lines (x= dateTime, y= Sub_metering_2, col ="red")
  lines (x= dateTime, y= Sub_metering_3, col ="blue")
  legend("topright", col = c("black", "red", "blue")
         , lty= "solid", bty ="N"
         , legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(dateTime, Global_reactive_power, type="l")
}) 

dev.off() ## Close the PNG device!
