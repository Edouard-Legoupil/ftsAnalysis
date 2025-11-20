# Donor→Destination: Geographic Focus Trend

Evaluates whether a donor's destination concentration (HHI) is
increasing or decreasing over time. Goal: Captures whether a donor’s
portfolio is becoming more or less geographically diversified over time
(trend in HHI per year).

## Usage

``` r
indicator_donor_destination_trend(flows, donor_dest_df = NULL)
```

## Arguments

- flows:

  A dataframe with `sourceObjects`, `destinationObjects`, `budgetYear`,
  and `amountUSD`.

- donor_dest_df:

  (optional) A dataframe of donor–destination pairs to merge results
  with.

## Value

A tibble with `donor`, `DonorDestination_Focus_Trend` (slope).

## Examples

``` r
donor <- indicator_donor_destination_trend(flows)
#table(donor$DonorDestination_Focus_Trend)

library(ggplot2)
ggplot(donor, aes(x = DonorDestination_Focus_Trend)) +
  geom_histogram( fill = "steelblue", color = "white") +
  unhcrthemes::theme_unhcr(grid = "Y", axis = "X", axis_title = FALSE) +
  labs(
    title = "Distribution of Donor Destination Focus Trend",
    x = "",
    y = "Number of Donors",
    caption = paste(
    "Indicator interpretation:",
    "Linear trend of geographic concentration over time (negative = diversifying,
    positive = focusing, zero = stable portfolio strategy).", "\n\n",
    
    "How to read the visualization:",
    "Histogram shows trend direction. Left of zero indicates donors broadening 
    geographic scope, right indicates narrowing focus.", "\n\n",
    
    "Humanitarian relevance:",
    "Reveals evolving donor strategies - expansion into new crises vs 
    consolidation in core locations - for anticipating partnership 
    opportunities.", "\n\n",
    
    "Source: Financial Tracking Service (FTS) API."
  )
  )
#> `stat_bin()` using `bins = 30`. Pick better value `binwidth`.
#> Warning: Removed 187 rows containing non-finite outside the scale range (`stat_bin()`).
```
