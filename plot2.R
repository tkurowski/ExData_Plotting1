library(sqldf)

# select <- "select * from file where Date = '1/2/2007' or Date = '2/2/2007'"
select <- "select * from file where Date in ('1/2/2007', '2/2/2007')"

# read
df <- read.csv2.sql('household_power_consumption.txt', sql = select, na.strings = '?')
# mutate
df$datetime = strptime(paste(df$Date, df$Time), '%d/%m/%Y %H:%M:%S')

png(file = "plot2.png")

plot(df$datetime, df$Global_active_power, type = 'n', xlab = '',
     ylab = "Global Active Power (kilowatts)")
lines(df$datetime, df$Global_active_power)

dev.off()