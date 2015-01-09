#plot4
setwd("C:\\Users\\tgaertner\\Desktop\\Coursera\\4. Exploratory Data Analysis\\Week 1\\Project 1\\exdata_data_household_power_consumption")

#Read in text file
Data <- read.table("C:\\Users\\tgaertner\\Desktop\\Coursera\\4. Exploratory Data Analysis\\Week 1\\Project 1\\exdata_data_household_power_consumption\\household_power_consumption.txt",
                   sep = ";",
                   header = TRUE,
                   na.strings = "?")

#Review what read-in variables look like
str(Data)

#Since Date and Time were read-in as factors, we want Date and Time to be treated as a date/time
Data$Date.Time <- strptime(paste(Data$Date,Data$Time), format = "%d/%m/%Y %H:%M:%S")

#Subset days
Data$Date2 <- as.Date(Data$Date,"%d/%m/%Y")
Data2 <- Data[Data$Date2=="2007-02-01" | Data$Date2=="2007-02-02", ]

#Data2$Weekday <- weekdays(Data2$Date2, abbreviate = TRUE)
par(mfrow = c(2,2))
with(Data2, plot(Date.Time,Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))

with(Data2, plot(Date.Time,Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))

with(Data2, plot(Date.Time, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n"))
with(Data2, lines(Date.Time, Sub_metering_1, col = "black"))
with(Data2, lines(Date.Time, Sub_metering_2, col = "red"))
with(Data2, lines(Date.Time, Sub_metering_3, col = "blue"))
legend("topright", lty=c(1,1,1), cex=.6, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

with(Data2, plot(Date.Time,Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power"))


dev.copy(png, height=480, width=480 ,file="C:\\Users\\tgaertner\\Desktop\\Coursera\\4. Exploratory Data Analysis\\Week 1\\Project 1\\ExData_Plotting1\\plot4.png")
dev.off()
