#' @import ggplot2
#'
#' @title Plot average trip cost by city
#'
#' @description
#' This function makes a bar chart that shows the average trip
#' cost for each city in the data.
#'
#' @param data A data frame that has columns called city and total_cost.
#'
#' @return A ggplot object showing a bar chart of average cost by city.
#'
#' @examples
#' data(travel_data)
#' plot_cost_by_city(travel_data)
#'
#' @export
plot_cost_by_city <- function(data) {

  # Check input is a data frame
  if (!is.data.frame(data)) {
    stop("Please give me a data frame as input.")
  }

  # Check needed columns
  if (!("city" %in% names(data))) {
    stop("The data must have a column called city.")
  }

  if (!("total_cost" %in% names(data))) {
    stop("The data must have a column called total_cost.")
  }

  # Calculate average cost for each city
  cities <- unique(data$city)
  avg_cost <- numeric(length(cities))

  for (i in 1:length(cities)) {
    city_name <- cities[i]
    these_rows <- data[data$city == city_name, ]
    avg_cost[i] <- mean(these_rows$total_cost)
  }

  # Make a data frame for plotting
  plot_data <- data.frame(
    city = cities,
    average_cost = avg_cost
  )

  # Bar chart
  p <- ggplot(plot_data, aes(x = city, y = average_cost)) +
    geom_col(fill = "blue") +
    labs(
      title = "Average Trip Cost by City",
      x = "City",
      y = "Average Cost (USD)"
    ) +
    theme(
      axis.text.x = element_text(angle = 45, hjust = 1)
    )

  return(p)
}
