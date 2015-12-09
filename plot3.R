library(sqldf)

# select <- "select * from file where Date = '1/2/2007' or Date = '2/2/2007'"
select <- "select * from file where Date in ('1/2/2007', '2/2/2007')"

# read
df <- read.csv2.sql('household_power_consumption.txt', sql = select)
# mutate
df$datetime = strptime(paste(df$Date, df$Time), '%d/%m/%Y %H:%M:%S')

png(file = "plot3.png")

with(df, {
    plot(datetime, Sub_metering_1, type = 'n',
         xlab = '', ylab = 'Energy sub metering')
    lines(datetime, Sub_metering_1)
    lines(datetime, Sub_metering_2, col = 'red')
    lines(datetime, Sub_metering_3, col = 'blue')
    legend('topright', col = c("black", "red", "blue"), lty = 1,
           legend = grep("Sub_metering_\\d", names(df), value = TRUE))
})

dev.off()