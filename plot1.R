# PREPARE DATA

# Read in raw data
fulldat <- read.csv("household_power_consumption.txt", sep =";", na.strings = "?")

# Convert Date column to date format
fulldat$Date <- as.Date(fulldat$Date, "%d/%m/%Y")

# Subset to dates required for assignment
dat1 <- subset(fulldat, Date == "2007-02-01" | Date == "2007-02-02")

# CONSTRUCT PLOT

# Load PNG graphics device, construct plot, close graphics device and print to file
png("plot1.png")
hist(dat1$Global_active_power, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()