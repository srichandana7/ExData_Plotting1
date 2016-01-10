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

png("plot3.png",width= 480,height= 480)
labels<-c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
plot(merg$D,merg$Sub_metering_1,xlab = " ",ylab="Energy sub metering",type="l")
lines(merg$D,merg$Sub_metering_2,xlab = " ",ylab="Energy sub metering",type="l",col='red')
lines(merg$D,merg$Sub_metering_3,xlab = " ",ylab="Energy sub metering",type="l",col='blue')
legend("topright",legend=labels,col= c("black","red","blue"),lty="solid")
dev.off() 




