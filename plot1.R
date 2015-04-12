headers <- read.csv("household_power_consumption.txt", sep = ";", header = FALSE,
                    nrows = 1)
housing <- read.csv("household_power_consumption.txt", sep = ";", header = FALSE,
                    skip = 66637, nrows = 2880)
colnames(housing) <- unlist(headers)

png(filename = "plot1.png", width = 480, height = 480)
hist(housing$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()