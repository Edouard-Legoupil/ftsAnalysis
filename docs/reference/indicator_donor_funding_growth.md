# Funding Growth Trend

Calculates the linear trend (slope) of annual funding amounts over years
for each donor.

## Usage

``` r
indicator_donor_funding_growth(flows, donors = NULL)
```

## Arguments

- flows:

  A dataframe with `sourceObjects`, `budgetYear`, and `amountUSD`.

- donors:

  Optional dataframe with donor names.

## Value

A tibble with `donor` and `Funding_Growth_Trend` (slope of funding over
years).

## Examples

``` r
donors <- indicator_donor_funding_growth(flows)
#table(donors$Funding_Growth_Trend)
library(ggplot2)
ggplot(donors, aes(x = Funding_Growth_Trend)) +
  geom_histogram( fill = "steelblue", color = "white") +
  unhcrthemes::theme_unhcr(grid = "Y", axis = "X", axis_title = FALSE) +
  labs(
    title = "Distribution of Donor Funding Growth Trend",
    x = "",
    y = "Number of Donors",
    caption = paste(
    "Indicator interpretation:",
    "Linear regression slope of annual funding amounts over time. Positive 
    values = increasing funding, negative = decreasing funding.", "\n\n",
    
    "How to read the visualization:",
    "X-axis shows growth rate (USD per year), Y-axis shows donor count. Center 
    around zero indicates stable funding, right tail indicates growing donors.",
    "\n\n",
    
    "Humanitarian relevance:",
    "Identifies expanding vs contracting funding sources, helping target 
    advocacy and partnership efforts with growing donors.", "\n\n",
    
    "Source: Financial Tracking Service (FTS) API."
  )
  )
#> `stat_bin()` using `bins = 30`. Pick better value `binwidth`.
#> Warning: Removed 193 rows containing non-finite outside the scale range (`stat_bin()`).
```
