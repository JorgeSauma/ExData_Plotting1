##################
##
## Course: Exploratory Data Analysis
##
## Week 1 Assignement
##
## Plot 3
## By Jorge Sauma
##################

# Load data. It's assumed that the file is in the working directory
power_data<-read.table("household_power_consumption.txt", sep=";", header=TRUE)

#Subset data and remove the full table to save memory
power_data_subset<-subset(power_data, (as.Date(power_data$Date, "%d/%m/%Y")>="2007-02-01") & (as.Date(power_data$Date, "%d/%m/%Y")<="2007-02-02"))
rm(power_data)

# Changing language to english to make it easier for reviewers
Sys.setenv("LANGUAGE"="En")
Sys.setlocale(locale = "en_US.UTF-8")

#Open the PNG device
png("Plot3.png", 480, 480)

#Creating extra variable for clarity
Days<-as.Date(power_data_subset$Date, "%d/%m/%Y")
Time<-strptime(paste(Days,power_data_subset$Time), "%Y-%m-%d %H:%M:%S")

#Plotting
plot(Time, as.numeric(as.character(power_data_subset$Sub_metering_1)), type = "l", ylab= "Energy sub metering")
lines(Time, as.numeric(as.character(power_data_subset$Sub_metering_2)), type = "l", col="red")
lines(Time, as.numeric(as.character(power_data_subset$Sub_metering_3)), type = "l", col="blue")

legend("topright", legend=names(power_data_subset[7:9]), col=c("black","red", "blue"), lty=1)

#Close the file
dev.off()