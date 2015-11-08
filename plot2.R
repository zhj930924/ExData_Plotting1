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
png("plot2.png", width=480, height=480)

plot(power_data$DateTime,power_data$Global_active_power, xlab = "", 
     ylab = "Global Active Power (kilowatts)", type = "l")

dev.off()
