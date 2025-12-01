CityTripsR is a small R package that helps summarize and explore basic city travel data. It includes a built-in dataset (travel_data) along with several functions that show how to calculate trip durations, compare costs, explore ratings, filter trips, and create a simple plot. 

Trips in the dataset include the city name, cost, rating, travel type, and start/end dates. The trip_duration() function figures out how long each trip lasted. avg_cost_by_city() and avg_rating_by_travel_type() compute the average cost or average rating for the different categories. filter_trips() lets you narrow down the data by minimum cost or minimum rating. The package also includes plot_cost_by_city(), which produces a quick bar chart comparing average costs across cities. Finally, trip_summary() provides a simple S3 summary object that puts the key statistics together in one place.

To install the package from GitHub, use: devtools::install_github("Fgorrini/cityTripsR")

After installing, you can open the full tutorial vignette with: browseVignettes("cityTripsR")
