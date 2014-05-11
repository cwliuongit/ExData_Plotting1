plot_figure4 <- function() {
    TotalData <- read.table("household_power_consumption.txt"
    	                    , sep=";"
    	                    , header=TRUE
    	                    , colClasses = rep("character", 9)
    	                   ) # read.table

    TotalData[,1] <- as.Date(TotalData[,1], format="%d/%m/%Y")    
    
    date1 <- as.Date("2007-02-01")
    date2 <- as.Date("2007-02-02")
    
    MyData <- TotalData[ TotalData$Date == date1 
                         |
                         TotalData$Date == date2 
                       , ]
                       
    for (i in 3:9) MyData[,i] <- as.numeric(MyData[,i])    
    
    MyData$DateTime <- strptime(paste(MyData$Date, MyData$Time), 
                                format="%Y-%m-%d %H:%M:%S"
                               ) # strptime   
  
    png(file="plot4.png", width=480, height=480)
    par(mfrow=c(2,2))
    
    # 1. top left frame
    plot(MyData$DateTime, MyData$Global_active_power, type="l",
        xlab="", ylab="Global Active Power") # plot
        
    # 2. top right frame
    plot(MyData$DateTime, MyData$Voltage, type="l",
        xlab="datetime", ylab="Voltage") # plot
    
    # 3. bottom left frame
    plot(MyData$DateTime, MyData$Sub_metering_1, type="n", 
         xlab="", ylab="Energy sub metering")
    
    points(MyData$DateTime, MyData$Sub_metering_1, type="l", 
           pch=-1, col="black")
    
    points(MyData$DateTime, MyData$Sub_metering_2, type="l", 
           pch=-1, col="red")
           
    points(MyData$DateTime, MyData$Sub_metering_3, type="l", 
           pch=-1, col="blue")
    
    legend("topright", box.lwd=0,
           c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
           lty=rep(1,3), 
           col=c("black", "red", "blue")
          ) # legend   
             
    # 4. bottom right
    plot(MyData$DateTime, MyData$Global_reactive_power, type="l",
        xlab="datetime", ylab="Global_reactive_power") # plot         
             
    dev.off()
    	                    
} # end of function plot_figure4


# ========================= #
#       main program        #     
# ========================= #
plot_figure4()

