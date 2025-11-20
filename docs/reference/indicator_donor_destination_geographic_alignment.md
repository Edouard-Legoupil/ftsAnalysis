# Geographic Alignment

Calculates the Jaccard similarity between donor-funded locations and
reference locations.

## Usage

``` r
indicator_donor_destination_geographic_alignment(flows, our_locations)
```

## Arguments

- flows:

  A dataframe containing `sourceObjects`, `destinationObjects`.

- our_locations:

  Character vector of priority locations.

## Value

A tibble with columns `donor` and `Geographic_Alignment`.

## Examples

``` r
donor <- indicator_donor_destination_geographic_alignment(flows, our_locations = c("Yemen","Haiti"))
#table(donor$Geographic_Alignment)

library(ggplot2)
ggplot(donor, aes(x = Geographic_Alignment)) +
  geom_histogram( fill = "steelblue", color = "white") +
  unhcrthemes::theme_unhcr(grid = "Y", axis = "X", axis_title = FALSE) +
  labs(
    title = "Distribution of Donor Destination Geographic_Alignment",
    x = "",
    y = "Number of Destination",
   caption = paste(
    "Indicator interpretation:",
    "Jaccard similarity between donor-funded locations and priority locations (0 = no overlap, 1 = identical geographic focus).", "\n\n",
    
    "How to read the visualization:",
    "Histogram shows alignment with specified priority locations. Higher values indicate donors active in organizational priority countries.", "\n\n",
    
    "Humanitarian relevance:",
    "Identifies natural partners for priority crises and reveals funding gaps in key locations needing advocacy attention.", "\n\n",
    
    "Source: Financial Tracking Service (FTS) API."
  )
  )
#> `stat_bin()` using `bins = 30`. Pick better value `binwidth`.
```
