#plot2

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
png(filename = "plot2.png", width = 480, height = 480)

plot(dat1$datetime, dat1$Global_active_power, xlab = "", ylab = "Global Active Power(Kilowatts)",type = "l")

dev.off()
