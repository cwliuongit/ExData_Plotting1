plot_figure3 <- function() {
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
  
    png(file="plot3.png", width=480, height=480)
    
    plot(MyData$DateTime, MyData$Sub_metering_1, type="n", 
         xlab="", ylab="Energy sub metering")
    
    points(MyData$DateTime, MyData$Sub_metering_1, type="l", 
           pch=-1, col="black")
    
    points(MyData$DateTime, MyData$Sub_metering_2, type="l", 
           pch=-1, col="red")
           
    points(MyData$DateTime, MyData$Sub_metering_3, type="l", 
           pch=-1, col="blue")
    
    legend("topright", 
           c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
           lty=rep(1,3), 
           col=c("black", "red", "blue")
          ) # legend   
             
    dev.off()
    	                    
} # end of function plot_figure3


# ========================= #
#       main program        #     
# ========================= #
plot_figure3()

