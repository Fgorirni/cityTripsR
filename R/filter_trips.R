#' Filter trips by cost and rating
#'
#' This function lets you keep only trips that meet a minimum cost
#' and/or a minimum rating. If no filters are given, it returns all trips.
#'
#' @param data A data frame with at least total_cost and rating columns.
#' @param min_cost A number. Only trips with total_cost greater than or
#'   equal to this value are kept. Default is NULL (no cost filter).
#' @param min_rating A number. Only trips with rating greater than or
#'   equal to this value are kept. Default is NULL (no rating filter).
#'
#' @return A filtered data frame with only the trips that match the filters.
#'
#' @examples
#' data(travel_data)
#' filter_trips(travel_data, min_cost = 2000)
#' filter_trips(travel_data, min_rating = 5)
#'
#' @export
filter_trips <- function(data, min_cost = NULL, min_rating = NULL) {

  # Check input is a data frame
  if (!is.data.frame(data)) {
    stop("Please give me a data frame as input.")
  }

  # Start with the full data
  filtered_data <- data

  # If min_cost was given, filter by cost
  if (!is.null(min_cost)) {

    # Check that min_cost is a number
    if (!is.numeric(min_cost)) {
      stop("min_cost must be a number.")
    }

    filtered_data <- filtered_data[filtered_data$total_cost >= min_cost, ]
  }

  # If min_rating was given, filter by rating
  if (!is.null(min_rating)) {

    # Check that min_rating is a number
    if (!is.numeric(min_rating)) {
      stop("min_rating must be a number.")
    }

    filtered_data <- filtered_data[filtered_data$rating >= min_rating, ]
  }

  # If no filters were applied, show a message
  if (is.null(min_cost) && is.null(min_rating)) {
    message("No filters were applied. Returning all trips.")
  }

  # Return the final result
  return(filtered_data)
}
