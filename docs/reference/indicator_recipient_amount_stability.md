# Amount Stability

Measures the stability of annual funding amounts for each recipient as 1
minus the coefficient of variation of annual totals.

## Usage

``` r
indicator_recipient_amount_stability(flows, recipients = NULL)
```

## Arguments

- flows:

  A dataframe containing `destinationObjects`, `budgetYear`, and
  `amountUSD`.

- recipients:

  Optional dataframe of recipient organizations to merge.

## Value

A tibble with columns `recipient` and `Amount_Stability`.

## Examples

``` r
recipients <- indicator_recipient_amount_stability(flows)
#table(recipients$Amount_Stability)

library(ggplot2)
ggplot(recipients, aes(x = Amount_Stability)) +
  geom_histogram( fill = "lightgreen", color = "white") +
  unhcrthemes::theme_unhcr(grid = "Y", axis = "X", axis_title = FALSE) +
  labs(
    title = "Distribution of Recipients Amount Stability",
    x = "",
    y = "Number of Recipients",
    caption = paste(
    "Indicator interpretation:",
    "Measures year-to-year funding stability as 1 minus coefficient of variation.
    1 = perfectly stable annual funding, lower values = volatile funding 
    patterns.", "\n\n",
    
    "How to read the visualization:",
    "Histogram shows stability scores. Higher values indicate predictable funding
    streams, negative values indicate high volatility (SD > mean).", "\n\n",
    
    "Humanitarian relevance:",
    "Stable funding enables long-term programming and institutional strengthening,
    while volatility disrupts operations and staff retention.", "\n\n",
    
    "Source: Financial Tracking Service (FTS) API."
  )
  )
#> `stat_bin()` using `bins = 30`. Pick better value `binwidth`.
#> Warning: Removed 455 rows containing non-finite outside the scale range (`stat_bin()`).
```
