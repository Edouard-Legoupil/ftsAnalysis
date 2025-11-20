# Donor→Destination: Coverage Index

Calculates the proportion of destinations a donor supports out of the
total destinations in the dataset.

## Usage

``` r
indicator_donor_destination_coverage(flows, donor_dest_df = NULL)
```

## Arguments

- flows:

  A dataframe with `sourceObjects`, `destinationObjects`, and
  `amountUSD`.

- donor_dest_df:

  (optional) A dataframe of donor–destination pairs to merge results
  with.

## Value

A tibble with `donor`, `DonorDestination_Coverage_Index`.

## Details

Goal: Measures how many distinct destinations (countries/plans/sectors)
a donor supports compared to the total destinations in the dataset.

## Examples

``` r
donor <- indicator_donor_destination_coverage(flows)
#table(donor$DonorDestination_Concentration_Index)

library(ggplot2)
ggplot(donor, aes(x = DonorDestination_Coverage_Index)) +
  geom_histogram( fill = "steelblue", color = "white") +
  unhcrthemes::theme_unhcr(grid = "Y", axis = "X", axis_title = FALSE) +
  labs(
    title = "Distribution of Donor Destination Coverage Index",
    x = "",
    y = "Number of Donors",
    caption = paste(
    "Indicator interpretation:",
    "Proportion of total destinations supported by donor (0 = few locations,
    1 = active in all locations in dataset).", "\n\n",
    
    "How to read the visualization:",
    "Histogram shows coverage breadth. Higher values indicate donors with global
    reach, lower values indicate regionally focused donors.", "\n\n",
    
    "Humanitarian relevance:",
    "Identifies global players vs regional specialists, informing crisis-specific
    partnership strategies and gap analysis.", "\n\n",
    
    "Source: Financial Tracking Service (FTS) API."
  )
  )
#> `stat_bin()` using `bins = 30`. Pick better value `binwidth`.
```
