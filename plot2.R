df <- read.table("household_power_consumption.txt", na.strings = "?", sep=";", header=TRUE)
newdata <- subset(df, Date=="1/2/2007" | Date=="2/2/2007")

newdata$CombinedTime <- paste(newdata$Date, newdata$Time, sep=" ")
newdata$CombinedTime <- strptime(newdata$CombinedTime, format="%d/%m/%Y %H:%M:%S")

png(file="plot2.png")

with(newdata, plot(newdata$CombinedTime, newdata$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="n"))
lines(newdata$CombinedTime, newdata$Global_active_power)

dev.off()