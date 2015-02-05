power_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", stringsAsFactors=F)
power_data_subset <- power_data[power_data$Date == "1/2/2007" | power_data$Date == "2/2/2007",]

power_data_subset$Date <- as.Date(power_data_subset$Date, "%d/%m/%Y")
dates_and_times <- paste(as.Date(power_data_subset$Date), power_data_subset$Time)
power_data_subset$dates_and_times <- as.POSIXct(dates_and_times)

png("plot2.png", width = 480, height = 480)
plot(power_data_subset$dates_and_times, power_data_subset$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l")
dev.off()