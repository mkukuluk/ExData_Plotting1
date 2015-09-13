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

# Convert all Sub_metering, voltage and global active power to numbers
data$Sub_metering_1 <- (as.numeric(as.character(data$Sub_metering_1)))
data$Sub_metering_2 <- (as.numeric(as.character(data$Sub_metering_2)))
data$Sub_metering_3 <- (as.numeric(as.character(data$Sub_metering_3)))
data$Voltage <- (as.numeric(as.character(data$Voltage)))
data$Global_reactive_power <- (as.numeric(as.character(data$Global_reactive_power)))

# create a datetime object
data$dt <- strptime(data$Datetime, '%d/%m/%Y %H:%M')  

#plot 4
par(mfrow=c(2,2), cex=0.75)
plot(data$dt,data$Global_active_power,ylab='Global Active Power',xlab='',type='line')
plot(data$dt,data$Voltage,ylab='Voltage',xlab='datetime',type='line')
plot(data$dt,data$Sub_metering_1,ylab='Energy sub metering',xlab='',type='line')
lines(data$dt,data$Sub_metering_2,col='red')
lines(data$dt,data$Sub_metering_3,col='blue')
legend("topright",legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col=c('black','red','blue'), bty="n",lty=1,lwd=1.5,xjust=1,y.intersp=0.6)
plot(data$dt,data$Global_reactive_power,xlab='datetime',ylab='Global_reactive_power',type='line')
dev.copy(png,'plot4.png',width=480,height=480)
dev.off()