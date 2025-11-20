# Funding Consistency Index

Calculates the proportion of years in which a donor provided funding
relative to the total number of years analyzed.

## Usage

``` r
indicator_donor_funding_consistency(flows, donors = NULL)
```

## Arguments

- flows:

  A dataframe containing FTS-style flow data with `sourceObjects`,
  `budgetYear`, and `amountUSD`.

- donors:

  Optional dataframe with donor names to merge results.

## Value

A tibble with columns `donor` and `Funding_Consistency_Index`.

## Examples

``` r
donors <- indicator_donor_funding_consistency(flows)
table(donors$Funding_Consistency_Index)
#> 
#>   1 
#> 249 
# library(ggplot2)
# ggplot(donors, aes(x = Funding_Consistency_Index)) +
#   geom_histogram(fill = "steelblue", color = "white") +
#   unhcrthemes::theme_unhcr(grid = "Y", axis = "X", axis_title = FALSE) +
#   labs(
#     title = "Distribution of Donor Funding Consistency Index",
#     x = "",
#     y = "Number of Donors",
#     caption = paste(
#     "Indicator interpretation:",
#     "Measures the proportion of years a donor provided funding relative to total 
#     years analyzed. Scores range 0-1 where 1 = consistent annual funding.",
#     "\n\n",
#     
#     "How to read the visualization:",
#     "X-axis shows consistency index values (0-1), Y-axis shows count of donors.
#     Bars represent frequency of donors at each consistency level.", "\n\n",
#     
#     "Humanitarian relevance:",
#     "Identifies reliable long-term partners vs sporadic funders, helping 
#     prioritize relationship building with consistent donors.", "\n\n",
#     
#     "Source: Financial Tracking Service (FTS) API."
#   )
#   )
```
