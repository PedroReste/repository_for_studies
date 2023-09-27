#mpg is a dataset from ggplot2 library, it contains data about US Environmental
#Protection Agency on 38 models of car
dataset <-  ggplot2::mpg
dataset

#dataset information: "displ", a car’s engine size, in litres. / "hwy", a car’s 
#fuel efficiency on the highway, in miles per gallon (mpg).

#ggplot helps to create a frame for a type of graph
ggplot(data= dataset) +
  #It's like a fuction to create a Scatterplot
  geom_point(mapping = aes(x= displ, y = hwy))

#EXERCISES
# 1. Run ggplot(data = mpg). What do you see?
#Blank canvas

# 2. How many rows are in mpg? How many columns?
# 234 x 11

# 3. What does the drv variable describe? Read the help for ?mpg to find out.
unique(dataset$drv)
?mpg
#the type of drive train, where f = front-wheel drive, r = rear wheel drive,
#4 = 4wd

# 4. Make a scatterplot of hwy vs cyl.
ggplot(data= dataset) +
  geom_point(mapping = aes(x= hwy, y = cyl))

# 5. What happens if you make a scatterplot of class vs drv? Why is the plot 
# not useful?
ggplot(data= dataset) +
  geom_point(mapping = aes(x= class, y = drv))
#R: It's not useful 'cause it's two categorical variabels

#A graph with geom_count It's better 'cause count the number of samples on
#the same spot e changes the size of the dots
ggplot(data= dataset) +
  geom_count(mapping = aes(x= class, y = drv))
#---------------------------------------------------------------------------

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")

#EXERCISES
# 1. What’s gone wrong with this code? Why are the points not blue?
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = "blue"))
#Because the color inside the parentheses of aes it's related with a
#categorical information and not a change of color dots.
#To change the color dots, the correct it's set "color" afeter naming the
#"mappig", like: (mapping = aes(x = displ, y = hwy), color = "blue")

# 2. Which variables in mpg are categorical? Which variables are continuous? 
#(Hint: type ?mpg to read the documentation for the dataset). 
#How can you see this information when you run mpg?
?mpg
#Categorical: manufacturer, model, cyl, trans, drv, fl, class
#Continuous: displ, year, cty, hwy
  
# 3. Map a continuous variable to color, size, and shape. How do these 
#aesthetics behave differently for categorical vs. continuous variables?
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = manufacturer))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, size = manufacturer))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape = manufacturer))

#To many options for size and shape ins't the ideal, it's better when 
#few options
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = drv))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, size = drv))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape = drv))

  
# 4. What happens if you map the same variable to multiple aesthetics?
# Depends of the aesthetics used on graph and the variable, some suits better,
#others not
  
# 5. What does the stroke aesthetic do? What shapes does it work with?
#(Hint: use ?geom_point)
?geom_point

# 6. What happens if you map an aesthetic to something other than a variable
#name, like aes(colour = displ < 5)? Note, you’ll also need to 
#specify x and y.
ggplot(data = dataset) + 
  geom_point(mapping = aes(x = displ, y = hwy, color= displ < 5))
#Creates a condition for group of the x and y
#---------------------------------------------------------------------------
library(ggplot2)

dataset <-  ggplot2::mpg

ggplot(data = dataset) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)

ggplot(data = dataset) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(drv ~ cyl)

ggplot(data = dataset) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(. ~ cyl)

#EXERCISES
# 1.What happens if you facet on a continuous variable?

#   R: Using continuous variables will distort the graphs because the match
#   between can be very extense, different of categorical variables, it has
#   usually few values

ggplot(data = dataset) + 
  geom_point(mapping = aes(x = cty, y = cyl)) + 
  facet_grid(cty ~ cyl)
  
# 2.What do the empty cells in plot with facet_grid(drv ~ cyl) mean?
#   How do they relate to this plot?
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = drv, y = cyl))

# R: The spots meaning the matching of the columns on the dataset, in other words
#   mean a sample has, for example, cyl = 6 and drv = 4

# 3.What plots does the following code make? What does . do?
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(. ~ cyl)

# R: the facet_grid is a information to separate two variables in categories,
# and the difference between the codes is the orientation of the categorical
# variable to separete the two continous variables, 
# in horizontal or vertical shape

# 4.Take the first faceted plot in this section:
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)
#   What are the advantages to using faceting instead of the colour aesthetic?
# R: Became clear the avaliable data between two continous variables.

#   What are the disadvantages?
# R: If the categorical variable used to separete the data has many values,
# can be difficult to read the graph

#   How might the balance change if you had a larger dataset?
# R: The best use between a faceting and colour aesthetic is the so many values
# the categorical value has it.
# To many values, I understand, it is better use a colour aesthetic, if is the
# inverse, use the faceting aesthetic

# 5.Read ?facet_wrap. What does nrow do? What does ncol do? What other options 
#   control the layout of the individual panels? Why doesn’t facet_grid() have 
#   nrow and ncol arguments?
?facet_wrap

# 6.When using facet_grid() you should usually put the variable with more 
#   unique levels in the columns. Why?

# R: to better visualization

#Good graph
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = cty)) +
  facet_grid(drv ~ .)

#Bad one
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = cty, y = displ)) +
  facet_grid(. ~ drv)

#------------------------------------------------------------------------------
#EXERCISES
# 1. What geom would you use to draw a line chart? A boxplot? A histogram? 
# An area chart?

#Line chat
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = cty, y = displ))

#Boxplot
ggplot(mpg, aes(drv, hwy)) +
  geom_boxplot()

ggplot(mpg, aes(drv, hwy)) +
  geom_violin(trim = FALSE) +
  geom_boxplot(width = 0.2)

ggplot(mpg, aes(cty, hwy)) +
  geom_boxplot()

ggplot(mpg, aes(cty, hwy)) +
  geom_violin(trim = FALSE) +
  geom_boxplot(width = 0.2)

#Histogram
ggplot(data = mpg, aes(hwy)) + 
  geom_histogram(bins= 10, fill= "white", color="black")

#Area Chart
ggplot(data = mpg, aes(cyl)) +
  geom_density(fill= "lightgrey")

# 2. Run this code in your head and predict what the output will look like. 
# Then, run the code in R and check your predictions.
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) + 
  geom_point() + 
  geom_smooth(se = FALSE)

# 3. What does show.legend = FALSE do? What happens if you remove it?
# Why do you think I used it earlier in the chapter?

# 4. What does the se argument to geom_smooth() do?

# 5. Will these two graphs look different? Why/why not?
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_smooth()

ggplot() + 
  geom_point(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_smooth(data = mpg, mapping = aes(x = displ, y = hwy))

#------------------------------------------------------------------------------
#Bar chart with distinction in the bar (Good use for channels chart)
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity))

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

#------------------------------------------------------------------------------
ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + 
  geom_boxplot()

ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + 
  geom_boxplot() +
  coord_flip()