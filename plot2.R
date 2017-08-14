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
with(reqData,plot(DateTime,globActPow,type="n",
                  xlab="",ylab="Global Active Power (kilowatts)"))
with(reqData,lines(DateTime,globActPow))

# Save plot image to PNG
dev.copy(png,"plot2.png")
dev.off()
