#' Average rating for each travel type
#'
#' This function groups trips by travel_type (for example solo, family,
#' friends) and finds the average rating for each group.
#'
#' @param data A data frame that has columns called rating and travel_type.
#'
#' @return A data frame with two columns: travel_type and average_rating.
#'
#' @examples
#' data(travel_data)
#' avg_rating_by_travel_type(travel_data)
#'
#' @export
avg_rating_by_travel_type <- function(data) {

  # Check that the input is a data frame
  if (!is.data.frame(data)) {
    stop("Please give me a data frame as input.")
  }

  # Check that needed columns are there
  if (!("rating" %in% names(data))) {
    stop("The data must have a column called rating.")
  }

  if (!("travel_type" %in% names(data))) {
    stop("The data must have a column called travel_type.")
  }

  # Make sure rating is numeric
  if (!is.numeric(data$rating)) {
    stop("The rating column must be numeric.")
  }

  # Get unique travel types (solo, family, etc.)
  types <- unique(data$travel_type)

  # Make an empty vector to store results
  avg_rating <- numeric(length(types))

  # Loop through each travel type and calculate the average rating
  for (i in 1:length(types)) {
    type_name <- types[i]
    these_rows <- data[data$travel_type == type_name, ]
    avg_rating[i] <- mean(these_rows$rating)
  }

  # Create a final data frame to return
  result <- data.frame(
    travel_type = types,
    average_rating = avg_rating
  )

  return(result)
}
