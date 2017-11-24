NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#4. Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

SCC_coal = SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE),]
NEI_SCC_coal <- merge(x=NEI, y=SCC_coal, by="SCC")
Total_NEI_SCC_coal <- aggregate(Emissions ~ year, NEI_SCC_coal, sum)

png("plot4.png")
g <- ggplot(Total_NEI_SCC_coal, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
     xlab("year") +
     ylab(expression("Total PM"[2.5]*" Emissions")) +
     ggtitle("Total Emissions from coal sources from 1999 to 2008")
print(g)
dev.off()
