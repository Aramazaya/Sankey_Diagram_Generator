#' Create Sankey Diagram
#'
#' Create an interactive Sankey diagram from prepared data.
#'
#' @param data A data frame with source, target, and value columns,
#'   or a list with nodes and links from prepare_sankey_data()
#' @param title Title for the diagram (optional)
#' @param font_size Font size for node labels (default: 12)
#' @param node_width Width of nodes in pixels (default: 15)
#'
#' @return An htmlwidget object containing the Sankey diagram
#' @export
#'
#' @examples
#' \dontrun{
#' data <- data.frame(
#'   source = c("A", "A", "B"),
#'   target = c("B", "C", "C"),
#'   value = c(10, 5, 8)
#' )
#' diagram <- create_sankey(data, title = "My Flow Diagram")
#' }
create_sankey <- function(data, 
                         title = NULL, 
                         font_size = 12, 
                         node_width = 15) {
  
  # Check if networkD3 is available
  if (!requireNamespace("networkD3", quietly = TRUE)) {
    stop("Package 'networkD3' is required but not installed.")
  }
  
  # If data is a data frame, prepare it first
  if (is.data.frame(data)) {
    prepared_data <- prepare_sankey_data(data)
  } else if (is.list(data) && all(c("nodes", "links") %in% names(data))) {
    prepared_data <- data
  } else {
    stop("Invalid data format. Provide a data frame or prepared data list.")
  }
  
  # Create the Sankey diagram
  sankey <- networkD3::sankeyNetwork(
    Links = prepared_data$links,
    Nodes = prepared_data$nodes,
    Source = "source",
    Target = "target",
    Value = "value",
    NodeID = "name",
    fontSize = font_size,
    nodeWidth = node_width,
    sinksRight = FALSE
  )
  
  return(sankey)
}
