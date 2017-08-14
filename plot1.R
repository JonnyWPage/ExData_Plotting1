# Set Working Directory
setwd("C:/Users/jonny/Documents/Coursera/houseHold")

# Read in dataset
houseHold <- read.table("household_power_consumption.txt",header=TRUE,
                      sep=";",stringsAsFactors=FALSE)

# Convert Date to correct format
houseHold$Date<-as.Date(houseHold$Date,format="%d/%m/%Y")

# Subset Data
reqData <- subset(houseHold,Date=="2007-02-01" | Date=="2007-02-02")

# Convert data to correct format
globActPow<-as.numeric(as.character(reqData$Global_active_power))

# Plot Histogram
hist(globActPow,col="red",xlab="Global Active Power (kilowatts)",
     main="Global Active Power")

# Save as PNG
dev.copy(png,'plot1.png')
dev.off()