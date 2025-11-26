# Donor→Recipient: Relationship Stability Index

Calculates how consistently a donor funds a recipient over the time
series, as the proportion of years with nonzero funding between the
pair.

## Usage

``` r
indicator_donor_recipient_stability(
  flows,
  donor_recipient_pairs = NULL,
  donors = NULL,
  recipient_name = NULL
)
```

## Arguments

- flows:

  A dataframe with `sourceObjects`, `destinationObjects`, `budgetYear`,
  and `amountUSD`.

- donor_recipient_pairs:

  (optional) A dataframe of donor–recipient pairs to merge results with.

- donors:

  (optional used if recipient_name is provided ) A dataframe with donor
  names to merge with the results.

- recipient_name:

  (optional) the name of a specific recipient to filter the results of
  the function

## Value

A tibble with `donor`, `recipient`, and
`DonorRecipient_Stability_Index`.

## Details

Goal: Measures how consistently a donor funds a recipient over time
(share of active years).

## Examples

``` r
donor_recipient <- indicator_donor_recipient_stability(flows)
#table(donor_recipient$DonorRecipient_Stability_Index)

library(ggplot2)
ggplot(donor_recipient, aes(x = DonorRecipient_Stability_Index)) +
  geom_histogram( fill = "green", color = "white") +
  unhcrthemes::theme_unhcr(grid = "Y", axis = "X", axis_title = FALSE) +
  labs(
    title = "Distribution of Donor Recipient Stability Index",
    x = "",
    y = "Number of Donor-Recipient Pairs",
    caption = paste(
    "Indicator interpretation:",
    "Proportion of years with active funding between donor-recipient pairs 
    (0=sporadic funding, 1=consistent annual funding throughout relationship).",
    "\n\n",
    
    "How to read the visualization:",
    "Histogram shows funding consistency patterns. Higher values indicate 
    reliable annual partnerships, lower values indicate intermittent engagement.",
    "\n\n",
    
    "Humanitarian relevance:",
    "Consistent funding enables long-term programming, staff retention, and 
    institutional strengthening rather than project-based short-term engagements.", 
    "\n\n",
    
    "Source: Financial Tracking Service (FTS) API."
  )
  )
#> `stat_bin()` using `bins = 30`. Pick better value `binwidth`.
```
