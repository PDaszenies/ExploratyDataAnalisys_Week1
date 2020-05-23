## Plotting Global Active Power (Kilowatts) against Time

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
my_data1$Global_active_power <- as.character(my_data1$Global_active_power)
my_data1$Global_active_power <- as.numeric(my_data1$Global_active_power)

## Drawing and creating plot2.png
par(mfrow=c(1,1))
png(filename = "./plot2.png", width=480, height = 480)
plot(fecha, my_data1$Global_active_power, "l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()




