#Plot4.R
#By:  Neil de Lara
#Coursera:  Exploratory Data Analysis


#load data to a dataframe
proj1<-read.table("household_power_consumption.txt",sep = ";",header = TRUE)

#filter data between 2/1/2007 and 2/2/2007
proj1f<-subset(proj1,proj1$Date=="2/1/2007" | proj1$Date == "2/2/2007")
proj1f$DateTime<-with(proj1f,mdy(Date)+hms(Time))

#Using filtered data set, 
# 1. Change data type of Global_active_power and Global_reactive_power to numeric
#    Change data type of Sub_metering_1 & Sub_metering_2 from char to numeric
# 2. Set the plotting arrangements
#    Create 4 plots
# 3. Provide y-axis label and plot title
# 4. Provide a legend for the 3 types of metering
proj1f$Global_active_power<-as.numeric(proj1f$Global_active_power)
proj1f$Global_reactive_power<-as.numeric(proj1f$Global_reactive_power)
proj1f$Voltage<-as.numeric(proj1f$Voltage)
proj1f$Sub_metering_1<-as.numeric(proj1f$Sub_metering_1)
proj1f$Sub_metering_2<-as.numeric(proj1f$Sub_metering_2)

par(mfrow=c(2,2))
par(mar = c(4,4,2,2))
#par(mar = c(0.5,0.5,0.5,0.5))
#Export Plot3 to PNG
#png(file = "plot4.png", width=480, height=480)

#Global_active_power
with(proj1f, plot(DateTime, Global_active_power, type="l" ,ylab = "Global Active Power",xlab = "",cex=0.2))

#Voltage
with(proj1f, plot(DateTime, Voltage, type="l" ,ylab = "Voltage",xlab = "DateTime"))

#Sub_metering
with(proj1f, plot(DateTime, Sub_metering_1, type="l" ,ylim = c(0,30), ylab = "Energy sub metering",xlab = ""))
lines(proj1f$DateTime, proj1f$Sub_metering_2, type="l", col="red")
lines(proj1f$DateTime, proj1f$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, cex=0.2, lwd=2.5, col=c("black", "red", "blue"))

#Global reactive power
with(proj1f, plot(DateTime, Global_reactive_power, type="l" ,ylab = "Global_reactive_power",xlab = "DateTime"))

dev.copy(png, file = "plot4.png", width=480, height=480, units = "px")
dev.off()
