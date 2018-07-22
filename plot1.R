#read data
data<-read.table("./household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE,dec=".")

#subset data from 2007-02-01 and 2007-02-02
subsetdata<-subset(data,Date=="1/2/2007" | Date=="2/2/2007")

#change class of variable 'global active power' to correct class
subsetdata$Global_active_power<-as.numeric(subsetdata$Global_active_power)

#plot histogram of global active power for those 2 days
png("plot1.png",width=480,height=480)
hist(subsetdata$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
