NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037").
#   Which city has seen greater changes over time in motor vehicle emissions?

subsetNEI <- NEI[(NEI$fips == "24510"|NEI$fips == "06037") & NEI$type == "ON-ROAD", ]
subsetNEI$fips <- ifelse(subsetNEI$fips == "24510", "Baltimore", "Los Angeles")
Total_Emissions_on_road_Baltimore_LA <- aggregate(Emissions ~ year + fips, subsetNEI, sum)

png("plot6.png")
g <- ggplot(Total_Emissions_on_road_Baltimore_LA, aes(factor(year), Emissions))
g <- g + facet_grid(. ~ fips)
g <- g + geom_bar(stat="identity")  +
     xlab("year") +
     ylab(expression('Total PM'[2.5]*" Emissions")) +
     ggtitle("Total Emissions from motor vehicle BAltimore vs Los Angeles 1999-2008")
print(g)
dev.off()
