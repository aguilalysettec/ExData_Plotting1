#read data
data<-read.table("./household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE,dec=".")

#subset data from 2007-02-01 and 2007-02-02
subsetdata<-subset(data,Date=="1/2/2007" | Date=="2/2/2007")

#create a variable  with date and time merged together
datetime<-strptime(paste(subsetdata$Date,subsetdata$Time,sep=" "),"%d/%m/%Y %H:%M:%S") 

#change class of variable 'global active power' to correct class
subsetdata$Global_active_power<-as.numeric(subsetdata$Global_active_power)

#plot
png("plot2.png",width=480,height=480)
plot(datetime,subsetdata$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()