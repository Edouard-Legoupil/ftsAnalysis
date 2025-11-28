# Plot Destination Funding by Donor

Shows funding received at a destination from multiple donors. Useful to
identify funding hotspots or dependency.

## Usage

``` r
plot_destination_funding_donor(flows, destination_name)
```

## Arguments

- flows:

  FTS flows dataframe.

- destination_name:

  Destination location name.

## Value

A ggplot object showing total funding per donor for the destination.

## Examples

``` r
p <- plot_destination_funding_donor(flows, destination_name= "Burundi")
# and plot with more powerful subtitle
dubbed <- generate_plot_story(p, provider = "azure", model = "gpt-4.1-mini")
p + ggplot2::labs(subtitle = dubbed)
```
