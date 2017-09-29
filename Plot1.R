##################
##
## Course: Exploratory Data Analysis
##
## Week 1 Assignement
##
## Plot 1
## By Jorge Sauma
##################

# Load data. It's assumed that the file is in the working directory
power_data<-read.table("household_power_consumption.txt", sep=";", header=TRUE)

#Subset data and remove the full table to save memory
power_data_subset<-subset(power_data, (as.Date(power_data$Date, "%d/%m/%Y")>="2007-02-01") & (as.Date(power_data$Date, "%d/%m/%Y")<="2007-02-02"))
rm(power_data)

#Open the PNG device
png("Plot1.png", 480, 480)

#Create the histogram. Data must be converted to numeric.
hist(as.numeric(as.character(power_data_subset$Global_active_power)), col = "red", main= "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

#Close the file
dev.off()
