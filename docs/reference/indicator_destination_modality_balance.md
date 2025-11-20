# Destination-Focused: Modality Balance

Calculates the share of cash or voucher-based programming (CTP) relative
to all modalities within each destination.

## Usage

``` r
indicator_destination_modality_balance(flows, destinations_df = NULL)
```

## Arguments

- flows:

  A dataframe including `destinationObjects`, `method`, and `amountUSD`.

- destinations_df:

  (optional) A dataframe with destination names to merge results with.

## Value

A tibble with `destination` and `Destination_Modality_Balance` (0–1
share of CTP).

## Details

Goal: Measures the balance between cash-based programming and
traditional modalities, based on the method variable.

## Examples

``` r
destination <- indicator_destination_modality_balance(flows)
#table(destination$Destination_Modality_Balance)

library(ggplot2)
ggplot(destination, aes(x = Destination_Modality_Balance)) +
  geom_histogram( fill = "red", color = "white") +
  unhcrthemes::theme_unhcr(grid = "Y", axis = "X", axis_title = FALSE) +
  labs(
    title = "Distribution of Destination Modality Balance",
    x = "",
    y = "Number of Destination",
    caption = paste(
    "Indicator interpretation:",
    "Share of cash-based programming (CTP) relative to all modalities (0-1).
    Higher values indicate greater cash modality utilization.", "\n\n",
    
    "How to read the visualization:",
    "Histogram shows CTP adoption across destinations. Most destinations cluster
    near zero, indicating traditional in-kind programming dominance.", "\n\n",
    
    "Humanitarian relevance:",
    "Appropriate modality balance ensures efficient, dignified assistance while
    maintaining essential in-kind support where markets are non-functional.",
    "\n\n",
    
    "Source: Financial Tracking Service (FTS) API."
  )
  )
#> `stat_bin()` using `bins = 30`. Pick better value `binwidth`.
```
