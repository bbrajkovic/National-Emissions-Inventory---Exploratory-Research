# Question 4:
# Across the United States, how have emissions from coal combustion-related
# sources changed from 1999-2008?

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

## Subset data related to coal
pm25Coal<- pm25[which(pm25$SCC %in% codeTable[grep("coal",codeTable$Short.Name,ignore.case = TRUE),"SCC"]),]

## Plotting Emissions related to coal combustion source
g<-ggplot(pm25Coal,aes(year,Emissions))
g+geom_line(stat = "summary",fun.y="sum")+ 
    labs(y="Emissions related to coal combustion source",x="Year (1999 - 2008)")

ggsave ("plot4.png", width = 5, height = 5, units = "in", dpi = 96)