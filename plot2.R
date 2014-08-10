plot2 <- function(){
    ## Load and subset data
    
    ##the path to data file, you could simply put the file name if data file is in the same directory as this script
    dataFile <- "household_power_consumption.txt"
    hpc <- read.csv(dataFile, sep = ";", na.strings="?")
    
    ##change "Date" column from String to Date type and then subset data
    hpc$Date <- strptime(paste(hpc$Date,hpc$Time), "%d/%m/%Y %H:%M:%S") 
    hpc <- subset(hpc, as.Date(hpc$Date) >= '2007-02-01' & as.Date(hpc$Date) <= '2007-02-02')
    
    ##Generates plot2.png file
    png("plot2.png", width = 480, height = 480, units = "px")
    Sys.setlocale("LC_TIME", "English")
    plot(hpc$Date, hpc$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)" )
    dev.off()
    
    "plot2.png has been generated"
}
