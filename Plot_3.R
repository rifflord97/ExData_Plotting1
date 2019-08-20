#read in the data from the file
data <- read.table(pipe('findstr /B /R ^[1-2]/2/2007 household_power_consumption.txt'), sep=";" , as.is=F,na.strings=c('?'),stringsAsFactors=F)

#naming the columns
colnames(data) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))

#adjust dates
dateTime<-strptime(paste(data$Date,data$Time),format = "%d/%m/%Y %H:%M:%S")

#plot the graph
with(data,{
  plot(dateTime, Sub_metering_1, 
                xlab = "", ylab = "Energy sub metering", type="l",col="blue")
  lines(dateTime, Sub_metering_2, ,col="red")
  lines(dateTime, Sub_metering_3, ,col="green")
  })

#legend
legend("topright", lty= 1, col = c("blue", "red", "green"),        
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


#save into a png file
dev.copy(png,file="Plot3.png")
dev.off()
