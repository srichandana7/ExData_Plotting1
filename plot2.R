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

png("plot2.png",width= 480,height= 480)
plot(merg$D,merg$Global_active_power,xlab = " ",ylab="Global Active Power (kilowatts)",type="l")
dev.off()
