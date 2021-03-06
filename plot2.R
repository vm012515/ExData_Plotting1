#Reading data file
if(!file.exists("household_power_consumption.txt")) {
        Url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(Url, destfile="data.zip")
        unzip("data.zip", ".")
}
data<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
#Chosing data for the required timeframe
new_data<-data[data$Date %in% c("1/2/2007", "2/2/2007"),]
#Creating a new column and changing it to a better format
#deleting the old columns with Date and Time variables
date<- strptime(paste(new_data$Date, new_data$Time, sep=" "),
                format="%d/%m/%Y %H:%M:%S")
new_data<-cbind(date,new_data)
new_data<-subset(new_data, select= -c(Date, Time))
#Creating plot2 and saving in png format
png("plot2.png", height=480, width=480)
with(new_data, plot(date, Global_active_power, type="l",
                    ylab="Global Active Power(kilowatts)", xlab= ""))
dev.off()

