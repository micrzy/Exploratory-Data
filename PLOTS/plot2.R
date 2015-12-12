
mydata <- read.csv("c:/Users/micrzy/Downloads/household_power_consumption.txt", header = T, 
                   sep = ';', dec = '.')

mydata$timestamp <- paste(mydata$Date, mydata$Time)
mydata$timestamp <- strptime(mydata$timestamp, 
                             format = '%d/%m/%Y %H:%M:%S')
df <- mydata[mydata$Date == '1/2/2007' | mydata$Date == '2/2/2007', ]
df$Global_active_power <- as.vector(df$Global_active_power)
df$Global_active_power <- as.numeric(df$Global_active_power)
df$Date <- as.factor(as.vector(df$Date))
df.nrow <- nrow(df)

plot(seq(df.nrow), df$Global_active_power, type = 'l', xaxt = "n", 
     xlab = '', ylab = 'Global Active Power (kilowatts)')
idx <- match('2/2/2007', df$Date)

axis(1, at = c(1, idx, df.nrow), labels = c('Thu', 'Fri', 'Sat'))
dev.copy(png,file = "c:/Users/micrzy/Downloads/plot2.png", width = 480, height = 480)
dev.off()
