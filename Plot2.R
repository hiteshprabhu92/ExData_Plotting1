## Reading dataset from file
data_full <- read.csv("Exploratory Data Analysis/ExData_Plotting1/household_power_consumption.txt",
                      header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, 
                      comment.char="", quote='\"')
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

## Subsetting the data to required dates
data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_full)

## Converting dates to R Date/time classes
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 2
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## Saving to file
dev.copy(png, file="Exploratory Data Analysis/ExData_Plotting1/plot2.png", height=2000, width=2000)
dev.off()