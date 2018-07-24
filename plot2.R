# Question 2:
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland
# (fips == "24510") from 1999 to 2008? Use the base plotting system to make a
# plot answering this question.

## Downloading and Reading data into datasets

if(!file.exists("data_file.zip"))
{
        sourceurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
        download.file(sourceurl, destfile = "data_file.zip")
        unzip("data_file.zip", list = TRUE) 
        unzip("data_file.zip") 
        rm(sourceurl)
}

pm25<-readRDS("summarySCC_PM25.rds")
codeTable<-readRDS("Source_Classification_Code.rds")

## Subset data for Baltimore (fips == "24510")
pm25Baltimore <- subset(pm25, fips == "24510")

## Plotting total pm 2.5 emissions from 1999 to 2008

annualPm25Baltimore <- tapply (pm25Baltimore$Emissions, pm25Baltimore$year, sum)
plot (names(annualPm25Baltimore), annualPm25Baltimore,
      xlab = "Years",
      ylab = "Total PM 2.5 emissions",
      main = "Total PM 2.5 emissions in Baltimore US by Year",
      type = "b")
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()