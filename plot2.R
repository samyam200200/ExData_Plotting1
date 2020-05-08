png("plot2.png", width = 480, height = 480)
plot(b$DateTime, b$Global_active_power,type = "l", ylab="Global Active Power (kilowatts)", xlab=" ")
dev.off()