setwd("~/PHATE")
library(phateR)
library(ggplot2)
library(readr)
library(viridis)
library(jcolors)
library(Rmagic)
MarkerData <- read.csv("Marker_data_norm_sample.csv")
LabelsData <- read.csv("Labels.csv")
MarkerData_PHATE <- phate(MarkerData,k=100)
#Discrete Labels
ROI <- factor(LabelsData$ROI)
TCellClass <- factor(LabelsData$Class)
PhatePlot <- ggplot(MarkerData_PHATE)+geom_point(aes(x=PHATE1, y=PHATE2, color=TCellClass))+labs(color="Class") +
                       scale_color_jcolors(palette = "pal2")+
                       theme(panel.background = element_rect(fill = 'grey', colour = 'white')) +
                       theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
                       theme(legend.key = element_rect(fill = 'grey'))
plot(PhatePlot)
#Continuous Marker Expression, three color gradient
Marker <- MarkerData$NFAT1
PhatePlot <- ggplot(MarkerData_PHATE)+geom_point(aes(x=PHATE1, y=PHATE2, color=Marker))+labs(color="NFAT1")+scale_colour_gradient2( 
                       low = "blue", mid = "white",
                       high = "red", midpoint = 0.5, space = "Lab",
                       na.value = "grey50", guide = "colourbar", aesthetics = "colour") + 
                       theme(panel.background = element_rect(fill = 'grey', colour = 'white')) +
                       theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
                       theme(legend.key = element_rect(fill = 'grey'))
plot(PhatePlot)