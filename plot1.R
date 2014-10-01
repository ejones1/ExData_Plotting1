setwd("C:/Users/joneseri/Coursera/ExploratoryDataAnalysis/exdata_data_household_power_consumption")

# Reads in entire dataset (all_data), then subsets to just dates needed
# for the assignment (data)
all_data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", 
                     stringsAsFactors=FALSE)
data <- all_data[min(which(all_data$Date == "1/2/2007")):max(which(all_data$Date == "2/2/2007")),]

# Removes the full dataset from environment
rm(all_data)

# Converts date column to date format mm/dd/yyyy
data$Date <- as.Date(data$Date, "%m/%d/%Y")

# Converts date column to date format mm/dd/yyyy
data$Date <- as.Date(data$Date, "%m/%d/%Y")

# Converts time column to time format
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, "%m-%d-%Y %H:%M:%S")

#Plot 1
png(filename = "plot1.png", width = 480, height = 480, units = "px", bg = "white")
par(mar = c(6,6,5,4))
hist(data$Global_active_power, 
     col = "red", 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()