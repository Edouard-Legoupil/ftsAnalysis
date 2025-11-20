# Donor Timing Consistency Index

This indicator measures how consistently a donor provides funding across
the months of the year, based on the transaction-level `date` field of
FTS flows. It evaluates the dispersion of monthly funding shares and
scales the result to a 0–1 index where higher values represent more
regular and predictable timing of contributions.

## Usage

``` r
indicator_donor_timing_consistency(flows, donors = NULL)
```

## Arguments

- flows:

  A dataframe containing `sourceObjects`, `budgetMonth` (1–12), and
  `amountUSD`.

- donors:

  Optional dataframe with donor names.

## Value

A tibble with `donor` and `Timing_Consistency` (1 = very consistent, 0 =
erratic).

## Examples

``` r
donors <- indicator_donor_timing_consistency(flows)
#table(donors$Timing_Consistency)
library(ggplot2)
ggplot(donors, aes(x = Timing_Consistency)) +
  geom_histogram(binwidth = 0.05, fill = "steelblue", color = "white") +
  unhcrthemes::theme_unhcr(grid = "Y", axis = "X", axis_title = FALSE) +
  labs(
    title = "Distribution of Donor Timing Consistency",
    x = "",
    y = "Number of Donors",
    caption = paste(
    "Indicator interpretation:",
    "Measures regularity of funding distribution across month
    (1 = evenly spread, 0 = highly seasonal/erratic). Based on monthly 
    funding share dispersion.", "\n\n",
    
    "How to read the visualization:",
    "Histogram shows consistency scores. Higher values indicate predictable
    monthly funding patterns, lower values indicate lumpy or seasonal
    disbursements.", "\n\n",
    
    "Humanitarian relevance:",
    "Predictable timing enables better cash flow management and program
    continuity, reducing operational disruptions in emergency responses.",
    "\n\n",
    
    "Source: Financial Tracking Service (FTS) API."
  )
  )
#> Warning: Removed 119 rows containing non-finite outside the scale range (`stat_bin()`).
```
