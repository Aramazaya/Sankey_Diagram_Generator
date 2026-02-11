#' Load Data from CSV File
#'
#' Load data from a CSV file for creating Sankey diagrams.
#'
#' @param file_path Path to the CSV file
#' @param source_col Name of the source column (default: "source")
#' @param target_col Name of the target column (default: "target")
#' @param value_col Name of the value column (default: "value")
#'
#' @return A data frame with source, target, and value columns
#' @export
#'
#' @examples
#' \dontrun{
#' data <- load_data_from_csv("data/flow_data.csv")
#' }
load_data_from_csv <- function(file_path, 
                               source_col = "source", 
                               target_col = "target", 
                               value_col = "value") {
  if (!file.exists(file_path)) {
    stop("File not found: ", file_path)
  }
  
  data <- read.csv(file_path, stringsAsFactors = FALSE)
  
  # Check if required columns exist
  if (!all(c(source_col, target_col, value_col) %in% colnames(data))) {
    stop("Required columns not found in CSV file")
  }
  
  # Rename columns to standard names
  colnames(data)[colnames(data) == source_col] <- "source"
  colnames(data)[colnames(data) == target_col] <- "target"
  colnames(data)[colnames(data) == value_col] <- "value"
  
  return(data[, c("source", "target", "value")])
}
