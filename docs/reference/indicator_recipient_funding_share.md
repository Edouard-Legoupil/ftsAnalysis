# Funding Volume Share

Calculates the share of total funding received by each recipient
organization.

## Usage

``` r
indicator_recipient_funding_share(flows, recipients = NULL)
```

## Arguments

- flows:

  A dataframe containing `destinationObjects` and `amountUSD`.

- recipients:

  Optional dataframe of recipient organizations to merge with the
  results.

## Value

A tibble with columns `recipient` and `Funding_Volume_Share`.

## Examples

``` r
recipients <- indicator_recipient_funding_share(flows)
#table(recipients$Funding_Volume_Share)

library(ggplot2)
# Basic histogram of Knowledge Sharing Intensity
ggplot(recipients, aes(x = Funding_Volume_Share)) +
  geom_histogram( fill = "lightgreen", color = "white") +
  unhcrthemes::theme_unhcr(grid = "Y", axis = "X", axis_title = FALSE) +
  labs(
    title = "Distribution of Recipients Funding Volume Share",
    x = "",
    y = "Number of Recipients",
    caption = paste(
    "Indicator interpretation:",
    "Measures the proportion of total humanitarian funding received by each 
    recipient organization. Higher values indicate larger market share.", 
    "\n\n",
    
    "How to read the visualization:",
    "X-axis shows funding share (0-1), Y-axis shows recipient count. Most 
    recipients will have small shares, few will dominate (right tail).", "\n\n",
    
    "Humanitarian relevance:",
    "Identifies major implementing partners and market concentration, helping 
    understand dependency risks and partnership opportunities.", "\n\n",
    
    "Source: Financial Tracking Service (FTS) API."
  )
  )
#> `stat_bin()` using `bins = 30`. Pick better value `binwidth`.

```
