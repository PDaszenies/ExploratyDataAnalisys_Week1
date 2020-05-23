## Plotting >Energy sub metering against Time

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

##my_data1$Global_active_power <- as.numeric(my_data1$Global_active_power)

## Drawing and creating plot3.png
par(mfrow=c(1,1))
png(filename = "./plot3.png", width=480, height = 480)
with(my_data1, plot(fecha, my_data1$Sub_metering_1, type ="n", ylab="Energy sub metering", xlab=""))
with(subset(my_data1), points(fecha, Sub_metering_1, type="l"))
with(subset(my_data1), points(fecha, Sub_metering_2, type="l", col="red"))
with(subset(my_data1), points(fecha, Sub_metering_3, type="l", col="blue"))

## Adding Legend
legend("topright", pch="-", col =c("black", "red", "blue"), legend =c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()




