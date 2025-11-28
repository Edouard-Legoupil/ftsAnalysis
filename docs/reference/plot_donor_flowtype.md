# Plot Donor Flow Type Distribution

Shows the distribution of flow types (Standard, Parked, Pass-through,
Carryover) for a selected donor. Useful for understanding donor
engagement complexity.

## Usage

``` r
plot_donor_flowtype(flows, donor_name)
```

## Arguments

- flows:

  FTS flows dataframe.

- donor_name:

  Donor organization name.

## Value

A ggplot object showing flow type proportions.

## Examples

``` r
p <- plot_donor_flowtype(flows, donor_name= "Spain, Government of")
# and plot with more powerful subtitle
dubbed <- generate_plot_story(p, provider = "azure", model = "gpt-4.1-mini")
p + ggplot2::labs(subtitle = dubbed)
```
