A<-read.table("household_power_consumption.txt",header=T, sep=";",na.strings="?")
head(A)

B<-A[A$Date%in% c("1/2/2007","2/2/2007"),]
head(B)

paste()

C<-paste(B$Date,B$Time,sep=" ")
C

D<-strptime(C,"%d/%m/%Y%H:%M:%S") 
D

merg<-cbind(D,B)
merg

png("plot4.png",width= 480,height= 480)
labels<-c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
columnlines<-c("black","red","blue")
par(mfrow=c(2,2))
plot(merg$D,merg$Global_active_power,type="l",col="black",xlab=" ",ylab="Global Active Power (Kilowatts)")
plot(merg$D,merg$Voltage,type="l",col="black",xlab="datetime",ylab="Voltage")
plot(merg$D,merg$Sub_metering_1,type="l",col=columnlines[1],xlab=" ",ylab="Energy sub metering")
lines(merg$D,merg$Sub_metering_2,col=columnlines[2])
lines(merg$D,merg$Sub_metering_3,col=columnlines[3])
legend("topright",bty="n",legend=labels,col=columnlines,lty="solid")
plot(merg$D,merg$Global_reactive_power,type="l",col="black",xlab="datetime",ylab="Global_reactive_power")
dev.off()

