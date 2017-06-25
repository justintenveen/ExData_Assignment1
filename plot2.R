##Getting Household Power Consumption
household <- read.csv("/Users/justintenveen/Desktop/DS4 Assignment 1/household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char = "", quote='\"')
household$Date <- as.Date(household$Date, format="%d/%m/%Y")

##Subset Household Power Consumption
sub_household <- subset(household, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(household)

##Convert the dates
datetime <- paste(as.Date(sub_household$Date), sub_household$Time)
sub_household$Datetime <- as.POSIXct(datetime)

##Create Plot2
plot(sub_household$Global_active_power~sub_household$Datetime, type="l", 
     ylab="Global Active Power (kilowatts)", xlab="")

##Save to PNG
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
