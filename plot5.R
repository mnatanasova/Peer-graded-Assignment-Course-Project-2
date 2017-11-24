NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#5. How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

subset_NEI <- NEI[NEI$fips == "24510" & NEI$type == "ON-ROAD", ]
Total_Emissina_Baltimore_on_road <- aggregate(Emissions ~ year, subset_NEI, sum)

png("plot5.png")
g <- ggplot(Total_Emissina_Baltimore_on_road, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
     xlab("year") +
     ylab(expression("Total PM"[2.5]*" Emissions")) +
     ggtitle("Total Emissions from motor vehicle in Baltimore from 1999 to 2008")
print(g)
dev.off()

