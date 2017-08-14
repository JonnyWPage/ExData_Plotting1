# Set Working Directory
setwd("C:/Users/jonny/Documents/Coursera/houseHold")

# Read in dataset
houseHold <- read.table("household_power_consumption.txt",header=TRUE,
                        sep=";",stringsAsFactors=FALSE)

# Subset Data
reqData <- subset(houseHold,Date=='1/2/2007'|Date=='2/2/2007')

# Create Date-Time Variable
reqData$Date<-as.Date(reqData$Date,"%d/%m/%Y")

reqData$DateTime <- paste(reqData$Date,reqData$Time)

# Convert data to correct format
reqData$DateTime <- strptime(reqData$DateTime,"%Y-%m-%d %H:%M:%S")
globActPow<-as.numeric(as.character(reqData$Global_active_power))
volt<-as.numeric(as.character(reqData$Voltage))
globReactPow<-as.numeric(as.character(reqData$Global_reactive_power))

# Plot data
png(filename="plot4.png")
par(mfrow=c(2,2))

# Plot 1 (1,1)
with(reqData,plot(DateTime,globActPow,type="n",
                  xlab="",ylab="Global Active Power (kilowatts)"))
with(reqData,lines(DateTime,globActPow))

# Plot 2 (1,2)
with(reqData,plot(DateTime,volt,type="n",
                  xlab="datetime",ylab="Voltage"))
with(reqData,lines(DateTime,Voltage))

# Plot 3 (2,1)
with(reqData,plot(DateTime,Sub_metering_1,type="n",
                  xlab="",ylab="Energy sub metering"))
with(reqData,lines(DateTime,Sub_metering_1,col="black"))
with(reqData,lines(DateTime,Sub_metering_2,col="red"))
with(reqData,lines(DateTime,Sub_metering_3,col="blue"))

legend("topright",legend=c("Sub_metering_1","Sub_metering_2",
                           "Sub_metering_3"),col=c("black","red","blue"),
                           lty=c(1,1,1), bty="n")

# Plot 4 (2,2)
with(reqData,plot(DateTime,globReactPow,type="n",
                  xlab="datetime",ylab="Global_reactive_power"))
with(reqData,lines(DateTime,globReactPow))

dev.off()