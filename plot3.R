plot3 <- function(){
    ## Load and subset data
    
    ##the path to data file, you could simply put the file name if data file is in the same directory as this script    dataFile <- "household_power_consumption.txt"
    hpc <- read.csv(dataFile, sep = ";", na.strings="?")
    
    ##change "Date" column from String to Date type and then subset data
    hpc$Date <- strptime(paste(hpc$Date,hpc$Time), "%d/%m/%Y %H:%M:%S") 
    hpc <- subset(hpc, as.Date(hpc$Date) >= '2007-02-01' & as.Date(hpc$Date) <= '2007-02-02')
    
    ##Generates plot3.png file
    png("plot3.png", width = 480, height = 480, units = "px")
    Sys.setlocale("LC_TIME", "English")
    plot(hpc$Date, hpc$Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering" )
    with(hpc, lines(hpc$Date, hpc$Sub_metering_2, col="red"))
    with(hpc, lines(hpc$Date, hpc$Sub_metering_3, col="blue"))
    legend("topright", legend=colnames(hpc)[7:9], lty=c(1,1), col=c("black", "red", "blue"))
    dev.off()
    
    "plot3.png has been generated"
}
