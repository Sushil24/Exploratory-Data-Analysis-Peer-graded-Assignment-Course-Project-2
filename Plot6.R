##Question 6 - 
library(ggplot2)
setwd("C:/Users/user/coursera/My Rcodes/Data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
motor_emission<- grep("[Mm][Oo][Tt][Oo][Rr]",SCC$SCC.Level.Three)
temp_scc<-SCC[motor_emission,]
temp_scc<- as.character(temp_scc$SCC)
temp_motor<- NEI[which(NEI$SCC %in%temp_scc),]
motor<-subset(temp_motor,temp_motor$fips==c("24510","06037"))
motor$fips<- as.factor(motor$fips)
g<- ggplot(motor,aes(year, Emissions, color=fips))
g+geom_line(stat="summary", fun.y="sum")+ labs(y="Emissions from Motor Vehicle from Baltimore and LosAngeles")+scale_color_discrete(name="City", label=c("Los Angeles", "Baltimore"))
dev.copy(png,"plot6.png")
dev.off()