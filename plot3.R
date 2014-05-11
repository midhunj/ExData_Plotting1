
##download the zip file 
filename<-download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",filename)

## unzip the files
unzip <- unz(fname, "household_power_consumption.txt")

## read the document as a table 
tbl <- read.table(unzip, header=T, sep=';', na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
##filter the data to specific dates
tbl <- tbl[(tbl$Date == "1/2/2007") | (tbl$Date == "2/2/2007"),]
## strip the dates
tbl$DateTime <- strptime(paste(tbl$Date, tbl$Time), "%d/%m/%Y %H:%M:%S")
## setup the graph to write into plot3.png
png(filename = "plot3.png", width = 480, height = 480, units = "px")
## select the columns
cols = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
## plot the columns eachw ith different color
plot(tbl$DateTime, tbl$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(tbl$DateTime, tbl$Sub_metering_2, type="l", col="red")
lines(tbl$DateTime, tbl$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, lwd=1, col=c("black","blue","red"), legend=cols)
dev.off()