data=read.table("household_power_consumption.txt",na.string="?",header=T,sep=";",stringsAsFactors = F )
attach(data)
Date_new=as.Date(data$Date,"%d/%m/%Y")
data=data.frame(data,Date_new)

datetime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
data=data.frame(data,datetime)
data2=subset(data,data$Date_new>="2007-02-01" & data$Date_new<="2007-02-02")

png("plot3.png",width=480,height=480)
plot(data2$datetime,data2$Sub_metering_1,type="l",ylab="Energy sub metering",xlab=" ",col=1)
lines(data2$datetime,data2$Sub_metering_2,col=2)
lines(data2$datetime,data2$Sub_metering_3,col=4)
legend("topright",col=c(1,2,4),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1)
dev.off()