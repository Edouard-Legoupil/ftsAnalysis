# Co-Funding Rate

Calculates the percentage of flows where a recipient shares funding with
other recipient organizations (not the sole recipient).

## Usage

``` r
indicator_recipient_cofunding_rate(flows, recipients = NULL)
```

## Arguments

- flows:

  A dataframe containing `destinationObjects` and `amountUSD`.

- recipients:

  Optional dataframe of recipient organizations to merge.

## Value

A tibble with `recipient` and `Co_Funding_Rate`.

## Examples

``` r
recipients <- indicator_recipient_cofunding_rate(flows)
#table(recipients$Co_Funding_Rate)

library(ggplot2)
ggplot(recipients, aes(x = Co_Funding_Rate)) +
  geom_histogram( fill = "lightgreen", color = "white") +
  unhcrthemes::theme_unhcr(grid = "Y", axis = "X", axis_title = FALSE) +
  labs(
    title = "Distribution of Recipients CoFunding Rate",
    x = "",
    y = "Number of Recipients",
    caption = paste(
    "Indicator interpretation:",
    "Percentage of funding flows where recipient shares funding with other 
    organizations (not sole recipient). 0 = always sole recipient, 
    1 = always co-funded.", "\n\n",
    
    "How to read the visualization:",
    "Histogram shows co-funding frequency. Higher values indicate collaborative
    funding arrangements, lower values indicate standalone projects.", "\n\n",
    
    "Humanitarian relevance:",
    "Identifies organizations experienced in consortium work and coordination,
    crucial for complex multi-partner responses and integrated programming.", 
    "\n\n",
    
    "Source: Financial Tracking Service (FTS) API."
  )
  )
#> `stat_bin()` using `bins = 30`. Pick better value `binwidth`.
```
