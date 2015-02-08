plot2 <- function() {
    data <- read.table("household_power_consumption.txt", header=FALSE, sep=";", 
                       skip=66637, nrows=2880, na.strings="?")
    
    x <- data$V1
    y <- data$V3
    z <- data$V2
    xdates <- strptime(paste(x, z), "%d/%m/%Y %H:%M:%S")
    png(filename="plot2.png", width=480, height=480)
    par(mar=c(2,4,4,2))
    plot(xdates, y, type="l", ylab="Global Active Power (kilowatts)")
    dev.off()
}