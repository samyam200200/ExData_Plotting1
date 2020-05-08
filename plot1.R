#Reads the file and cleans it. Selects two dates
data<-read.table("household_power_consumption.txt", sep = ";",na.strings = "?", header=T, colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
head(data)
data$Date<-as.Date(data$Date, "%d/%m/%Y")
a<-subset(data, Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
a<-na.omit(a)
library(tidyr)
b<-unite(a, DateTime,Date,Time, sep=" ")
b$DateTime<-strptime(b$DateTime, "%Y-%m-%d %H:%M:%S")
#Produces the first plot as png
png("plot1.png", width = 480, height = 480)
hist(a$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="Red")
dev.off()
