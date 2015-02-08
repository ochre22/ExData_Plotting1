plot1 <- function() {
    data <- read.table("household_power_consumption.txt", header=FALSE, sep=";", 
                       skip=66637, nrows=2880, na.strings="?")
    x <- data$V3
    png(filename="plot1.png", width=480, height=480)
    hist(x, col="red", main="Global Active Power",
         xlab="Global Active Power (kilowatts")
    dev.off()
}