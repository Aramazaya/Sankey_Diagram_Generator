#' Prepare Data for Sankey Diagram
#'
#' Prepare and validate data for creating a Sankey diagram.
#'
#' @param data A data frame with source, target, and value columns
#'
#' @return A list containing nodes and links formatted for networkD3
#' @export
#'
#' @examples
#' \dontrun{
#' data <- data.frame(
#'   source = c("A", "A", "B"),
#'   target = c("B", "C", "C"),
#'   value = c(10, 5, 8)
#' )
#' prepared_data <- prepare_sankey_data(data)
#' }
prepare_sankey_data <- function(data) {
  if (!all(c("source", "target", "value") %in% colnames(data))) {
    stop("Data must contain 'source', 'target', and 'value' columns")
  }
  
  # Create unique list of nodes
  nodes <- data.frame(
    name = unique(c(as.character(data$source), as.character(data$target))),
    stringsAsFactors = FALSE
  )
  
  # Create links with node indices (0-based for JavaScript)
  links <- data.frame(
    source = match(data$source, nodes$name) - 1,
    target = match(data$target, nodes$name) - 1,
    value = data$value,
    stringsAsFactors = FALSE
  )
  
  return(list(nodes = nodes, links = links))
}
