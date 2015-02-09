plot4 <- function() {
    data <- read.table("household_power_consumption.txt", header=FALSE, sep=";", 
                       skip=66637, nrows=2880, na.strings="?")
    x <- data$V1
    z <- data$V2
    g_active_pwr <- data$V3
    subm1 <- data$V7
    subm2 <- data$V8
    subm3 <- data$V9
    voltage <- data$V5
    g_reactive_pwr <- data$V4
    xdates <- strptime(paste(x, z), "%d/%m/%Y %H:%M:%S")
    
    png(filename="plot4.png", width=480, height=480)
    par(mfrow = c(2, 2))
    par(mar=c(4,4,4,2))
    
    # first
    plot(xdates, g_active_pwr, type="l", ylab="Global Active Power (kilowatts)",
         xlab="")
    
    # second
    plot(xdates, voltage, type="l", ylab="Voltage",
         xlab="datetime")
    
    # third
    plot(xdates, subm1, type="l", ylab="Energy sub metering", xlab="")
    lines(xdates, subm2, col="red")
    lines(xdates, subm3, col="blue")
    legend("topright", legend=c("Sub_metering_1", "Sub_metering_2",
                                "Sub_metering_3"),
           col=c("black", "red", "blue"), lwd=.75, cex=.75)
    
    # fourth
    plot(xdates, g_reactive_pwr, type="l", ylab="Global_reactive_power",
         xlab="datetime")
    
    dev.off()
}