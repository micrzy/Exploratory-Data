mydata <- read.csv("c:/Users/micrzy/Downloads/household_power_consumption.txt", header = T, 
                   sep = ';', dec = '.')

mydata$timestamp <- paste(mydata$Date, mydata$Time)
mydata$timestamp <- strptime(mydata$timestamp, 
                             format = '%d/%m/%Y %H:%M:%S')
df <- mydata[mydata$Date == '1/2/2007' | mydata$Date == '2/2/2007', ]
df$Global_active_power <- as.vector(df$Global_active_power)
df$Global_active_power <- as.numeric(df$Global_active_power)
df$Voltage <- as.vector(df$Voltage)
df$Voltage <- as.numeric(df$Voltage)
df$Global_reactive_power <- as.vector(df$Global_reactive_power)
df$Global_reactive_power <- as.numeric(df$Global_reactive_power)

df$Date <- as.factor(as.vector(df$Date))
df.nrow <- nrow(df)
df$Sub_metering_1 <- as.vector(df$Sub_metering_1)
df$Sub_metering_1 <- as.numeric(df$Sub_metering_1)

df$Sub_metering_2 <- as.vector(df$Sub_metering_2)
df$Sub_metering_2 <- as.numeric(df$Sub_metering_2)

df$Sub_metering_3 <- as.vector(df$Sub_metering_3)
df$Sub_metering_3 <- as.numeric(df$Sub_metering_3)


par(mfrow=c(2,2))
with(mydata,{
  plot(seq(df.nrow), df$Global_active_power, type = 'l', xaxt = "n", 
     xlab = '', ylab = 'Global Active Power')
  idx <- match('2/2/2007', df$Date)
  axis(1, at = c(1, idx, df.nrow), labels = c('Thu', 'Fri', 'Sat')) #1

  plot(seq(df.nrow), df$Voltage, type = 'l', xaxt = "n", 
     xlab = 'datetime', ylab = 'Voltage')
  idx <- match('2/2/2007', df$Date)
  axis(1, at = c(1, idx, df.nrow), labels = c('Thu', 'Fri', 'Sat'))#2 
  
  plot(seq(df.nrow), df$Sub_metering_1, type = 'l', xaxt = "n", 
     xlab = '', ylab = 'Energy sub metering', col = 'black')
  lines(seq(df.nrow), df$Sub_metering_2, type = 'l', col = 'red')
  lines(seq(df.nrow), df$Sub_metering_3, type = 'l', col = 'blue')
  idx <- match('2/2/2007', df$Date)
  axis(1, at = c(1, idx, df.nrow), labels = c('Thu', 'Fri', 'Sat'))
  legend("topright",bty="n",cex=0.75,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1:1:1,col=c("red","blue","black"))#3

  plot(seq(df.nrow), df$Global_reactive_power, type = 'l', xaxt = "n", 
     xlab = 'datetime', ylab = 'Global_rective_power')
  idx <- match('2/2/2007', df$Date)
  axis(1, at = c(1, idx, df.nrow), labels = c('Thu', 'Fri', 'Sat'))#4
})

dev.copy(png,file = "c:/Users/micrzy/Downloads/plot4.png", width = 480, height = 480)
dev.off()                              