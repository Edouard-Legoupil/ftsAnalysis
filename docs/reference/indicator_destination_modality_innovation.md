# Modality Innovation

Calculates the percentage of funding to a destination that is Cash
Transfer Programming (CTP).

## Usage

``` r
indicator_destination_modality_innovation(flows, destinations = NULL)
```

## Arguments

- flows:

  A dataframe with `destinationObjects`, `amountUSD`, and `method`.

- destinations:

  Optional dataframe to merge results with.

## Value

A tibble with `destination` and `Modality_Innovation`.

## Examples

``` r
destination <- indicator_destination_modality_innovation(flows)
#table(destination $Recipient_Diversification_Index)

library(ggplot2)
ggplot(destination, aes(x = Modality_Innovation)) +
  geom_histogram( fill = "red", color = "white") +
  unhcrthemes::theme_unhcr(grid = "Y", axis = "X", axis_title = FALSE) +
  labs(
    title = "Distribution of Destination Modality Innovation",
    x = "",
    y = "Number of Destination",
    caption = paste(
    "Indicator interpretation:",
    "Percentage of funding using Cash Transfer Programming (CTP) per destination.
    Higher values indicate greater adoption of innovative cash-based approaches.",
    "\n\n",
    
    "How to read the visualization:",
    "Histogram shows CTP adoption rates across destinations. Right-skewed 
    distribution indicates most destinations have low CTP usage, few are CTP 
    leaders.", "\n\n",
    
    "Humanitarian relevance:",
    "Cash programming increases efficiency, dignity, and local market benefits.
    Identifies destinations where cash coordination capacity may need 
    strengthening.", "\n\n",
    
    "Source: Financial Tracking Service (FTS) API."
  )
  )
#> `stat_bin()` using `bins = 30`. Pick better value `binwidth`.
```
