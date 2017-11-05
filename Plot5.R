##Question 5 - 
setwd("C:/Users/user/coursera/My Rcodes/Data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(ggplot2)
motor_emission<- grep("[Mm][Oo][Tt][Oo][Rr]",SCC$SCC.Level.Three)
temp_scc<-SCC[motor_emission,]
temp_scc<- as.character(temp_scc$SCC)
temp_motor<- NEI[which(NEI$SCC %in%temp_scc),]
temp_motor<-subset(temp_motor,temp_motor$fips=="24510")
g<- ggplot(temp_motor,aes(year, Emissions))
g+geom_line(stat="summary", fun.y="sum")+ labs( y="Emissions from Motor Vehicles", x="Years")
dev.copy(png,"plot5.png")
dev.off()