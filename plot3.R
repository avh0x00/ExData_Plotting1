headers <- read.csv("household_power_consumption.txt", sep = ";", header = FALSE,
                    nrows = 1)
housing <- read.csv("household_power_consumption.txt", sep = ";", header = FALSE,
                    skip = 66637, nrows = 2880)
colnames(housing) <- unlist(headers)

png(filename = "plot3.png", width = 480, height = 480)
plot(housing$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering",
     xaxt = "n")
lines(housing$Sub_metering_1)
lines(housing$Sub_metering_2, col = "red")
lines(housing$Sub_metering_3, col = "blue")
axis(1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = c(1, 1))
dev.off()