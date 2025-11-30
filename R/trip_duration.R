#' Calculate trip length in days
#'
#' This function uses the start_date and end_date columns
#' to find how many days each trip lasted.
#'
#' @param data A data frame that has columns called start_date and end_date.
#'
#' @return A numeric vector with the length of each trip in days.
#'
#' @examples
#' data(travel_data)
#' trip_duration(travel_data)
#'
#' @export
trip_duration <- function(data) {

  # Check that the input is a data frame
  if (!is.data.frame(data)) {
    stop("Please give me a data frame as input.")
  }

  # Check that the needed columns are there
  if (!("start_date" %in% names(data))) {
    stop("The data must have a column called start_date.")
  }

  if (!("end_date" %in% names(data))) {
    stop("The data must have a column called end_date.")
  }

  # Change start_date and end_date to Date format
  start_dates <- as.Date(data$start_date)
  end_dates <- as.Date(data$end_date)

  # Check for missing or bad dates
  if (any(is.na(start_dates)) || any(is.na(end_dates))) {
    stop("Some dates are missing or not valid.")
  }

  # Make sure end_date is not before start_date
  if (any(end_dates < start_dates)) {
    stop("End date cannot be before the start date.")
  }

  # Calculate the number of days
  trip_length <- end_dates - start_dates

  # Change to numeric so it looks clean
  trip_length <- as.numeric(trip_length)

  # Return the final result
  return(trip_length)
}
