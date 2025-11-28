# Fit a simple Funding Opportunity Model (logistic)

Fits a logistic regression to predict whether a donor will fund a
recipient in year t+1 based on features prepared by
`prepare_opportunity_dataset()`.

## Usage

``` r
analysis_fit_opportunity_model(features, min_year = NULL)
```

## Arguments

- features:

  Dataframe produced by
  [`analysis_prepare_opportunity_dataset()`](analysis_prepare_opportunity_dataset.md).

- min_year:

  Minimum year to use for training (filters older data).

## Value

A glm object (binomial) and the training frame (list with components
model, data).

## Details

Label construction: response = 1 if total_amount \> 0 in year t+1 for
same donor-recipient.

## Examples

``` r
features <- analysis_prepare_opportunity_dataset(flows)$data
#> Warning: There was 1 warning in `dplyr::summarise()`.
#> ℹ In argument: `max_cluster_share = max(cluster_share, na.rm = TRUE)`.
#> ℹ In group 347: `donor = "European Commission's Humanitarian Aid and Civil
#>   Protection Department"`, `recipient = "Emergency Shelter and NFI"`, `year =
#>   2021`.
#> Caused by warning in `max()`:
#> ! no non-missing arguments to max; returning -Inf
model_results <- analysis_fit_opportunity_model(features , min_year = NULL)
print(model_results$plot)

```
