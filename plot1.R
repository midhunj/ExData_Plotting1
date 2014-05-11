
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
## setup the graph to write into plot.png
png(filename = "plot1.png", width = 480, height = 480, units = "px")
## write the hostogram
hist(tbl$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()