# Donor Segmentation (Priority Matrix)

Classify donors into priority segments:

- Strategic Stars (High priority, under-resourced)

- Core Partners (High priority, well-resourced)

- Emerging Opportunities (Medium priority, growth potential)

- Maintenance Accounts (Low priority, stable)

- Divestment Candidates (Low priority, declining)

## Usage

``` r
analysis_donor_segmentation(flows, recipient_name, top_n = 20)
```

## Arguments

- flows:

  Dataframe `flows`.

- recipient_name:

  Character name of our org (to compute "under-resourced" signals).

- top_n:

  number of observation on the plot

## Value

a list with data, aka a Tibble with donor and assigned segment plus
Resource_Allocation_Score and a plot.

## Details

Uses Engagement_Index, Alignment_Index, Growth_Potential computed from
flows.

## Examples

``` r
result <- analysis_donor_segmentation(flows,
             recipient_name ="United Nations High Commissioner for Refugees" )
print(result$plot)
```
