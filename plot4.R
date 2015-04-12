headers <- read.csv("household_power_consumption.txt", sep = ";", header = FALSE,
                    nrows = 1)
housing <- read.csv("household_power_consumption.txt", sep = ";", header = FALSE,
                    skip = 66637, nrows = 2880)
colnames(housing) <- unlist(headers)

png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
# Top left plot
plot(housing$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power",
     xaxt = "n")
lines(housing$Global_active_power)
axis(1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
# Top right plot
plot(housing$Voltage, type = "n", xlab = "datetime", ylab = "Global Active Power",
     xaxt = "n")
lines(housing$Voltage)
axis(1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
# Bottom left plot
plot(housing$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering",
     xaxt = "n")
lines(housing$Sub_metering_1)
lines(housing$Sub_metering_2, col = "red")
lines(housing$Sub_metering_3, col = "blue")
axis(1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = c(1, 1), bty = "n", cex = 0.5)
# Bottom right plot
plot(housing$Global_reactive_power, type = "n", xlab = "datetime", xaxt = "n",
     ylab = "Global_reactive_power")
lines(housing$Global_reactive_power)
axis(1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
dev.off()