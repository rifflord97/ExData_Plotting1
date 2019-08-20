#read in the data from the file
data <- read.table(pipe('findstr /B /R ^[1-2]/2/2007 household_power_consumption.txt'), sep=";" , as.is=F,na.strings=c('?'),stringsAsFactors=F)
#naming the columns
colnames(data) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))
#adjust dates
dateTime<-strptime(paste(data$Date,data$Time),format = "%d/%m/%Y %H:%M:%S")
#plot the graph
with(data, plot(dateTime, Global_active_power, xlab = "", ylab = "Global Active Power (killowatts)", type="l")) 
#save into a png file
dev.copy(png,file="Plot2.png")
dev.off()
