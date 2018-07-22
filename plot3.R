#read data
data<-read.table("./household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE,dec=".")

#subset data from 2007-02-01 and 2007-02-02
subsetdata<-subset(data,Date=="1/2/2007" | Date=="2/2/2007")

#create a variable  with date and time merged together
datetime<-strptime(paste(subsetdata$Date,subsetdata$Time,sep=" "),"%d/%m/%Y %H:%M:%S") 

#change class of variables to correct class
subsetdata$Sub_metering_1<-as.numeric(subsetdata$Sub_metering_1)
subsetdata$Sub_metering_2<-as.numeric(subsetdata$Sub_metering_2)
subsetdata$Sub_metering_3<-as.numeric(subsetdata$Sub_metering_3)

#plot
png("plot3.png",width=480,height=480)
plot(datetime,subsetdata$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(datetime,subsetdata$Sub_metering_2,type="l",col="red")
lines(datetime,subsetdata$Sub_metering_3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=2.5,col=c("black","red","blue"))
dev.off()