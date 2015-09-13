#Assuming that the dataset was extracted to R directory in the working directory
#Read data
data <- read.csv('R/household_power_consumption.txt',header=T, sep=';')

#Merge date and time
data$Datetime <- paste(as.character(data[,1]) , data[,2])

#Convert string to date datatype
data[,1]=as.Date(data$Date,'%d/%m/%Y')


#extract only the data between the dates needed
data = subset(data, Date == '2007-02-01' | Date == '2007-02-02')

#convert datatype to number
data[,3] = as.numeric(as.character(data[,3]))

#plot 2
png('plot2.png',width=480,height=480)
plot(strptime(data$Datetime, '%d/%m/%Y %H:%M'),data$Global_active_power,ylab='Global Active Power (kilowatts)',xlab='',type='line')
dev.off()