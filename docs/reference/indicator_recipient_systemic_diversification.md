# Recipient Systemic: Diversification Index

Calculates the entropy of funding sources per recipient, indicating how
diversified a recipient’s funding base is across donors.

## Usage

``` r
indicator_recipient_systemic_diversification(flows, recipients_df = NULL)
```

## Arguments

- flows:

  A dataframe including `sourceObjects`, `destinationObjects`, and
  `amountUSD`.

- recipients_df:

  (optional) A dataframe with recipient names to merge with the results.

## Value

A tibble with `recipient` and `Recipient_Diversification_Index` (0–1
scale).

## Details

Goal: Measures how many donors contribute to each recipient, using
entropy. High entropy = diversified funding base.

## Examples

``` r
recipients <- indicator_recipient_systemic_diversification(flows)
#table(recipients$Recipient_Diversification_Index)

library(ggplot2)
ggplot(recipients, aes(x = Recipient_Diversification_Index)) +
  geom_histogram( fill = "lightgreen", color = "white") +
  unhcrthemes::theme_unhcr(grid = "Y", axis = "X", axis_title = FALSE) +
  labs(
    title = "Distribution of Recipient Diversification Index",
    x = "",
    y = "Number of Recipients",
    caption = paste(
    "Indicator interpretation:",
    "Entropy-based measure of funding source diversification across donors. 
    0 = dependent on single donor,
    1 = perfectly diversified across many donors.", "\n\n",
    
    "How to read the visualization:",
    "Histogram shows diversification levels. Higher values indicate resilient 
    funding bases, lower values indicate donor concentration risks.", "\n\n",
    
    "Humanitarian relevance:",
    "Diversified funding reduces vulnerability to individual donor policy 
    changes and enhances organizational sustainability and independence.", "\n\n",
    
    "Source: Financial Tracking Service (FTS) API."
  )
  )
#> `stat_bin()` using `bins = 30`. Pick better value `binwidth`.
#> Warning: Removed 469 rows containing non-finite outside the scale range (`stat_bin()`).
```
