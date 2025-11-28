# Plot Funding Timeline by Status

Shows the evolution of funding amounts by status (pledge, commitment,
paid) across budget years. Useful for tracking donor disbursement
progress.

## Usage

``` r
plot_funding_status_timeline(flows)
```

## Arguments

- flows:

  FTS flows dataframe.

## Value

A ggplot object showing funding over time by status.

## Examples

``` r
p <- plot_funding_status_timeline(flows)
# and plot with more powerful subtitle
dubbed <- generate_plot_story(p, provider = "azure", model = "gpt-4.1-mini")
p + ggplot2::labs(subtitle = dubbed)
```
