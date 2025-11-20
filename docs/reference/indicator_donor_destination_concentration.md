# Donor→Destination: Portfolio Concentration Index

Computes how concentrated a donor's funding portfolio is across
destinations, using the Herfindahl–Hirschman Index (sum of squared
funding shares).

## Usage

``` r
indicator_donor_destination_concentration(flows, donor_dest_df = NULL)
```

## Arguments

- flows:

  A dataframe with `sourceObjects`, `destinationObjects`, and
  `amountUSD`.

- donor_dest_df:

  (optional) A dataframe of donor–destination pairs to merge results
  with.

## Value

A tibble with `donor`, `DonorDestination_Concentration_Index`
(0=diverse, 1=concentrated).

## Details

Goal: Quantifies how concentrated (vs diversified) a donor’s funding
portfolio is across destinations using the Herfindahl–Hirschman Index
(HHI).

## Examples

``` r
donor <- indicator_donor_destination_concentration(flows)
#table(donor$DonorDestination_Concentration_Index)

library(ggplot2)
ggplot(donor, aes(x = DonorDestination_Concentration_Index)) +
  geom_histogram( fill = "steelblue", color = "white") +
  unhcrthemes::theme_unhcr(grid = "Y", axis = "X", axis_title = FALSE) +
  labs(
    title = "Distribution of Donor Destination Concentration Index",
    x = "",
    y = "Number of Donors",
    caption = paste(
    "Indicator interpretation:",
    "Herfindahl-Hirschman Index measuring geographic portfolio concentration 
    (0 = highly diversified, 1 = focused on few locations/plans).", "\n\n",
    
    "How to read the visualization:",
    "Histogram shows concentration levels. Left indicates global spread, right 
    indicates focused geographic operations in few crises.", "\n\n",
    
    "Humanitarian relevance:",
    "Helps understand donor geographic strategies - specialized crisis 
    responders vs broad global supporters - for targeted engagement.", "\n\n",
    
    "Source: Financial Tracking Service (FTS) API."
  )
  )
#> `stat_bin()` using `bins = 30`. Pick better value `binwidth`.
```
