# Relationship Duration Index

Measures the duration of a donor’s funding relationship relative to the
maximum possible duration.

## Usage

``` r
indicator_donor_relationship_duration(flows, donors = NULL)
```

## Arguments

- flows:

  A dataframe containing `sourceObjects` and `budgetYear`.

- donors:

  Optional dataframe with donor names.

## Value

A tibble with `donor` and `Relationship_Duration_Index`.

## Examples

``` r
donors <- indicator_donor_relationship_duration(flows)
#table(donor$Relationship_Duration_Index)
library(ggplot2)
ggplot(donors, aes(x = Relationship_Duration_Index)) +
  geom_histogram(binwidth = 0.05, fill = "steelblue", color = "white") +
  unhcrthemes::theme_unhcr(grid = "Y", axis = "X", axis_title = FALSE) +
  labs(
    title = "Distribution of Donor Relationship Duration Index",
    x = "",
    y = "Number of Donors",
    caption = paste(
    "Indicator interpretation:",
    "Measures duration of donor's funding relationship relative to maximum 
    possible duration. 1 = active since earliest data, 0 = new entrant.", "\n\n",
    
    "How to read the visualization:",
    "Histogram shows distribution of duration scores. Left-skewed distribution 
    indicates many new donors, right-skewed indicates established 
    relationships.", "\n\n",
    
    "Humanitarian relevance:",
    "Long-term donors often have deeper contextual understanding and more 
    predictable funding patterns for strategic planning.", "\n\n",
    
    "Source: Financial Tracking Service (FTS) API."
  )
  )
```
