# Donor-Recipient Funding Growth Trend

Estimates the linear growth (slope) of annual funding amounts from each
donor to recipient.

## Usage

``` r
indicator_donor_recipient_funding_growth(
  flows,
  donor_recipient_pairs = NULL,
  donors = NULL,
  recipient_name = NULL
)
```

## Arguments

- flows:

  A dataframe containing `sourceObjects`, `destinationObjects`,
  `budgetYear`, `amountUSD`.

- donor_recipient_pairs:

  (optional) A dataframe of donor–recipient pairs to merge results with.

- donors:

  (optional used if recipient_name is provided ) A dataframe with donor
  names to merge with the results.

- recipient_name:

  (optional) the name of a specific recipient to filter the results of
  the function

## Value

A tibble with `donor`, `recipient`, and `Funding_Growth_Trend`.

## Examples

``` r
donor_recipient <- indicator_donor_recipient_funding_growth(flows)
#table(donor_recipient$Funding_Growth_Trend)

library(ggplot2)
ggplot(donor_recipient, aes(x = Funding_Growth_Trend)) +
  geom_histogram( fill = "green", color = "white") +
  unhcrthemes::theme_unhcr(grid = "Y", axis = "X", axis_title = FALSE) +
  labs(
    title = "Distribution of Donor Recipient Funding Growth Trend",
    x = "",
    y = "Number of Donor-Recipient Pairs",
    caption = paste(
    "Indicator interpretation:",
    "Linear regression slope of annual funding amounts between donor-recipient 
    pairs. Positive values=increasing funding, negative=decreasing funding.", "\n\n",
    
    "How to read the visualization:",
    "Histogram shows growth patterns across partnerships. Center around zero 
    indicates stable funding, right tail indicates expanding partnerships.", "\n\n",
    
    "Humanitarian relevance:",
    "Identifies growing vs contracting funding relationships, helping prioritize
    partnership development and identify successful collaboration models.", 
    "\n\n",
    
    "Source: Financial Tracking Service (FTS) API."
  )
  )
#> `stat_bin()` using `bins = 30`. Pick better value `binwidth`.
#> Warning: Removed 1480 rows containing non-finite outside the scale range (`stat_bin()`).
```
