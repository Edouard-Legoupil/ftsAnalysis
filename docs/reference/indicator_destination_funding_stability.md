# Destination-Focused: Funding Stability Index

Measures how stable funding amounts are for each destination over time.
Computed as 1 - coefficient of variation of annual funding. Goal:
Captures predictability of funding amounts over years (inverse of
coefficient of variation).

## Usage

``` r
indicator_destination_funding_stability(flows, destinations_df = NULL)
```

## Arguments

- flows:

  A dataframe with `destinationObjects`, `budgetYear`, and `amountUSD`.

- destinations_df:

  (optional) A dataframe of destinations to merge results with.

## Value

A tibble with `destination` and `Destination_Funding_Stability_Index`.

## Examples

``` r
destination <- indicator_destination_funding_stability(flows)
#table(destination$Destination_Funding_Stability_Index)

library(ggplot2)
ggplot(destination, aes(x = Destination_Funding_Stability_Index)) +
  geom_histogram( fill = "red", color = "white") +
  unhcrthemes::theme_unhcr(grid = "Y", axis = "X", axis_title = FALSE) +
  labs(
    title = "Distribution of Destination Funding Stability Index",
    x = "",
    y = "Number of Destination",
    caption = paste(
    "Indicator interpretation:",
    "1 minus coefficient of variation of annual funding amounts. 
    1=perfectly stable, lower values=volatile funding, 
    negative values=high volatility (SD > mean).", "\n\n",
    
    "How to read the visualization:",
    "Histogram shows stability patterns. Higher values enable predictable 
    programming, negative values indicate boom-bust cycles disrupting operations.",
    "\n\n",
    
    "Humanitarian relevance:",
    "Funding stability enables long-term planning, staff retention, and 
    consistent service delivery rather than reactive emergency-only responses.",
    "\n\n",
    
    "Source: Financial Tracking Service (FTS) API."
  )
  )
#> `stat_bin()` using `bins = 30`. Pick better value `binwidth`.
#> Warning: Removed 45 rows containing non-finite outside the scale range (`stat_bin()`).
```
