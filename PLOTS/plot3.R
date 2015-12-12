mydata <- read.csv("c:/Users/micrzy/Downloads/household_power_consumption.txt", header = T, 
                   sep = ';', dec = '.')

mydata$timestamp <- paste(mydata$Date, mydata$Time)
mydata$timestamp <- strptime(mydata$timestamp, 
                             format = '%d/%m/%Y %H:%M:%S')
df <- mydata[mydata$Date == '1/2/2007' | mydata$Date == '2/2/2007', ]

df$Date <- as.factor(as.vector(df$Date))
df.nrow <- nrow(df)
df$Sub_metering_1 <- as.vector(df$Sub_metering_1)
df$Sub_metering_1 <- as.numeric(df$Sub_metering_1)

df$Sub_metering_2 <- as.vector(df$Sub_metering_2)
df$Sub_metering_2 <- as.numeric(df$Sub_metering_2)

df$Sub_metering_3 <- as.vector(df$Sub_metering_3)
df$Sub_metering_3 <- as.numeric(df$Sub_metering_3)

# plot 3
plot(seq(df.nrow), df$Sub_metering_1, type = 'l', xaxt = "n", 
     xlab = '', ylab = 'Energy sub metering', col = 'black')

lines(seq(df.nrow), df$Sub_metering_2, type = 'l', col = 'red')

lines(seq(df.nrow), df$Sub_metering_3, type = 'l', col = 'blue')

idx <- match('2/2/2007', df$Date)


axis(1, at = c(1, idx, df.nrow), labels = c('Thu', 'Fri', 'Sat'))

legend("topright",inset=.05,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1:1:1,col=c("red","blue","black"))

dev.copy(png,file = "c:/Users/micrzy/Downloads/plot3.png", width = 480, height = 480)
dev.off()