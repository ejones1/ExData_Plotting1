# Sets wd to location of saved data file
setwd("C:/Users/joneseri/Coursera/ExploratoryDataAnalysis/exdata_data_household_power_consumption")

# Reads in data file
data <- read.csv("household_power_consumption.txt", na.string="?", sep=";")

# Subsets data to include only the dates needed
data <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]

# Combines date and time variables into one column and converts
# them to the proper format using strptime()
data$DateTime <- strptime(paste(data$Date, data$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

# Creates a png file with specified dimensions
png("plot4.png", width = 480, height = 480)

# Adjusts settings to include 2 rows of 2 plots (4 total plots)
par(mfrow = c(2,2))

# Top-left plot
plot(data$DateTime, data$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power")

# Top-right plot
plot(data$DateTime, data$Voltage, type= "l",
     xlab = "datetime", ylab = "Voltage")

# Bottom-left plot
plot(data$DateTime, data$Sub_metering_1, type = "l",
     xlab = "", ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "blue", "red"),
       bty = "n",
       lwd = 1)

# Bottom-right plot
plot(data$DateTime, data$Global_reactive_power, type = "l",
     xlab = "datetime", ylab = "Global_reactive_Power")

# Turns off png device
dev.off()