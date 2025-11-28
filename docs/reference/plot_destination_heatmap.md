# Plot Top Donors Heatmap

Visualizes the total funding from top donors to recipient organizations
for a given destination.

## Usage

``` r
plot_destination_heatmap(flows, destination_name, top_n = 5)
```

## Arguments

- flows:

  FTS flows dataframe

- destination_name:

  Name of the destination location to filter for

- top_n:

  Number of top donors to display (default = 5)

## Value

A ggplot heatmap

## Examples

``` r
p <- plot_destination_heatmap(flows, destination_name= "Burundi", top_n = 5)
# and plot with more powerful subtitle
dubbed <- generate_plot_story(p, provider = "azure", model = "gpt-4.1-mini")
p + ggplot2::labs(subtitle = dubbed)
```
