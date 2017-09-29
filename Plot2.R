##################
##
## Course: Exploratory Data Analysis
##
## Week 1 Assignement
##
## Plot 2
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
png("Plot2.png", 480, 480)

#Creating extra variable for clarity
GlobalActivePower<-as.numeric(as.character(power_data_subset$Global_active_power))
Days<-as.Date(power_data_subset$Date, "%d/%m/%Y")
Time<-strptime(paste(Days,power_data_subset$Time), "%Y-%m-%d %H:%M:%S")

#Plotting
plot(Time, GlobalActivePower, xlab="", ylab= "Global Active Power (kilowatts)", type = "l")

#Close the file
dev.off()