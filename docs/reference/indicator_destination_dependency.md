# Destination-Focused: Dependency Index

Calculates the share of a destination's total funding that comes from
its single largest donor.

## Usage

``` r
indicator_destination_dependency(flows, destinations_df = NULL)
```

## Arguments

- flows:

  A dataframe including `sourceObjects`, `destinationObjects`, and
  `amountUSD`.

- destinations_df:

  (optional) A dataframe with destination names to merge results with.

## Value

A tibble with `destination` and `Destination_Dependency_Index` (0–1,
higher = more dependent).

## Details

Goal: Measures reliance on the top donor — i.e., the share of total
funding coming from the largest donor.

## Examples

``` r
destination <-indicator_destination_dependency(flows)
#table(destination$Destination_Dependency_Index)

library(ggplot2)
ggplot(destination, aes(x = Destination_Dependency_Index)) +
  geom_histogram( fill = "red", color = "white") +
  unhcrthemes::theme_unhcr(grid = "Y", axis = "X", axis_title = FALSE) +
  labs(
    title = "Distribution of Destination Dependency Index",
    x = "",
    y = "Number of Destination",
    caption = paste(
    "Indicator interpretation:",
    "Share of total funding from largest single donor (0-1). Higher values 
    indicate heavy reliance on one donor, creating vulnerability.", "\n\n",
    
    "How to read the visualization:",
    "Histogram shows dependency levels. Values near 1 indicate high-risk 
    single-donor dependencies requiring diversification strategies.", "\n\n",
    
    "Humanitarian relevance:",
    "Single-donor dependency creates systemic risk - if that donor changes 
    priorities, entire crisis responses can be jeopardized.", "\n\n",
    
    "Source: Financial Tracking Service (FTS) API."
  )
  )
#> `stat_bin()` using `bins = 30`. Pick better value `binwidth`.
```
