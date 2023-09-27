#Installing packages
install.packages(c('readr', 'tidyverse', 'ggplot2', 
                   'devtools',"magrittr", "dplyr"))

#Importing packages
library(readr)
library(tidyverse)
library(ggplot2)


raw <- "https://raw.githubusercontent.com/PedroReste/introduction_to_r/main/Datasets/flavors_of_cacao.csv"
chocolateData <- read_csv(url(raw))

head(chocolateData)
tail(chocolateData, 3)

chocolateData[6,4]
chocolateData[6,]
head(chocolateData[6])

head(chocolateData[-1,])

names(chocolateData) <- gsub("[[:space:]+]", "_", names(chocolateData))
str(chocolateData)

head(chocolateData$Rating)

chocolateData$Cocoa_Percent <- sapply(chocolateData$Cocoa_Percent, function(x) gsub("%", "", x))
chocolateData <- type_convert(chocolateData)
str(chocolateData)

summary(chocolateData)

chocolateData %>%
  summarise(averageRating = mean(Rating),
            sdRating = sd(Rating))

ggplot(chocolateData, aes(x= Review_Date, y = Rating)) + geom_point()

ggplot(chocolateData, aes(x= Review_Date, y = Rating)) + geom_point() + geom_jitter()

ggplot(chocolateData, aes(x= Review_Date, y = Rating)) +
  geom_point() +
  geom_jitter() +
  geom_smooth(method = 'lm')
