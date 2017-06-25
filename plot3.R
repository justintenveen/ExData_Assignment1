##Getting Household Power Consumption
household <- read.csv("/Users/justintenveen/Desktop/DS4 Assignment 1/household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char = "", quote='\"')
household$Date <- as.Date(household$Date, format="%d/%m/%Y")

##Subset Household Power Consumption
sub_household <- subset(household, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(household)

##Convert the dates
datetime <- paste(as.Date(sub_household$Date), sub_household$Time)
sub_household$Datetime <- as.POSIXct(datetime)

##Create Plot3
with(sub_household, {
        plot(Sub_metering_1~Datetime, type="l",
              ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~Datetime, col="red")
        lines(Sub_metering_3~Datetime, col="blue")
})

##Create Legend
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##Save to PNG
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
