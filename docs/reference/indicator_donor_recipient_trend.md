# Donor→Recipient: Funding Trend Index

Computes the slope of the funding trend over time for each
donor–recipient pair.

## Usage

``` r
indicator_donor_recipient_trend(
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

A tibble with `donor`, `recipient`, and `DonorRecipient_Trend_Index`
(slope).

## Details

Goal: Detects whether funding between a donor and recipient is
increasing or decreasing over time (slope of linear regression).

## Examples

``` r
donor_recipient <- indicator_donor_recipient_trend(flows)
#table(donor_recipient$DonorRecipient_Trend_Index)

library(ggplot2)
ggplot(donor_recipient, aes(x = DonorRecipient_Trend_Index)) +
  geom_histogram( fill = "green", color = "white") +
  unhcrthemes::theme_unhcr(grid = "Y", axis = "X", axis_title = FALSE) +
  labs(
    title = "Distribution of Donor Recipient Trend Index",
    x = "",
    y = "Number of Donor-Recipient Pairs",
    caption = paste(
    "Indicator interpretation:",
    "Linear trend of funding amounts between donor-recipient pairs over time. 
    Positive=increasing investment, negative=phasing out partnership.", "\n\n",
    
    "How to read the visualization:",
    "Histogram shows partnership evolution patterns. Right of zero indicates 
    growing collaborations, left indicates declining engagements.", "\n\n",
    
    "Humanitarian relevance:",
    "Reveals evolving partnership strategies - scaling successful collaborations
    vs exiting less effective ones - informing relationship management.", "\n\n",
    
    "Source: Financial Tracking Service (FTS) API."
  )
  )
#> `stat_bin()` using `bins = 30`. Pick better value `binwidth`.
#> Warning: Removed 1782 rows containing non-finite outside the scale range (`stat_bin()`).
```
