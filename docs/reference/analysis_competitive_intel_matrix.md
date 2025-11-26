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
recipient_name <- "United Nations High Commissioner for Refugees"

matrix_data <- analysis_competitive_intel_matrix(flows,
                                              recipient_name,
                                              peers = NULL)
ggplot2::ggplot(matrix_data, ggplot2::aes(x = market_share, 
                                          y = growth_differential)) +
  ggplot2::geom_point(
    ggplot2::aes(size = our_funding, color = sector), alpha = 0.7) +
  ggplot2::geom_text(
    ggplot2::aes(label = sector),
            vjust = 1,
            hjust = 1,
            size = 3) +
  ggplot2::scale_y_continuous(labels = scales::label_number(
    scale_cut = scales::cut_short_scale())) +
  ggplot2::scale_x_continuous(labels = scales::label_number(
    scale_cut = scales::cut_short_scale())) +
  ggplot2::labs(
    title = "Competitive Intelligence Matrix",
    x = "Market Share",
    y = "Growth Differential",
    size = "Our Funding",
    caption ="**Data Source**: OCHA Financial Tracking Service (FTS) API.") +
  unhcrthemes::theme_unhcr(
    grid = FALSE,
    axis =  FALSE,
    axis_title = FALSE,
    legend = TRUE
  )  
#> Warning: Removed 21 rows containing missing values or values outside the scale range
#> (`geom_point()`).
#> Warning: Removed 21 rows containing missing values or values outside the scale range
#> (`geom_text()`).
```
