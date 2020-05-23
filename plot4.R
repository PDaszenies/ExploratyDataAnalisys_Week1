## Plotting Matrix

## libraries
library(lubridate)

## Data Extraction
my_data <- read.delim("./household_power_consumption.txt", sep=";")

## Converting Dates and numbers
my_data$Date <- as.Date(my_data$Date, "%d/%m/%Y")

## Selecting Dates (2007-02-01 - 2007-02-02)
my_data1 <- my_data[my_data$Date >= "2007-02-01" & my_data$Date <= "2007-02-02", ]

## paste andd converting Date and Time
fecha <- paste(my_data1$Date,my_data1$Time)
fecha <- ymd_hms(fecha)


## Converting to numbers
my_data1$Global_active_power <- as.numeric(as.character(my_data1$Global_active_power))
my_data1$Sub_metering_1 <- as.numeric(as.character(my_data1$Sub_metering_1))
my_data1$Sub_metering_2 <- as.numeric(as.character(my_data1$Sub_metering_2))
my_data1$Global_reactive_power <- my_data1$Global_reactive_power[my_data1$Global_reactive_power!="?"]
my_data1$Global_reactive_power <- as.numeric(as.character(my_data1$Global_reactive_power))
my_data1$Voltage <- as.numeric(as.character(my_data1$Voltage))

## Drawing and creating plot4.png
png(filename = "./plot4.png", width=480, height = 480)
par(mfrow=c(2,2), mar=c(4, 4, 2, 2))

## plot 1
plot(fecha, my_data1$Global_active_power, "l", ylab="Global Active Power (kilowatts)", xlab="")

## Plot 2
plot(fecha, my_data1$Voltage, type="l", ylab="Voltage", xlab="datetime")

## Plot 3
with(my_data1, plot(fecha, my_data1$Sub_metering_1, type ="n", ylab="Energy sub metering", xlab=""))
with(subset(my_data1), points(fecha, Sub_metering_1, type="l"))
with(subset(my_data1), points(fecha, Sub_metering_2, type="l", col="red"))
with(subset(my_data1), points(fecha, Sub_metering_3, type="l", col="blue"))
legend("topright", pch="-", box.lty=0, col =c("black", "red", "blue"), legend =c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Plot 4
plot(fecha, my_data1$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

## Closing file
dev.off()





