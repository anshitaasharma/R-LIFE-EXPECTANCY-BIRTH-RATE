# Load necessary libraries
library(ggplot2)

# Attach the dataset (not recommended, but I'm keeping it as in your original code)
attach(World.Trendss)

# Filtering data frames for the years 1960 and 2013
data1960 <- World.Trendss[World.Trendss$Year == 1960,]
data2013 <- World.Trendss[World.Trendss$Year == 2013,]

# Creating additional data frames for life expectancy in 1960 and 2013
add1960 <- data.frame(Code = Country_Code, Life.Exp = Life_Expectancy_At_Birth_1960)
add2013 <- data.frame(Code = Country_Code, Life.Exp = Life_Expectancy_At_Birth_2013)

# Merging the pairs of data frames
merged1960 <- merge(data1960, add1960, by.x = "Country.Code", by.y = "Code")
merged2013 <- merge(data2013, add2013, by.x = "Country.Code", by.y = "Code")

# Removing the "Year" column, as it is no longer needed
merged1960$Year <- NULL
merged2013$Year <- NULL

# Checking the presence of 'Region' column in the merged datasets
if (!("Region" %in% colnames(merged1960))) {
  stop("Region column is missing in merged1960 dataset.")
}
if (!("Region" %in% colnames(merged2013))) {
  stop("Region column is missing in merged2013 dataset.")
}

# Scatter plot for life expectancy in 1960
ggplot(data = merged1960) +
  geom_point(aes(x = Country.Code, y = Life.Exp, color = Region),
             size = 5, alpha = 0.6) +
  scale_color_manual(values = c("Asia" = "blue", "Europe" = "green", "Africa" = "red", "Americas" = "orange", "Oceania" = "purple")) +
  labs(x = "Country Code", y = "Life Expectancy at Birth", title = "Life Expectancy (1960)")

# Bar graph for life expectancy in 2013
ggplot(data = merged2013) +
  geom_bar(aes(x = Country.Code, y = Life.Exp, fill = Region),
           stat = "identity") +
  scale_fill_manual(values = c("Asia" = "blue", "Europe" = "green", "Africa" = "red", "Americas" = "orange", "Oceania" = "purple")) +
  labs(x = "Country Code", y = "Life Expectancy at Birth", title = "Life Expectancy (2013)")

