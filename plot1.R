#Reading the file
if(!file.exists("household_power_consumption.txt")){
        Url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(Url, destfile = "data.zip")
        unzip("data.zip", ".")
}
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
#Choosing the data for the required timeframe

new_data<-data[data$Date %in% c("1/2/2007", "2/2/2007"),]

#Creating histogram in the plo1.png file
png("plot1.png",height = 480, width = 480)
hist(new_data$Global_active_power, col="red", main="Global Active Power", xlab = "Global Active Power(kilowatts)")
dev.off()