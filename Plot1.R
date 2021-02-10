#Plot1.R
#By:  Neil de Lara
#Coursera:  Exploratory Data Analysis


#load data to a dataframe
proj1<-read.table("household_power_consumption.txt",sep = ";",header = TRUE)

#filter data between 2/1/2007 and 2/2/2007
proj1f<-subset(proj1,proj1$Date=="2/1/2007" | proj1$Date == "2/2/2007")
proj1f$DateTime<-with(proj1f,mdy(Date)+hms(Time))

#Using filtered data set, 
# 1. Change data type of Global Active Power from char to numeric
# 2. Create histogram in red color
# 3. Provide x-axis label and plot title
hist(as.numeric(proj1f$Global_active_power),col="red",xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")

#Export Plot1 histogram to PNG
dev.copy(png, file = "plot1.png", width=480, height=480, units = "px")
dev.off()
