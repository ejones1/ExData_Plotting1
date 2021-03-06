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
png("plot3.png", width = 480, height = 480)

# Plots data for plot3
plot(data$DateTime, data$Sub_metering_1, type = "l",
     xlab = "", ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "blue", "red"),
       lwd = 1)

# Turns off png device
dev.off()