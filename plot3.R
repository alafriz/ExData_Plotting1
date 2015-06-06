# PREPARE DATA

# Read in raw data
fulldat <- read.csv("household_power_consumption.txt", sep =";", na.strings = "?")

# Convert Date column to date format
fulldat$Date <- as.Date(fulldat$Date, "%d/%m/%Y")

# Subset to dates required for assignment
dat3 <- subset(fulldat, Date == "2007-02-01" | Date == "2007-02-02")

# Add datetime column to avoid redundant code
dat3$Datetime <- as.POSIXct(paste(dat3$Date, dat3$Time), format = "%Y-%m-%d %H:%M:%S")

# CONSTRUCT PLOT

# Load PNG graphics device, construct plot, annotate with additional lines / legend,
# close graphics device and print to file
png("plot3.png")
plot(dat3$Datetime, dat3$Sub_metering_1,
    type = "l",
    xlab = "",
    ylab = "Energy sub metering")
lines(dat3$Datetime, dat3$Sub_metering_2,
    type = "l",
    col = "red")
lines(dat3$Datetime, dat3$Sub_metering_3,
    type = "l",
    col = "blue")
legend("topright",
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1)
dev.off()