headers <- read.csv("household_power_consumption.txt", sep = ";", header = FALSE,
                    nrows = 1)
housing <- read.csv("household_power_consumption.txt", sep = ";", header = FALSE,
                    skip = 66637, nrows = 2880)
colnames(housing) <- unlist(headers)

png(filename = "plot2.png", width = 480, height = 480)
plot(housing$Global_active_power, type = "n", xlab = "", xaxt = "n",
     ylab = "Global Active Power (kilowatts)")
lines(housing$Global_active_power)
axis(1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
dev.off()