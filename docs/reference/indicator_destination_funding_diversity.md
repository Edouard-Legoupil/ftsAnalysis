# Destination-Focused: Funding Diversity Index

Measures how diversified each destination's funding base is across
donors using Shannon entropy of `amountUSD` distribution.

## Usage

``` r
indicator_destination_funding_diversity(flows, destinations_df = NULL)
```

## Arguments

- flows:

  A dataframe including `sourceObjects`, `destinationObjects`, and
  `amountUSD`.

- destinations_df:

  (optional) A dataframe with destination names to merge results with.

## Value

A tibble with `destination` and `Destination_Funding_Diversity ` (0–1
scale).

## Details

Goal: Measures how many donors contribute to each destination — higher =
more diverse and resilient funding base.

## Examples

``` r
destination <- indicator_destination_funding_diversity(flows)
#table(destination$Destination_Funding_Diversity)

library(ggplot2)
ggplot(destination, aes(x = Destination_Funding_Diversity)) +
  geom_histogram( fill = "red", color = "white") +
  unhcrthemes::theme_unhcr(grid = "Y", axis = "X", axis_title = FALSE) +
  labs(
    title = "Distribution of Destination Funding Diversity",
    x = "",
    y = "Number of Destination",
    caption = paste(
    "Indicator interpretation:",
    "Shannon entropy-based measure of funding distribution across donors 
    (0=single donor dominance, 1=perfect diversity across many donors).", "\n\n",
    
    "How to read the visualization:",
    "Histogram shows diversity levels. Higher values indicate resilient funding
    ecosystems, lower values indicate concentration risks and vulnerability.",
    "\n\n",
    
    "Humanitarian relevance:",
    "Diverse funding bases protect against individual donor withdrawals and
    enable more balanced response coordination across multiple priorities.", 
    "\n\n",
    
    "Source: Financial Tracking Service (FTS) API."
  )
  )
#> `stat_bin()` using `bins = 30`. Pick better value `binwidth`.
#> Warning: Removed 31 rows containing non-finite outside the scale range (`stat_bin()`).
```
