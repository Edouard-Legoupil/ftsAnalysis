# Donor-Recipient Relationship Duration Index

Calculates the normalized duration of active funding between a donor and
recipient.

## Usage

``` r
indicator_donor_recipient_relationship_duration(
  flows,
  donor_recipient_pairs = NULL,
  donors = NULL,
  recipient_name = NULL
)
```

## Arguments

- flows:

  A dataframe containing `sourceObjects`, `destinationObjects`, and
  `budgetYear`.

- donor_recipient_pairs:

  (optional) A dataframe of donor–recipient pairs to merge results with.

- donors:

  (optional used if recipient_name is provided ) A dataframe with donor
  names to merge with the results.

- recipient_name:

  (optional) the name of a specific recipient to filter the results of
  the function

## Value

A tibble with columns `donor`, `recipient`, and
`Relationship_Duration_Index`.

## Examples

``` r
donor_recipient <- indicator_donor_recipient_relationship_duration(flows)
#> Warning: There were 1180 warnings in `dplyr::summarise()`.
#> The first warning was:
#> ℹ In argument: `first_year = min(budgetYear, na.rm = TRUE)`.
#> ℹ In group 3: `donor = "African Development Bank"` `recipient = "Food and
#>   Agriculture Organization of the United Nations"`.
#> Caused by warning in `min()`:
#> ! no non-missing arguments to min; returning Inf
#> ℹ Run dplyr::last_dplyr_warnings() to see the 1179 remaining warnings.
#table(donor_recipient$Relationship_Duration_Index)

library(ggplot2)
ggplot(donor_recipient, aes(x = Relationship_Duration_Index)) +
  geom_histogram( fill = "green", color = "white") +
  unhcrthemes::theme_unhcr(grid = "Y", axis = "X", axis_title = FALSE) +
  labs(
    title = "Distribution of Donor Recipient Relationship Duration Index",
    x = "",
    y = "Number of Donor-Recipient Pairs",
    caption = paste(
    "Indicator interpretation:",
    "Normalized duration of active funding relationships between donor-recipient
    pairs (0=new relationship, 1=active since earliest data).", "\n\n",
    
    "How to read the visualization:",
    "Histogram shows relationship longevity across partnerships. Right-skewed 
    distribution indicates many new relationships, left-skewed indicates 
    established partnerships.", "\n\n",
    
    "Humanitarian relevance:",
    "Long-term partnerships build trust, contextual understanding, and
    operational efficiency, leading to more effective crisis response.", "\n\n",
    
    "Source: Financial Tracking Service (FTS) API."
  )
  )
#> `stat_bin()` using `bins = 30`. Pick better value `binwidth`.
#> Warning: Removed 1782 rows containing non-finite outside the scale range (`stat_bin()`).
```
