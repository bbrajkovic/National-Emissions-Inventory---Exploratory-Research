# Question 6:
# Compare emissions from motor vehicle sources in Baltimore City with emissions
# from motor vehicle sources in Los Angeles County, California (fips == 06037).
# Which city has seen greater changes over time in motor vehicle emissions?

## Load required libraries
library(ggplot2)

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

## Subset data related to motor vehicles in Baltimore and LA
pm25MV <- pm25[which(pm25$SCC %in% codeTable[grep("motor",codeTable$SCC.Level.Three,ignore.case = TRUE),"SCC"]),]
cityCode <- c("24510","06037")
pm25MVByCityCode  <-subset(pm25MV,fips %in% cityCode)



## Plotting Emissions related to motor vechicles source
g<-ggplot(pm25MVByCityCode,aes(year,Emissions,color=fips))
g+geom_line(stat = "summary",fun.y="sum")+ 
  labs(y="Emissions related to motor vehicle for LA and Baltimore City",x="Year (1999 - 2008)")+
  scale_colour_discrete(name = "City", label = c("Los Angeles","Baltimore"))

ggsave ("plot6.png", width = 5, height = 5, units = "in", dpi = 96)