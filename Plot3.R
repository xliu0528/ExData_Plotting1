getwd()
setwd("~/Desktop/Coursera/Exploratory Data Analysis")
list.files("./data")
top.size <- object.size(read.table("data/household_power_consumption.txt", sep=";", nrow=1000))
cons.size <- 2075259/1000*top.size
cons.size
cons <- read.csv("data/household_power_consumption.txt", sep=";", header=T, stringsAsFactors=F, na.strings="?")
head(cons)
library(dplyr)
cons1 <- filter(cons, Date=="1/2/2007" | Date=="2/2/2007")
head(cons1)
cons1$date <- as.Date(cons1$Date, "%d/%m/%Y")
head(cons1)
cons1$dateTime <- paste(cons1$date, cons1$Time)
cons1$datetime <- strptime(cons1$dateTime, "%Y-%m-%d %H:%M:%S")
head(cons1)
class(cons1$datetime)
par(ps = 12)
plot(cons1$datetime, cons1$Sub_metering_1, xlab="", ylab="Energy sub metering", type="l")#, cex.lab=0.7, cex.axis=0.7)
lines(cons1$datetime, cons1$Sub_metering_2, col="red")
lines(cons1$datetime, cons1$Sub_metering_3, col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))#, cex=0.9)
dev.copy(png, file = "Plot3.png", width = 480, height = 480)
dev.off()




