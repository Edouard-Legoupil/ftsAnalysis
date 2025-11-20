# Donor→Recipient: Funding Concentration Index

Measures the share of a recipient’s total funding that comes from a
specific donor.

## Usage

``` r
indicator_donor_recipient_concentration(
  flows,
  donor_recipient_pairs = NULL,
  donors = NULL,
  recipient_name = NULL
)
```

## Arguments

- flows:

  A dataframe with `sourceObjects`, `destinationObjects`, and
  `amountUSD`.

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
`DonorRecipient_Concentration_Index`.

## Details

Goal: Quantifies how dependent the recipient is on that donor (share of
donor’s contribution among total received).

## Examples

``` r
donor_recipient <- indicator_donor_recipient_concentration(flows)
#table(donor_recipient$DonorRecipient_Stability_Index)

library(ggplot2)
ggplot(donor_recipient, aes(x = DonorRecipient_Concentration_Index)) +
  geom_histogram( fill = "green", color = "white") +
  unhcrthemes::theme_unhcr(grid = "Y", axis = "X", axis_title = FALSE) +
  labs(
    title = "Distribution of Donor Recipient Concentration Index",
    x = "",
    y = "Number of Donor-Recipient Pairs",
    caption = paste(
    "Indicator interpretation:",
    "Share of recipient's total funding coming from specific donor (0-1). 
    Higher values indicate recipient dependency on that donor.", "\n\n",
    
    "How to read the visualization:",
    "Histogram shows dependency levels across partnerships. Values near 1 
    indicate critical donor dependencies requiring diversification strategies.",
    "\n\n",
    
    "Humanitarian relevance:",
    "Identifies vulnerable partnerships where recipient organizations risk 
    severe disruption if key donors change funding priorities.", "\n\n",
    
    "Source: Financial Tracking Service (FTS) API."
  )
  )
#> `stat_bin()` using `bins = 30`. Pick better value `binwidth`.
#> Warning: Removed 1 row containing non-finite outside the scale range (`stat_bin()`).
```
