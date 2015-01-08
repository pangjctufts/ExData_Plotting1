#plot3

# read downloaded data
dat <- read.table("../household_power_consumption.txt",sep = ";", header=TRUE, na.strings="?")

# convert the date format 
dat$Date <- as.Date(dat$Date,format = "%d/%m/%Y")

# Get the subset between 2007-02-01 and 2007-02-02
duration <- c(as.Date("2007-02-01"),as.Date("2007-02-02"))
dat1 <- dat[dat$Date %in% duration,]

# Convert time information 
dat1$datetime <- strptime(paste(dat1$Date, dat1$Time), "%Y-%m-%d %H:%M:%S")

# Draw the png image
png(filename = "plot3.png", width = 480, height = 480)
with(dat1,plot(datetime, Sub_metering_1, xlab = "", ylab = "Energy sub metering",type = "n"))
with(dat1,lines(y = Sub_metering_1,x = datetime, col ="black"))
with(dat1,lines(y = Sub_metering_2,x = datetime, col ="red"))
with(dat1,lines(y = Sub_metering_3,x = datetime, col ="blue"))

legend("topright",
       legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col= c("black","red","blue"), 
       lty="solid"
)
dev.off()
