plot3 <- function() {
    data <- read.table("household_power_consumption.txt", header=FALSE, sep=";", 
                       skip=66637, nrows=2880, na.strings="?")
    x <- data$V1
    z <- data$V2
    subm1 <- data$V7
    subm2 <- data$V8
    subm3 <- data$V9
    xdates <- strptime(paste(x, z), "%d/%m/%Y %H:%M:%S")
    png(filename="plot3.png", width=480, height=480)
    par(mar=c(2,4,4,2))
    plot(xdates, subm1, type="l", ylab="Energy sub metering")
    lines(xdates, subm2, col="red")
    lines(xdates, subm3, col="blue")
    legend("topright", legend=c("Sub_metering_1", "Sub_metering_2",
                                "Sub_metering_3"),
           col=c("black", "red", "blue"), lwd=.75, cex=.75)
    dev.off()
}