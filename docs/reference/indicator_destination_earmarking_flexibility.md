# Earmarking Flexibility

Computes a weighted average earmarking flexibility index per destination
(Unearmarked = 1.0, Softly earmarked = 0.75, Earmarked = 0.5, Tightly
earmarked = 0.25).

## Usage

``` r
indicator_destination_earmarking_flexibility(flows, destinations = NULL)
```

## Arguments

- flows:

  A dataframe with `destinationObjects`, `amountUSD`, and
  `grandBargainEarmarkingType`.

- destinations:

  Optional dataframe to merge.

## Value

A tibble with `destination` and `Earmarking_Flexibility`.

## Examples

``` r
destination <- indicator_destination_earmarking_flexibility(flows)
#table(destination$Earmarking_Flexibility)

library(ggplot2)
ggplot(destination, aes(x = Earmarking_Flexibility)) +
  geom_histogram( fill = "red", color = "white") +
  unhcrthemes::theme_unhcr(grid = "Y", axis = "X", axis_title = FALSE) +
  labs(
    title = "Distribution of Destination Earmarking Flexibility",
    x = "",
    y = "Number of Destination",
    caption = paste(
    "Indicator interpretation:",
    "Weighted average of earmarking flexibility (1=unearmarked, 0.75=softly
    earmarked, 0.5=earmarked, 0.25=tightly earmarked). Higher values indicate 
    more flexible funding.", "\n\n",
    
    "How to read the visualization:",
    "Histogram shows flexibility scores. Higher values indicate destinations 
    receiving more unearmarked funding for adaptive programming.", "\n\n",
    
    "Humanitarian relevance:",
    "Flexible funding enables context-responsive programming, local leadership, 
    and efficient resource allocation based on evolving needs rather than 
    rigid donor requirements.", "\n\n",
    
    "Source: Financial Tracking Service (FTS) API."
  )
  )
#> `stat_bin()` using `bins = 30`. Pick better value `binwidth`.
```
