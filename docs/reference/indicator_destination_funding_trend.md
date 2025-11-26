# Destination-Focused: Funding Growth Trend

Computes the slope of the linear regression of funding over time for
each destination. Goal: Detects whether funding to a destination is
increasing or decreasing over time.

## Usage

``` r
indicator_destination_funding_trend(flows, destinations_df = NULL)
```

## Arguments

- flows:

  A dataframe with `destinationObjects`, `budgetYear`, and `amountUSD`.

- destinations_df:

  (optional) A dataframe of destinations to merge results with.

## Value

A tibble with `destination` and `Destination_Funding_Growth_Trend`.

## Examples

``` r
destination <- indicator_destination_funding_trend(flows)
#table(destination$Destination_Funding_Growth_Trend)

library(ggplot2)
ggplot(destination, aes(x = Destination_Funding_Growth_Trend)) +
  geom_histogram( fill = "red", color = "white") +
  unhcrthemes::theme_unhcr(grid = "Y", axis = "X", axis_title = FALSE) +
  labs(
    title = "Distribution of Destination Funding Growth Trend",
    x = "",
    y = "Number of Destination",
    caption = paste(
    "Indicator interpretation:",
    "Linear regression slope of annual funding over time. 
    Positive values=increasing funding, negative values=decreasing funding,
    zero=stable funding.", "\n\n",
    
    "How to read the visualization:",
    "Histogram shows growth/decline patterns. Right of zero indicates expanding
    crisis responses, left indicates potential donor fatigue or improving 
    contexts.", "\n\n",
    
    "Humanitarian relevance:",
    "Identifies crises receiving increasing attention vs. those facing funding
    declines despite ongoing needs, informing advocacy priorities.", "\n\n",
    
    "Source: Financial Tracking Service (FTS) API."
  )
  )
#> `stat_bin()` using `bins = 30`. Pick better value `binwidth`.
#> Warning: Removed 45 rows containing non-finite outside the scale range (`stat_bin()`).
```
