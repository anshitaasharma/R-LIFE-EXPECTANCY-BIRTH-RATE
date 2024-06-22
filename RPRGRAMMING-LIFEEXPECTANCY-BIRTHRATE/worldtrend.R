attach(World.Trendss)
head(World.Trendss,8)
tail(World.Trendss,8)
str(World.Trendss)#checking the structure of data frame
summary(World.Trendss)
World.Trendss$Year#investigating how many different database are there in dataset
data1960 <- World.Trendss[World.Trendss$Year==1960,]#filtering data frames
data2013 <- World.Trendss[World.Trendss$Year==2013,]
nrow(data1960)#checking row counts for 1960
nrow(data2013)#1930
add1960 <- data.frame(Code=Country_Code, Life.Exp=Life_Expectancy_At_Birth_1960)
add2013 <- data.frame(Code=Country_Code, Life.Exp=Life_Expectancy_At_Birth_2013)
summary(add1960)#checking datframes
summary(add2013)
#merging the pairs of datfarmes
merged1960 <- merge(data1960, add1960, by.x="Country.Code", by.y="Code")
merged2013 <- merge(data2013, add2013, by.x="Country.Code", by.y="Code")
#checking the new structure
str(merged1960)
str(merged2013)
#Since each dataset has the year as part of the name,column “Year” is no longer required. We’ll remove it now.
merged1960$Year <- NULL
merged2013$Year <- NULL
str(merged1960)
str(merged2013)
library(ggplot2)
ggplot(data = merged2013) +
  geom_point(aes(x = Country.Code, y = Life.Exp, color = Rgion),
             size = 5, alpha = 0.6) +
  scale_color_manual(values = c("Asia" = "blue", "Europe" = "green", "Africa" = "red", "Americas" = "orange", "Oceania" = "purple")) +
  labs(x = "Country Code", y = "Life Expectancy at Birth", title = "Life Expectancy (2013)")

