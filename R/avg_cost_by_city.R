#' Average trip cost for each city
#'
#' This function groups trips by city and finds the average total_cost
#' for each city in the data.
#'
#' @param data A data frame that has columns called city and total_cost.
#'
#' @return A data frame with two columns: city and average_cost.
#'
#' @examples
#' data(travel_data)
#' avg_cost_by_city(travel_data)
#'
#' @export
avg_cost_by_city <- function(data) {

  # Check that the input is a data frame
  if (!is.data.frame(data)) {
    stop("Please give me a data frame as input.")
  }

  # Check that needed columns are there
  if (!("city" %in% names(data))) {
    stop("The data must have a column called city.")
  }

  if (!("total_cost" %in% names(data))) {
    stop("The data must have a column called total_cost.")
  }

  # Make sure total_cost is numeric
  if (!is.numeric(data$total_cost)) {
    stop("The total_cost column must be numeric.")
  }

  # Get unique cities
  cities <- unique(data$city)

  # Make an empty vector to store results
  avg_cost <- numeric(length(cities))

  # Loop through each city and calculate the average
  for (i in 1:length(cities)) {
    city_name <- cities[i]
    these_rows <- data[data$city == city_name, ]
    avg_cost[i] <- mean(these_rows$total_cost)
  }

  # Create a final data frame to return
  result <- data.frame(
    city = cities,
    average_cost = avg_cost
  )

  return(result)
}
