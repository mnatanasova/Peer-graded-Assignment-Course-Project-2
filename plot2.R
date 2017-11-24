NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#2. Have total emissions from PM2.5 decreased in the Baltimore City,
#   Maryland (fips == "24510") from 1999 to 2008?
#   Use the base plotting system to make a plot answering this question.

subsetNEI <- NEI[NEI$fips == "24510", c(1,4,6)]
Total_Emissins_Baltimore <- aggregate(Emissions ~ year, subsetNEI, sum)

png("plot2.png")
barplot(height = Total_Emissins_Baltimore$Emissions, 
        names.arg=Total_Emissins_Baltimore$year, 
        xlab="years",
        ylab=expression("total PM"[2.5]*" emission in Baltimore"),
        main=expression("Total PM"[2.5]*" emissions per year"))
dev.off()
