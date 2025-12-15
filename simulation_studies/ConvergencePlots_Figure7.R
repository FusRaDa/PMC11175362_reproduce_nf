library(ggplot2)
library(gridExtra)
library(grid)
library(dplyr)

#set desired directory, likely downloads
#setwd("Downloads/ToxPi-Weight-Estimation")

#set file input args instead
args <- commandArgs(trailingOnly = TRUE)
input_file_path1 <- args[1]
input_file_path2 <- args[2]
input_file_path3 <- args[3]
input_file_path4 <- args[4]
input_file_path5 <- args[5]
input_file_path6 <- args[6]
input_file_path7 <- args[7]
input_file_path8 <- args[8]
input_file_path9 <- args[9]
input_file_path10 <- args[10]
input_file_path11 <- args[11]
input_file_path12 <- args[12]
input_file_path13 <- args[13]
input_file_path14 <- args[14]
input_file_path15 <- args[15]
input_file_path16 <- args[16]
input_file_path17 <- args[17]
input_file_path18 <- args[18]
input_file_path19 <- args[19]
input_file_path20 <- args[20]

#load in MAE data for varying convergence
load(input_file_path1)
errorDF_50 <- errorDF
load(input_file_path2)
errorDF_100 <- errorDF
load(input_file_path3)
errorDF_500 <- errorDF
load(input_file_path4)
errorDF_1000 <- errorDF

errorDF <- rbind(errorDF_50, errorDF_100, errorDF_500, errorDF_1000)

#get normal distribution data
normDF <- errorDF[errorDF$Distribution==1,]

#get only 6 slices and norm data
norm_6SlicesDF <- normDF[normDF$NoSlices==9,]

#prepare plots
plotlist <- list()

#assign ordinal convergence results to rows as 0 convergeLim
for(i in c(1:5)){
  tmpRow <- norm_6SlicesDF[i,]
  tmpRow$ConvergeLim <- 0
  tmpRow$GAConvergence <- tmpRow$OrdinalConvergence
  tmpRow$GaRunningTime <- tmpRow$OrdRunningTime
  norm_6SlicesDF <- rbind(norm_6SlicesDF, tmpRow)
}

#plot convergence results vs convergence lim
p1a <- ggplot(norm_6SlicesDF, aes(factor(ConvergeLim), GAConvergence, color = factor(KnownRatio),
                                  group = factor(KnownRatio), type = "o")) + geom_line() + geom_point() + 
  ggtitle("1A: # of Successful Convergences") + theme_bw() + 
  theme(legend.position = "None", plot.title = element_text(hjust = 0.5)) +
  labs(x = 'Convergence Limit', y = '# of Converges', color = "Known Ratio")

#plot running time results vs convergence lim
p1b <- ggplot(norm_6SlicesDF, aes(factor(ConvergeLim), GaRunningTime - OrdRunningTime, color = factor(KnownRatio),
                                  group = factor(KnownRatio), type = "o")) + geom_line() + geom_point() + 
  ggtitle("1B: Average Change in Run Time") + theme_bw() + theme(legend.position = "None",plot.title = element_text(hjust = 0.5)) + 
  labs(x = 'Convergence Limit', y = 'Running Time (sec)')


#get only 6 ratio and norm data
norm_6RatioDF <- normDF[normDF$KnownRatio==9,]

#assign ordinal convergence results to rows as 0 convergeLim
for(i in c(1:5)){
  tmpRow <- norm_6RatioDF[i,]
  tmpRow$ConvergeLim <- 0
  tmpRow$GAConvergence <- tmpRow$OrdinalConvergence
  tmpRow$GaRunningTime <- tmpRow$OrdRunningTime
  norm_6RatioDF <- rbind(norm_6RatioDF, tmpRow)
}

#plot convergence results vs convergence lim
p2a <- ggplot(norm_6RatioDF, aes(factor(ConvergeLim), GAConvergence, color = factor(NoSlices),
                                 group = factor(NoSlices), type = "o")) + geom_line() + geom_point() + 
  ggtitle("2A: # of Sucessful Convergences") + theme_bw() + theme(legend.position = "None",plot.title = element_text(hjust = 0.5)) +
  labs(x = 'Convergence Limit', y = '# of Converges', color = 'Number of\nSlices')

#plot running time results vs convergence lim
p2b <- ggplot(norm_6RatioDF, aes(factor(ConvergeLim), GaRunningTime - OrdRunningTime, color = factor(NoSlices),
                                 group = factor(NoSlices), type = "o")) + geom_line() + geom_point() + 
  ggtitle("2B: Average Change in Run Time") + theme_bw() + theme(legend.position = "None",plot.title = element_text(hjust = 0.5)) +
  labs(x = 'Convergence Limit', y = 'Running Time (sec)')


