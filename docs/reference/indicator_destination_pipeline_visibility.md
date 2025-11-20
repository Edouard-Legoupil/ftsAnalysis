# Pipeline Visibility

Measures the proportion of funding flows per destination that extend
beyond the current year.

## Usage

``` r
indicator_destination_pipeline_visibility(
  flows,
  current_year = as.numeric(format(Sys.Date(), "%Y")),
  destinations = NULL
)
```

## Arguments

- flows:

  A dataframe with `destinationObjects`, `budgetYear`, and `amountUSD`.

- current_year:

  Numeric, the current calendar year.

- destinations:

  Optional dataframe to merge.

## Value

A tibble with `destination` and `Pipeline_Visibility`.

## Examples

``` r
destination <- indicator_destination_pipeline_visibility(flows)
#table(destination$Recipient_Diversification_Index)

library(ggplot2)
ggplot(destination, aes(x = Pipeline_Visibility)) +
  geom_histogram( fill = "red", color = "white") +
  unhcrthemes::theme_unhcr(grid = "Y", axis = "X", axis_title = FALSE) +
  labs(
    title = "Distribution of Destination Pipeline Visibility",
    x = "",
    y = "Number of Destination",
    caption = paste(
    "Indicator interpretation:",
    "Proportion of funding flows extending beyond current year. Higher values
    indicate better forward visibility and multi-year planning capacity.",
    "\n\n",
    
    "How to read the visualization:",
    "Histogram shows pipeline visibility across destinations. Most destinations
    cluster near zero, indicating predominantly annual funding cycles.", "\n\n",
    
    "Humanitarian relevance:",
    "Multi-year funding enables strategic programming, staff retention, and
    sustainable crisis response rather than short-term emergency patches.",
    "\n\n",
    
    "Source: Financial Tracking Service (FTS) API."
  )
  )
#> `stat_bin()` using `bins = 30`. Pick better value `binwidth`.
```
