## Plotting an Histogram of Global Active Power (Kilowatts) 

## Data Extraction
my_data <- read.delim("./household_power_consumption.txt", sep=";")

## Converting Dates and numbers
my_data$Date <- as.Date(my_data$Date, "%d/%m/%Y")

## Selecting Dates (2007-02-01 - 2007-02-02)
my_data1 <- my_data[my_data$Date >= "2007-02-01" & my_data$Date <= "2007-02-02", ]

## Converting to numbers
my_data1$Global_active_power <- as.character(my_data1$Global_active_power)
my_data1$Global_active_power <- as.numeric(my_data1$Global_active_power)


## Drawing and creating plot1.png
par(mfrow=c(1,1))
png(filename = "./plot1.png", width=480, height = 480)
hist(as.numeric(my_data1$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()




