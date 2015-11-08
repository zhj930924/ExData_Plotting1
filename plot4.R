library(datasets)

#Read the data with dates from 2007-02-01 and 2007-02-02
label <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
           "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
power_data <- read.table(file = "household_power_consumption.txt",
                         col.names = label, sep = ";", skip = 66637, nrows = 69517-66637)

#Convert the Date and Time variables to Date/Time classes
power_data$Date <- as.Date(power_data$Date,"%d/%m/%Y")
power_data$DateTime <- as.character(paste(power_data$Date,power_data$Time))
power_data$DateTime <- strptime(power_data$DateTime, format = "%Y-%m-%d %H:%M:%S")

#Create a plot with specified requirements
png("plot3.png", width=480, height=480)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

#Plot1
plot(power_data$DateTime,power_data$Global_active_power, xlab = "", 
     ylab = "Global Active Power (kilowatts)", type = "l")

#Plot2
plot(power_data$DateTime,power_data$Voltage, xlab = "datetime", 
     ylab = "Voltage", type = "l")

#Plot3
plot(power_data$DateTime,power_data$Sub_metering_1, xlab = "", 
     ylab = "Energy sub metering", type = "l")
lines(power_data$DateTime,power_data$Sub_metering_2, col = "red")
lines(power_data$DateTime,power_data$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1,
       lwd = 2.5, col = c("black","red","blue"), bty = "n")

#Plot4
plot(power_data$DateTime,power_data$Global_reactive_power, xlab = "datetime", 
     ylab = "Global_reactive_power", type = "l")

dev.off()