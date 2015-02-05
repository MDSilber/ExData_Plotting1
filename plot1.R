power_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", stringsAsFactors=F)
power_data_subset <- power_data[power_data$Date == "1/2/2007" | power_data$Date == "2/2/2007",];

global_power <- factor(power_data_subset$Global_active_power)
histogram_data <- as.numeric(levels(global_power))[global_power]
png("plot1.png", width = 480, height = 480)
hist(histogram_data, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")
dev.off()