# Sets wd to location of saved data file
setwd("C:/Users/joneseri/Coursera/ExploratoryDataAnalysis/exdata_data_household_power_consumption")

# Reads in data file
data <- read.csv("household_power_consumption.txt", na.string="?", sep=";")

# Subsets data to include only the dates needed
data <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]

# Combines date and time variables into one column and converts
# them to the proper format using strptime()
data$DateTime <- strptime(paste(data$Date, data$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

# Creates a png file with specified dimensions and adjusts margins
png(filename = "plot1.png", width = 480, height = 480)
par(mar = c(6,6,5,4))

# Plots data for plot1 using histogram function
hist(data$Global_active_power, 
     col = "red", 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

# Turns off png device
dev.off()