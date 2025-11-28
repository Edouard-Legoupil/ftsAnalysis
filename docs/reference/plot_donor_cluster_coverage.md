# Plot Donor Cluster Coverage

Visualizes which humanitarian clusters each donor supports, using the
number of flows per cluster. Useful to understand donor focus and
alignment with sector priorities.

## Usage

``` r
plot_donor_cluster_coverage(flows, donor_name)
```

## Arguments

- flows:

  FTS flows dataframe.

- donor_name:

  Donor organization name.

## Value

A ggplot object showing donor funding coverage across clusters.

## Examples

``` r
p <- plot_donor_cluster_coverage(flows, donor_name= "Spain, Government of")
# and plot with more powerful subtitle
dubbed <- generate_plot_story(p, provider = "azure", model = "gpt-4.1-mini")
p + ggplot2::labs(subtitle = dubbed)
```
