# Create data frame with iso3 country codes and a drug measure

# x data frame (DF) edition instructions:
# Step 1: Identify and write the iso3 codes of interest countries in the "country" column
# Step 2: Associate countries with desired drug measure in the "drug_measure" column

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

# Get map
worldmap <- getMap(resolution = "coarse")

# Plot worldmap --> TO-DO: adjust dimensions to optimize resolution
plot(worldmap, col = "lightgrey", 
     fill = T, border = "darkgray",
     xlim = c(-180, 180), ylim = c(-90, 90),
     bg = "aliceblue",
     asp = 1, wrap=c(-180,180))

# Combine DF with map --> automatic association of DF to pre-recorded map
drugMap <- joinCountryData2Map(x, joinCode = "ISO3", nameJoinColumn = "country")

# def. map parameters, e.g. def. colors
mapParams <- mapCountryData(drugMap, 
                            
                            # Match this param with the "drug_measure" column <--
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

# Add legend and display map
do.call(addMapLegendBoxes, c(mapParams,
                             x = 'bottom',
                             title = "Drug measure",
                             horiz = TRUE,
                             bg = "transparent",
                             bty = "n"))

