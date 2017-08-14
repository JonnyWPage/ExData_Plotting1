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

# Plot data
png(filename="plot3.png")
with(reqData,plot(DateTime,Sub_metering_1,type="n",
                  xlab="",ylab="Energy sub metering"))
with(reqData,lines(DateTime,Sub_metering_1,col="black"))
with(reqData,lines(DateTime,Sub_metering_2,col="red"))
with(reqData,lines(DateTime,Sub_metering_3,col="blue"))

# Add legend
legend("topright",legend=c("Sub_metering_1","Sub_metering_2",
                    "Sub_metering_3"),col=c("black","red","blue"), lty=c(1,1,1), xpd=TRUE)

# Save plot image to PNG
dev.off()