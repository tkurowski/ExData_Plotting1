library(sqldf)

# select <- "select * from file where Date = '1/2/2007' or Date = '2/2/2007'"
select <- "select * from file where Date in ('1/2/2007', '2/2/2007')"

# read
df <- read.csv2.sql('household_power_consumption.txt', sql = select, na.strings = '?')
# mutate
#df$Date <- as.Date(df$Date)
#df$Time <- strptime(df$Time, "%H:%M:%S")

png(file = "plot1.png")

hist(df$Global_active_power,
     col = 'red',
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

dev.off()