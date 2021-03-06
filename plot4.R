power_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", stringsAsFactors=F)
power_data_subset <- power_data[power_data$Date == "1/2/2007" | power_data$Date == "2/2/2007",]

power_data_subset$Date <- as.Date(power_data_subset$Date, "%d/%m/%Y")
dates_and_times <- paste(as.Date(power_data_subset$Date), power_data_subset$Time)
power_data_subset$dates_and_times <- as.POSIXct(dates_and_times)

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

plot(power_data_subset$dates_and_times, power_data_subset$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")

plot(power_data_subset$dates_and_times, power_data_subset$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")

plot(power_data_subset$dates_and_times, power_data_subset$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(power_data_subset$dates_and_times, power_data_subset$Sub_metering_2, type = "l", col = "red")
lines(power_data_subset$dates_and_times, power_data_subset$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1,1), col = c("black", "red", "blue"), bty = "n")

plot(power_data_subset$dates_and_times, power_data_subset$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")

dev.off()