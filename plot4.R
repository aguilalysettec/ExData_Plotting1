#read data
data<-read.table("./household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE,dec=".")

#subset data from 2007-02-01 and 2007-02-02
subsetdata<-subset(data,Date=="1/2/2007" | Date=="2/2/2007")

#create a variable  with date and time merged together
datetime<-strptime(paste(subsetdata$Date,subsetdata$Time,sep=" "),"%d/%m/%Y %H:%M:%S") 

#change class of variables to correct class
subsetdata$Global_active_power<-as.numeric(subsetdata$Global_active_power)
subsetdata$Global_reactive_power<-as.numeric(subsetdata$Global_reactive_power)
subsetdata$Voltage<-as.numeric(subsetdata$Voltage)
subsetdata$Sub_metering_1<-as.numeric(subsetdata$Sub_metering_1)
subsetdata$Sub_metering_2<-as.numeric(subsetdata$Sub_metering_2)
subsetdata$Sub_metering_3<-as.numeric(subsetdata$Sub_metering_3)

#plot
png("plot4.png",width=480,height=480)
par(mfrow=c(2,2))

plot(datetime,subsetdata$Global_active_power,type="l",xlab="",ylab="Global Active Power")

plot(datetime,subsetdata$Voltage,type="l",xlab="datetime",ylab="Voltage")

plot(datetime,subsetdata$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(datetime,subsetdata$Sub_metering_2,type="l",col="red")
lines(datetime,subsetdata$Sub_metering_3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=1,col=c("black","red","blue"),bty="n",cex=0.7)

plot(datetime,subsetdata$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power",ylim=c(0.0,0.5))

dev.off()