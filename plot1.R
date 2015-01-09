#Plot1
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

hist(Data2$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.copy(png, height=480, width=480 ,file="C:\\Users\\tgaertner\\Desktop\\Coursera\\4. Exploratory Data Analysis\\Week 1\\Project 1\\ExData_Plotting1\\plot1.png")
dev.off()
