#Plot2.R
#By:  Neil de Lara
#Coursera:  Exploratory Data Analysis


#load data to a dataframe
proj1<-read.table("household_power_consumption.txt",sep = ";",header = TRUE)

#filter data between 2/1/2007 and 2/2/2007
proj1f<-subset(proj1,proj1$Date=="2/1/2007" | proj1$Date == "2/2/2007")

#Combine Date and Time using lubridate
proj1f$DateTime<-with(proj1f,mdy(Date)+hms(Time))

#Using filtered data set, 
# 1. Change data type of Global Active Power from char to numeric
# 2. Create a lineplot
# 3. Provide y-axis label and plot title
proj1f$Global_active_power<-as.numeric(proj1f$Global_active_power)
with(proj1f,plot(DateTime,Global_active_power,type="l",ylab = "Global Active Power (kilowatts)",xlab = ""))

#Export Plot2 lineplot to PNG
dev.copy(png, file = "plot2.png", width=480, height=480, units = "px")
dev.off()
