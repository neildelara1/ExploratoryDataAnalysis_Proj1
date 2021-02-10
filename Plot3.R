#Plot3.R
#By:  Neil de Lara
#Coursera:  Exploratory Data Analysis


#load data to a dataframe
proj1<-read.table("household_power_consumption.txt",sep = ";",header = TRUE)

#filter data between 2/1/2007 and 2/2/2007
proj1f<-subset(proj1,proj1$Date=="2/1/2007" | proj1$Date == "2/2/2007")
proj1f$DateTime<-with(proj1f,mdy(Date)+hms(Time))

#Using filtered data set, 
# 1. Change data type of Sub_metering_1 & Sub_metering_2 from char to numeric
# 2. Create a lineplot
# 3. Provide y-axis label and plot title
# 4. Provide a legend for the 3 types of metering
proj1f$Sub_metering_1<-as.numeric(proj1f$Sub_metering_1)
proj1f$Sub_metering_2<-as.numeric(proj1f$Sub_metering_2)

with(proj1f, plot(DateTime, Sub_metering_1, type="l", ylim = c(0,30),ylab = "Energy sub metering (kilowatts)",xlab = ""))
lines(proj1f$DateTime, proj1f$Sub_metering_2, type="l", col="red")
lines(proj1f$DateTime, proj1f$Sub_metering_3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.4, lty=1, lwd=2.5, col=c("black", "red", "blue"))

#Export Plot3 to PNG
dev.copy(png, file = "plot3.png", width=480, height=480, units = "px")
dev.off()
