# Prepare Funding Opportunity Dataset

Aggregates flows into donor-recipient-year observations and prepares
features for an opportunity prediction model. Features include:

- donor funding cycle timing (mean decision month)

- historical funding patterns (growth in recent years)

- simple NLP signals from description/keywords (presence of crisis
  keywords)

- sector funding trends (share to global clusters)

## Usage

``` r
analysis_prepare_opportunity_dataset(
  flows,
  lookback_years = 3,
  crisis_keywords = c("refugees", "refugee", "displacement", "displaced", "returnees",
    "idps", "protection", "conflict", "vulnerable")
)
```

## Arguments

- flows:

  Dataframe `flows`.

- lookback_years:

  Integer number of past years to compute trends (default 3).

- crisis_keywords:

  Character vector of keywords to flag global events (default common
  terms).

## Value

A tibble of donor, recipient, year, and features.

## Details

This function returns a tidy dataframe suitable for model training.

## Examples

``` r
crisis_keywords = c("refugees", "refugee","displacement", "displaced",
                         "returnees","idps",
                        "protection", "conflict", "vulnerable")

result <- analysis_prepare_opportunity_dataset( flows,
    lookback_years = 3,
    crisis_keywords = crisis_keywords)
#> Warning: There was 1 warning in `dplyr::summarise()`.
#> ℹ In argument: `max_cluster_share = max(cluster_share, na.rm = TRUE)`.
#> ℹ In group 347: `donor = "European Commission's Humanitarian Aid and Civil
#>   Protection Department"`, `recipient = "Emergency Shelter and NFI"`, `year =
#>   2021`.
#> Caused by warning in `max()`:
#> ! no non-missing arguments to max; returning -Inf
print(result$plot)
#> Warning: log-10 transformation introduced infinite values.
#> Warning: Removed 6559 rows containing missing values or values outside the scale range
#> (`geom_point()`).

  
```
