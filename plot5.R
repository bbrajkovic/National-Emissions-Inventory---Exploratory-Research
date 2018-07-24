# Question 5:
# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

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

## Subset data related to motor vehicles in Baltimore
pm25MV<- pm25[which(pm25$SCC %in% codeTable[grep("motor",codeTable$SCC.Level.Three,ignore.case = TRUE),"SCC"] & pm25$fips=="24510"),]


## Plotting Emissions related to motor vechicles source
g<-ggplot(pm25MV,aes(year,Emissions))
g+geom_line(stat = "summary",fun.y="sum")+ 
  labs(y="Emissions related to motor vehicle for Baltimore City",x="Year (1999 - 2008)")

ggsave ("plot5.png", width = 5, height = 5, units = "in", dpi = 96)