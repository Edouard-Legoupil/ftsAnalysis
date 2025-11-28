# Plot Funding by Destination Location

Visualizes total humanitarian funding directed to a given destination
destination. Useful to identify funding hotspots and compare regions.

## Usage

``` r
plot_destination_funding_destination(flows, destination_name)
```

## Arguments

- flows:

  A dataframe of humanitarian funding flows (FTS format).

- destination_name:

  The name of the destination location to filter.

## Value

A ggplot object showing total funding per donor for the destination.

## Examples

``` r
p <- plot_destination_funding_destination(flows, destination_name= "Burundi")
# and plot with more powerful subtitle
dubbed <- generate_plot_story(p, provider = "azure", model = "gpt-4.1-mini")
p + ggplot2::labs(subtitle = dubbed)
```