#get results for changing total samples
load(input_file_path5)
errorDF_50 <- errorDF
load(input_file_path6)
errorDF_50 <- rbind(errorDF_50, errorDF)
load(input_file_path7)
errorDF_50 <- rbind(errorDF_50, errorDF)
load(input_file_path8)
errorDF_50 <- rbind(errorDF_50, errorDF)

load(input_file_path9)
errorDF_100 <- errorDF
load(input_file_path10)
errorDF_100 <- rbind(errorDF_100, errorDF)
load(input_file_path11)
errorDF_100 <- rbind(errorDF_100, errorDF)
load(input_file_path12)
errorDF_100 <- rbind(errorDF_100, errorDF)

load(input_file_path13)
errorDF_500 <- errorDF
load(input_file_path14)
errorDF_500 <- rbind(errorDF_500, errorDF)
load(input_file_path15)
errorDF_500 <- rbind(errorDF_500, errorDF)
load(input_file_path16)
errorDF_500 <- rbind(errorDF_500, errorDF)

load(input_file_path17)
errorDF_1000 <- errorDF
load(input_file_path18)
errorDF_1000 <- rbind(errorDF_1000, errorDF)
load(input_file_path19)
errorDF_1000 <- rbind(errorDF_1000, errorDF)
load(input_file_path20)
errorDF_1000 <- rbind(errorDF_1000, errorDF)
errorDF <- rbind(errorDF_50, errorDF_100, errorDF_500, errorDF_1000)

#get normal distribution data
normDF <- errorDF[errorDF$Distribution==1,]
#get only 6 slices and norm data 
norm_6SlicesDF <- normDF[normDF$NoSlices == 9,]
#get only 6 slices and norm data 
norm_6Slices6RatioDF <- norm_6SlicesDF[norm_6SlicesDF$KnownRatio == 9,]

#assign ordinal convergence results to rows as 0 convergeLim
for(i in c(1:4)){
  tmpRow <- norm_6Slices6RatioDF[i,]
  tmpRow$ConvergeLim <- 0
  tmpRow$GAConvergence <- tmpRow$OrdinalConvergence
  tmpRow$GaRunningTime <- tmpRow$OrdRunningTime
  norm_6Slices6RatioDF <- rbind(norm_6Slices6RatioDF, tmpRow)
}

#plot convergence results vs convergence lim
p3a <- ggplot(norm_6Slices6RatioDF, aes(factor(ConvergeLim), GAConvergence, color = factor(KnownRatio*NoSlices/NoSamples*100),
                                        group = factor(KnownRatio*NoSlices/NoSamples*100), type = "o")) + geom_line() + geom_point() + 
  ggtitle("3A: # of Sucessful Convergences") + theme_bw() + theme(legend.position = "None", plot.title = element_text(hjust = 0.5)) +
  labs(x = 'Convergence Limit', y = '# of Converges', color = 'Percent Known\nSamples')

#plot running time results vs convergence lim
p3b <- ggplot(norm_6Slices6RatioDF, aes(factor(ConvergeLim), GaRunningTime-OrdRunningTime, color = factor(NoSamples),
                                        group = factor(NoSamples), type = "o")) + geom_line() + geom_point() + 
  ggtitle("3B: Average Change in Run Time") + theme_bw() + theme(legend.position = "None",plot.title = element_text(hjust = 0.5)) +
  labs(x = 'Convergence Limit', y = 'Running Time (sec)')

#get legends from plots
g1 <- ggplotGrob(p1a + theme(legend.position="right"))$grobs
legend1 <- g1[[which(sapply(g1, function(x) x$name) == "guide-box")]]
g2 <- ggplotGrob(p2a + theme(legend.position="right"))$grobs
legend2 <- g2[[which(sapply(g2, function(x) x$name) == "guide-box")]]
g3 <- ggplotGrob(p3a + theme(legend.position="right"))$grobs
legend3 <- g3[[which(sapply(g3, function(x) x$name) == "guide-box")]]

#arrange plots and legends
output_plot <- grid.arrange(p1a,p1b,legend1,p2a,p2b,legend2,p3a,p3b,legend3, nrow = 3, ncol = 3, widths = c(2,2,0.5))
ggsave("Figure_7.png", plot = output_plot, height = 2200,  width = 3000, units = "px")