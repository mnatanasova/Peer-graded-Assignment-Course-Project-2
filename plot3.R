NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
#   which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City?
#   Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

subsetNEI <- NEI[NEI$fips == "24510", c(1,4,5,6)]
Total_Emissins_Baltimore_by_type <- aggregate(Emissions ~ year + type, subsetNEI, sum)

library(ggplot2)
png("plot3.png")
g <- ggplot(Total_Emissins_Baltimore_by_type, aes(year, Emissions, color = type))
g <- g + geom_line() +
     xlab("year") +
     ylab(expression("Total PM"[2.5]*" Emissions")) +
     ggtitle("Total Emissions in Baltimore from 1999 to 2008")
print(g)
dev.off()
