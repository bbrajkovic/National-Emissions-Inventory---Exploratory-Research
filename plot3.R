# Question 3:
# Of the four types of sources indicated by the type (point, nonpoint, onroad,
# nonroad) variable, which of these four sources have seen decreases in
# emissions from 1999-2008 for Baltimore City? Which have seen increases in
# emissions from 1999-2008? Use the ggplot2 plotting system to make a plot
# answer this question

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

## Subset data for Baltimore (fips = "24510")
pm25Baltimore <- subset(pm25, fips = "24510")

## Plotting total pm 2.5 emissions from 1999 to 2008
g<-ggplot(pm25Baltimore,aes(year,Emissions,color=type))
g+geom_line(stat = "summary", fun.y="sum") + 
  labs(y="Emissions for Baltimore City ", x="Year (1999 - 2008)")

ggsave ("plot3.png", width = 5, height = 5, units = "in", dpi = 96)