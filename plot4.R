# PREPARE DATA

# Read in raw data
fulldat <- read.csv("household_power_consumption.txt", sep =";", na.strings = "?")

# Convert Date column to date format
fulldat$Date <- as.Date(fulldat$Date, "%d/%m/%Y")

# Subset to dates required for assignment
dat4 <- subset(fulldat, Date == "2007-02-01" | Date == "2007-02-02")

# Add datetime column to avoid redundant code
dat4$Datetime <- as.POSIXct(paste(dat3$Date, dat3$Time), format = "%Y-%m-%d %H:%M:%S")

# CONSTRUCT PLOT

# Set up 2 x 2 framework
png("plot4.png")
par(mfrow = c(2,2))

# Plot 1: Global Active Power
plot(dat4$Datetime, dat4$Global_active_power, 
     type = "l",
     xlab = "", 
     ylab = "Global Active Power")

# Plot 2: Voltage
plot(dat4$Datetime, dat4$Voltage, 
     type = "l",
     xlab = "datetime", 
     ylab = "Voltage")
     
# Plot 3: Energy sub metering
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
       lty = 1,
       box.lty = 0)
       
# Plot 4: Global reactive power
plot(dat4$Datetime, dat4$Global_reactive_power, 
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power")

# Close graphics device and save to file
dev.off()