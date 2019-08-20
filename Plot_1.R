#read in the data from the file
data <- read.table(pipe('findstr /B /R ^[1-2]/2/2007 household_power_consumption.txt'), sep=";" , as.is=F,na.strings=c('?'),stringsAsFactors=F)
#naming the columns
colnames(data) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))
#plot the graph
hist(data$Global_active_power, col = "chocolate", xlab = "Global Active Power (killowatts)", main = "Global Active Power")
#save into a png file
dev.copy(png,file="Plot1.png")
dev.off()
