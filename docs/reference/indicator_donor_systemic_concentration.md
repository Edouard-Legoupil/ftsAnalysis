# Donor Systemic: Concentration Index

Calculates the Herfindahl–Hirschman concentration index (HHI) for each
donor, based on the distribution of funding amounts across recipient
organizations. A higher value means the donor funds fewer recipients
more heavily.

## Usage

``` r
indicator_donor_systemic_concentration(flows, donors = NULL)
```

## Arguments

- flows:

  A dataframe including `sourceObjects`, `destinationObjects`, and
  `amountUSD`.

- donors:

  (optional) A dataframe with donor names to merge with the results.

## Value

A tibble with `donor` and `Donor_Concentration_Index` (0–1 scale).

## Details

Goal: Measures how concentrated a donor’s portfolio is across
recipients.

## Examples

``` r
donors <- indicator_donor_systemic_concentration(flows)

#table(donors$Donor_Concentration_Index)

library(ggplot2)
ggplot(donors, aes(x = Donor_Concentration_Index)) +
  geom_histogram(binwidth = 0.05, fill = "steelblue", color = "white") +
  unhcrthemes::theme_unhcr(grid = "Y", axis = "X", axis_title = FALSE) +
  labs(
    title = "Distribution of Donor Concentration Index",
    x = "",
    y = "Number of Donors",
    caption = paste(
    "Indicator interpretation:",
    "Herfindahl-Hirschman Index measuring portfolio concentration across 
    recipients (0 = highly diversified, 1 = focused on few recipients).",
    "\n\n",
    
    "How to read the visualization:",
    "X-axis shows concentration level. Left side indicates donors spreading
    funds widely, right side indicates focused funding on few partners.", "\n\n",
    
    "Humanitarian relevance:",
    "Helps identify donors with broad partner networks vs specialized 
    relationships, informing partnership and resource mobilization strategies.",
    "\n\n",
    
    "Source: Financial Tracking Service (FTS) API."
  )
  )
```
