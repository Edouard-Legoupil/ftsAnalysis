# Donor Lifecycle Stage Scoring

Assigns donors to lifecycle stages:

1.  Prospect (alignment \> 0.7, no funding)

2.  New Partner (1-2 years funding)

3.  Growing Partner (increasing amounts, multiple sectors)

4.  Strategic Partner (multi-year, flexible funding)

5.  Legacy Partner (10+ years, co-design initiatives)

## Usage

``` r
analysis_donor_lifecycle_stage(
  flows,
  alignment_df = NULL,
  recipient_name = NULL
)
```

## Arguments

- flows:

  Dataframe `flows`.

- alignment_df:

  Optional tibble with donor alignment scores (donor, alignment_score
  0-1).

- recipient_name:

  Character: The name of the recipient organization to filter the flows
  by.

## Value

a list with data, aka a Tibble with donor, metrics and stage (factor)
and a plot.

## Details

Uses flows to compute engagement_frequency, funding_trend (slope),
multiyear_share proxy, and partnership_complexity proxy, scoped to a
specific recipient organization.

## Examples

``` r
result <- analysis_donor_lifecycle_stage(flows, 
             recipient_name= "United Nations High Commissioner for Refugees" )
print(result$plot)
```
