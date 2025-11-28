# Systemic: Network Density and Granularity Insights

Calculates key metrics for the funding network structure, including
overall density, density over time (by year), and the granularity
(density of core links vs. total links).

## Usage

``` r
analysis_systemic_network_insights(flows, core_threshold = 1e+05)
```

## Arguments

- flows:

  A dataframe including `sourceObjects`, `destinationObjects`, and
  `budgetYear`.

- core_threshold:

  Numeric: Minimum funding amount (USD) for a link to be considered
  "Core". Default is 100000 USD.

## Value

A tibble with key network metrics: Overall Density, Density by Year,
Core Density, and Granularity.

## Examples

``` r
result <- analysis_systemic_network_insights(flows)
#> Warning: Using `size` aesthetic for lines was deprecated in ggplot2 3.4.0.
#> ℹ Please use `linewidth` instead.
#> ℹ The deprecated feature was likely used in the ftsAnalysis package.
#>   Please report the issue at
#>   <https://github.com/edouard-legoupil/ftsAnalysis/issues>.
print(result$plot)
#> `geom_smooth()` using formula = 'y ~ x'
```
