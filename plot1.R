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

hist(merg$Global_active_power,col='red',main="Global Active Power",xlab= "Global Active Power (kilowatts)")

png("plot1.png",width= 480,height= 480)
hist(merg$Global_active_power,col='red',main="Global Active Power",xlab= "Global Active Power (kilowatts)")
dev.off()
