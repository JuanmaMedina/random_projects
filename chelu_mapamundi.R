# Create data frame with iso3 country codes and number of visits
x <- data.frame(country = c("AUS", "JPN", "FIN", "CZE", "POL", "AUT", "USA", "GBR", "IRL", 
                            "DEU", "DNK", "FRA", "NDL", "BEL", "ESP", "HRV", "SVN", "NOR", 
                            "ITA", "HUN", "ROU", "BGR", "GRC", "TUR", "CHE", "ARE"),
                drug_measure = c(5, 1, 2, 1, 1, 3, 4, 4, 5, 11, 1, 1, 2, 2, 4, 
                                 4, 1, 1, 3, 1, 1, 2, 1, 1, 3, 2))
# Inspect data
head(x)

# Present frequency data on a world map
# https://slcladal.github.io/maps.html
library(rworldmap)

# get map
worldmap <- getMap(resolution = "coarse")
# plot worldmap
plot(worldmap, col = "lightgrey", 
     fill = T, border = "darkgray",
     xlim = c(-180, 180), ylim = c(-90, 90),
     bg = "aliceblue",
     asp = 1, wrap=c(-180,180))

# combine data frame with map
drugMap <- joinCountryData2Map(x, joinCode = "ISO3", nameJoinColumn = "country")

# def. map parameters, e.g. def. colors
mapParams <- mapCountryData(drugMap, 
                            
                            # Match this param with the drug measure column (line 5) <--
                            nameColumnToPlot="drug_measure",
                            
                            oceanCol = "azure2",
                            catMethod = "categorical",
                            missingCountryCol = gray(.8),
                            colourPalette = c("coral",
                                              "coral2",
                                              "coral3", "orangered", 
                                              "orangered3", "orangered4"),
                            addLegend = F,
                            mapTitle = "",
                            border = NA)

# add legend and display map
do.call(addMapLegendBoxes, c(mapParams,
                             x = 'bottom',
                             title = "No. of visits",
                             horiz = TRUE,
                             bg = "transparent",
                             bty = "n"))

