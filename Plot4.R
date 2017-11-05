##Question 4 - Pan USA Emission from Coal combustion
setwd("C:/Users/user/coursera/My Rcodes/Data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
coal_emission<- grep("[Cc][Oo][Aa][Ll]",SCC$Short.Name)
temp_scc<-SCC[coal_emission,]
temp_scc<- as.character(temp_scc$SCC)
coal<- NEI[which(NEI$SCC %in%temp_scc),]
g<- ggplot(coal,aes(year, Emissions))
g+geom_line(stat="summary", fun.y="sum")
dev.copy(png,"plot4.png")
dev.off()