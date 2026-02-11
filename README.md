# Sankey Diagram Generator

An R package for generating interactive Sankey diagrams from data.

## Overview

The `SankeyDiagramGenerator` package provides a simple and intuitive way to create Sankey diagrams from various data sources. Sankey diagrams are powerful visualization tools for showing flows and relationships between different entities.

## Folder Structure

This R project follows the standard R package structure:

```
SankeyDiagramGenerator/
├── R/                          # R source code
│   ├── load_data.R            # Functions for loading data
│   ├── prepare_data.R         # Data preparation utilities
│   └── create_sankey.R        # Main diagram creation functions
├── man/                        # Documentation files (auto-generated)
├── tests/                      # Unit tests
│   ├── testthat.R            # Test runner
│   └── testthat/             # Test files
│       └── test-sankey.R     # Sankey diagram tests
├── inst/                       # Additional package files
│   └── extdata/              # Sample data files
│       ├── sample_energy_flow.csv
│       └── sample_workflow.csv
├── vignettes/                  # Long-form documentation
│   └── getting-started.Rmd   # Getting started guide
├── data/                       # R data objects (optional)
├── DESCRIPTION                 # Package metadata
├── NAMESPACE                   # Package exports
├── .Rproj                     # RStudio project file
├── .gitignore                 # Git ignore rules
└── README.md                  # This file
```

## Installation

You can install the package from source:

```r
# Install from local source
install.packages("path/to/SankeyDiagramGenerator", repos = NULL, type = "source")

# Or using devtools
devtools::install_local("path/to/SankeyDiagramGenerator")
```

## Quick Start

```r
library(SankeyDiagramGenerator)

# Create sample data
data <- data.frame(
  source = c("A", "A", "B", "B", "C"),
  target = c("B", "C", "D", "E", "E"),
  value = c(10, 5, 8, 3, 7)
)

# Create Sankey diagram
diagram <- create_sankey(data, title = "My Flow Diagram")
diagram
```

## Loading Data from CSV

```r
# Load data from CSV file
csv_data <- load_data_from_csv("path/to/your/data.csv")

# Create diagram
diagram <- create_sankey(csv_data)
```

## Using Sample Data

```r
# Get path to sample data
sample_file <- system.file("extdata", "sample_energy_flow.csv", 
                          package = "SankeyDiagramGenerator")

# Load and visualize
energy_data <- load_data_from_csv(sample_file)
energy_diagram <- create_sankey(energy_data, title = "Energy Flow")
energy_diagram
```

## Data Format

Your CSV file should have three columns:

- `source`: The starting node of the flow
- `target`: The ending node of the flow  
- `value`: The magnitude of the flow (numeric)

Example:
```csv
source,target,value
A,B,10
A,C,5
B,D,8
```

## Dependencies

This package depends on:
- `networkD3` - For creating interactive D3.js visualizations
- `dplyr` - For data manipulation
- `tidyr` - For data tidying

## Development

To contribute to this package:

1. Clone the repository
2. Make your changes
3. Run tests: `devtools::test()`
4. Check package: `devtools::check()`
5. Submit a pull request

## Documentation

For detailed documentation, see the package vignettes:

```r
# View getting started guide
vignette("getting-started", package = "SankeyDiagramGenerator")
```

## License

MIT License