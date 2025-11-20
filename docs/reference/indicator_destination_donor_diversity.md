# Destination-Focused: Donor Diversity Index

Calculates how diversified a destination's funding sources are using the
inverse Herfindahl–Hirschman Index across donors.

## Usage

``` r
indicator_destination_donor_diversity(flows, destinations_df = NULL)
```

## Arguments

- flows:

  A dataframe with `destinationObjects`, `sourceObjects`, and
  `amountUSD`.

- destinations_df:

  (optional) A dataframe of destinations to merge results with.

## Value

A tibble with `destination` and `Destination_Donor_Diversity_Index`.

## Details

Goal: Measures how diversified funding sources are (inverse of
dependency). Computed using the inverse Herfindahl–Hirschman Index
(1–HHI) across donors.

## Examples

``` r
destination <- indicator_destination_donor_diversity(flows)
#table(destination$Earmarking_Flexibility)

library(ggplot2)
ggplot(destination, aes(x = Destination_Donor_Diversity_Index)) +
  geom_histogram( fill = "red", color = "white") +
  unhcrthemes::theme_unhcr(grid = "Y", axis = "X", axis_title = FALSE) +
  labs(
    title = "Distribution of Destination Donor Diversity Index",
    x = "",
    y = "Number of Destination",
    caption = paste(
    "Indicator interpretation:",
    "Inverse Herfindahl-Hirschman Index measuring donor diversification 
    (0=single donor dependency, 1=highly diversified funding base).", "\n\n",
    
    "How to read the visualization:",
    "Histogram shows diversification levels. Higher values indicate resilient
    funding ecosystems, lower values indicate vulnerability to individual
    donor decisions.", "\n\n",
    
    "Humanitarian relevance:",
    "Diversified funding reduces crisis vulnerability to donor policy changes
    and ensures more stable response capacity during political shifts.", "\n\n",
    
    "Source: Financial Tracking Service (FTS) API."
  )
  )
#> `stat_bin()` using `bins = 30`. Pick better value `binwidth`.
```
