# Question 1:
# Have total emissions from PM2.5 decreased in the United States from 1999 to
# 2008? Using the base plotting system, make a plot showing the total PM2.5
# emission from all sources for each of the years 1999, 2002, 2005, and 2008.

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

## Plotting total pm 2.5 emissions from 1999 to 2008

annualPm25 <- tapply (pm25$Emissions, pm25$year, sum)
plot (names(annualPm25), annualPm25,
      xlab = "Years",
      ylab = "Total PM 2.5 emissions",
      main = "Total PM 2.5 emissions in US by Year",
      type = "b")
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()
