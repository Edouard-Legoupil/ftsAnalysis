# Competitive Intelligence Matrix

Computes our organization's competitive position across sectors using:

- Market_share = Our_funding_in_sector / Total_sector_funding

- Growth_differential = Our_growth - Average_peer_growth

- Funding_diversity = 1 - HHI(our_funding_sources)

- Peer_encroachment = sum(peer_growth_in_our_core_sectors)

## Usage

``` r
analysis_competitive_intel_matrix(flows, recipient_name, peers = NULL)
```

## Arguments

- flows:

  Dataframe `flows`.

- recipient_name:

  Character name of our organization as appears in
  destinationObjects.name (type Organization).

- peers:

  Optional character vector of peer organization names. If NULL peers
  are all other organizations in destinationObjects.

## Value

Tibble with sector-level and aggregated competitive indicators and a
composite Competitive_Position score.

## Examples

``` r
result <- analysis_competitive_intel_matrix(flows,
               recipient_name = "United Nations High Commissioner for Refugees",
                peers = NULL)
print(result$plot)
#> Warning: Removed 21 rows containing missing values or values outside the scale range
#> (`geom_point()`).
#> Warning: Removed 21 rows containing missing values or values outside the scale range
#> (`geom_text()`).
```
