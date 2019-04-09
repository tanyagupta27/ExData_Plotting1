data=read.table("household_power_consumption.txt",na.string="?",header=T,sep=";",stringsAsFactors = F )
attach(data)
Date_new=as.Date(data$Date,"%d/%m/%Y")
data=data.frame(data,Date_new)

datetime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
data=data.frame(data,datetime)
data2=subset(data,data$Date_new>="2007-02-01" & data$Date_new<="2007-02-02")

png("plot2.png",width=480,height=480)
plot(data2$datetime,data2$Global_active_power,type="l",ylab ="Global Active Power(kilowatts)",xlab = " ")
dev.off()
