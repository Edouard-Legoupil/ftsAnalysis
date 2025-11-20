# Knowledge Sharing Intensity

Measures the proportion of flows mentioning collaboration, learning, or
assessment activities in the description.

## Usage

``` r
indicator_donor_knowledge_sharing_intensity(flows, donors = NULL)
```

## Arguments

- flows:

  A dataframe containing at least `description` and nested
  `sourceObjects`.

- donors:

  (optional) A dataframe with donor names to merge with the results.

## Value

A tibble with columns:

- donor:

  Donor organization name.

- Knowledge_Sharing_Intensity:

  Proportion of flows mentioning collaboration/learning/assessment
  (0–1).

## Details

Goal: Quantifies the degree to which a donor’s funding supports
knowledge sharing, joint assessments, learning events, or coordination
activities.

## Examples

``` r
donors <- indicator_donor_knowledge_sharing_intensity(flows)
#table(donors$Knowledge_Sharing_Intensity)

library(ggplot2)
# Basic histogram of Knowledge Sharing Intensity
ggplot(donors, aes(x = Knowledge_Sharing_Intensity)) +
  geom_histogram(binwidth = 0.05, fill = "steelblue", color = "white") +
  unhcrthemes::theme_unhcr(grid = "Y", axis = "X", axis_title = FALSE) +
  labs(
    title = "Distribution of Donor Knowledge Sharing Intensity",
    x = "",
    y = "Number of Donors",
    caption = paste(
    "Indicator interpretation:",
    "Proportion of flows mentioning collaboration, learning, or assessment
    activities in descriptions (0 = no mention, 1 = all flows include 
    knowledge components).", "\n\n",
    
    "How to read the visualization:",
    "Histogram shows distribution of knowledge sharing emphasis. Higher values 
    indicate donors prioritizing learning and coordination in funding.", "\n\n",
    
    "Humanitarian relevance:",
    "Identifies donors supporting system-wide learning and coordination, 
    crucial for improving response effectiveness and accountability.", "\n\n",
    
    "Source: Financial Tracking Service (FTS) API."
  )
  )

```
