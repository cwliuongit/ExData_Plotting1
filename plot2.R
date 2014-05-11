plot_figure2 <- function() {
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
  
    png(file="plot2.png", width=480, height=480)
    
    with(MyData, 
         plot(DateTime, 
              Global_active_power, type="l",
              xlab="", ylab="Global Active Power (Kilowatts)", 
             ) # plot
        ) # with
             
    dev.off()
    	                    
} # end of function plot_figure2


# ========================= #
#       main program        #     
# ========================= #
plot_figure2()

