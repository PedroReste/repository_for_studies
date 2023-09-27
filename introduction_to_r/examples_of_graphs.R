#GOOD GRAPHS

#BAR CHARTS
#Bar chart with distinction in the bar (Good use for channels chart)
library(ggplot2)
ggplot(data = diamonds, mapping = aes(x = cut, fill = clarity)) + 
  geom_bar()

#Adjust the color opacity
ggplot(data = diamonds, mapping = aes(x = cut, fill = clarity)) + 
  geom_bar(alpha = 4/5, position = "identity")

#Remove the color
ggplot(data = diamonds, mapping = aes(x = cut, colour = clarity)) + 
  geom_bar(fill = NA, position = "identity")

#100% bar chart
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "fill")

#Segment the data per third categorical variable
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "dodge")

#BOXPLOTS CHARTS
ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + 
  geom_boxplot()

ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + 
  geom_boxplot() +
  coord_flip()
