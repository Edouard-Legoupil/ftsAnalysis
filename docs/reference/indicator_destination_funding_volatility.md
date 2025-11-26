# Destination-Focused: Funding Volatility Index

Calculates volatility in funding for each destination across
`budgetYear`, using the coefficient of variation (CV) of annual totals.

## Usage

``` r
indicator_destination_funding_volatility(flows, destinations_df = NULL)
```

## Arguments

- flows:

  A dataframe including `destinationObjects`, `budgetYear`, and
  `amountUSD`.

- destinations_df:

  (optional) A dataframe with destination names to merge results with.

## Value

A tibble with `destination` and `Destination_Funding_Volatility` (0–1,
where 1 = stable).

## Details

Goal: Quantifies year-to-year variability in funding amounts for each
destination.

## Examples

``` r
destination <-indicator_destination_funding_volatility(flows)
#table(destination$Destination_Funding_Volatility)

library(ggplot2)
ggplot(destination, aes(x = Destination_Funding_Volatility)) +
  geom_histogram( fill = "red", color = "white") +
  unhcrthemes::theme_unhcr(grid = "Y", axis = "X", axis_title = FALSE) +
  labs(
    title = "Distribution of Destination Funding Volatility",
    x = "",
    y = "Number of Destination",
    caption = paste(
    "Indicator interpretation:",
    "1 minus coefficient of variation of annual funding (0=highly volatile,
    1=perfectly stable). Inverse measure of year-to-year funding
    unpredictability.", "\n\n",
    
    "How to read the visualization:",
    "Histogram shows volatility patterns. Higher values enable predictable 
    programming, lower values indicate disruptive funding fluctuations.", "\n\n",
    
    "Humanitarian relevance:",
    "Funding volatility disrupts staffing, procurement, and program continuity, 
    reducing operational efficiency and response effectiveness.", "\n\n",
    
    "Source: Financial Tracking Service (FTS) API."
  )
  )
#> `stat_bin()` using `bins = 30`. Pick better value `binwidth`.
#> Warning: Removed 44 rows containing non-finite outside the scale range (`stat_bin()`).
```
