# Example script for creating a Sankey diagram from data
# This script demonstrates the basic workflow

library(SankeyDiagramGenerator)

# Example 1: Create diagram from data frame
cat("Example 1: Creating diagram from data frame\n")
data <- data.frame(
  source = c("Product A", "Product A", "Product B", "Product B", "Product C"),
  target = c("Region 1", "Region 2", "Region 1", "Region 3", "Region 2"),
  value = c(100, 150, 80, 120, 90)
)

diagram1 <- create_sankey(data, title = "Product Distribution by Region")
print(diagram1)

# Example 2: Load data from CSV
cat("\nExample 2: Loading data from CSV file\n")
sample_file <- system.file("extdata", "sample_energy_flow.csv", 
                           package = "SankeyDiagramGenerator")

if (file.exists(sample_file)) {
  energy_data <- load_data_from_csv(sample_file)
  diagram2 <- create_sankey(energy_data, title = "Energy Flow Analysis")
  print(diagram2)
} else {
  cat("Sample file not found. Make sure the package is installed.\n")
}

# Example 3: Prepare data manually and customize
cat("\nExample 3: Manual data preparation with customization\n")
workflow_file <- system.file("extdata", "sample_workflow.csv", 
                             package = "SankeyDiagramGenerator")

if (file.exists(workflow_file)) {
  workflow_data <- load_data_from_csv(workflow_file)
  prepared <- prepare_sankey_data(workflow_data)
  
  diagram3 <- create_sankey(
    prepared, 
    title = "Project Workflow",
    font_size = 14,
    node_width = 20
  )
  print(diagram3)
} else {
  cat("Sample file not found. Make sure the package is installed.\n")
}

cat("\nExamples completed!\n")
