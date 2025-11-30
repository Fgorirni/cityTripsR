#' Create a simple trip summary object
#'
#' This function makes a special object that stores
#' basic summaries of the travel data. It uses the
#' functions from this package.
#'
#' @param data A data frame like travel_data.
#'
#' @return An object of class "trip_summary".
#'
#' @examples
#' data(travel_data)
#' ts <- trip_summary(travel_data)
#' ts
#'
#' @export
trip_summary <- function(data) {

  # Check that data is a data frame
  if (!is.data.frame(data)) {
    stop("Please give me a data frame as input.")
  }

  # Use existing functions to build the summary parts
  durations <- trip_duration(data)
  cost_by_city <- avg_cost_by_city(data)
  rating_by_type <- avg_rating_by_travel_type(data)

  # Put everything into a list
  result <- list(
    data = data,
    durations = durations,
    cost_by_city = cost_by_city,
    rating_by_type = rating_by_type
  )

  # Give the list a special class name
  class(result) <- "trip_summary"

  return(result)
}

#' Print method for trip_summary objects
#'
#' This function controls how trip_summary objects
#' are printed to the screen.
#'
#' @param x A trip_summary object.
#' @param ... Extra arguments (not used).
#'
#' @return The same object, invisibly.
#'
#' @examples
#' data(travel_data)
#' ts <- trip_summary(travel_data)
#' print(ts)
#'
#' @export
print.trip_summary <- function(x, ...) {

  # Basic header
  cat("Trip summary (cityTripsR)\n")
  cat("-------------------------\n\n")

  # Number of trips
  n_trips <- nrow(x$data)
  cat("Number of trips:", n_trips, "\n")

  # Average duration
  avg_days <- mean(x$durations)
  cat("Average trip length (days):", avg_days, "\n\n")

  # Average cost by city
  cat("Average cost by city:\n")
  print(x$cost_by_city)
  cat("\n")

  # Average rating by travel type
  cat("Average rating by travel type:\n")
  print(x$rating_by_type)

}
