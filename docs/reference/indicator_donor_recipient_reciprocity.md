# Donor→Recipient: Reciprocity Ratio

Identifies donor–recipient pairs where both have exchanged funding (each
organization acts as donor and recipient at least once).

## Usage

``` r
indicator_donor_recipient_reciprocity(
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
`DonorRecipient_Reciprocity_Ratio` (0 or 1).

## Details

Goal: Checks whether a donor and recipient have mutual funding roles
(both send and receive) — useful for consortia or pooled mechanisms.

## Examples

``` r
donor_recipient <- indicator_donor_recipient_reciprocity(flows)
#table(donor_recipient$DonorRecipient_Reciprocity_Ratio)

library(ggplot2)
ggplot(donor_recipient, aes(x = DonorRecipient_Reciprocity_Ratio)) +
  geom_histogram( fill = "green", color = "white") +
  unhcrthemes::theme_unhcr(grid = "Y", axis = "X", axis_title = FALSE) +
  labs(
    title = "Distribution of Donor Recipient Reciprocity Ratio",
    x = "",
    y = "Number of Donor-Recipient Pairs",
    caption = paste(
    "Indicator interpretation:",
    "Binary indicator of mutual funding relationships where both organizations 
    act as donor and recipient to each other (0=one-way, 1=reciprocal).", "\n\n",
    
    "How to read the visualization:",
    "Two bars showing proportion of one-way vs reciprocal partnerships. 
    Higher reciprocal values indicate collaborative funding ecosystems.",
    "\n\n",
    
    "Humanitarian relevance:",
    "Reciprocal funding indicates consortia, pooled funds, or collaborative 
    programming arrangements that enhance coordination and local ownership.",
    "\n\n",
    
    "Source: Financial Tracking Service (FTS) API."
  )
  )
#> `stat_bin()` using `bins = 30`. Pick better value `binwidth`.
```
