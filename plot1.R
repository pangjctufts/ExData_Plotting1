#plot1

# read downloaded data
dat <- read.table("../household_power_consumption.txt",sep = ";", header=TRUE, na.strings="?")

# convert the date and the time format
dat$Date <- as.Date(dat$Date,format = "%d/%m/%Y")

# Get the subset between 2007-02-01 and 2007-02-02
duration <- c(as.Date("2007-02-01"),as.Date("2007-02-02"))
dat1 <- dat[dat$Date %in% duration,]

# Draw the png image
png(filename = "plot1.png", width = 480, height = 480)

hist(dat1$Global_active_power, main = "Global Active contour", 
     xlab = "Global Active Power(kilowatts)", 
     col = 'red')

dev.off()
