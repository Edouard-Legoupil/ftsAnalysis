# Plot Grand Bargain Earmarking by Recipient

Visualizes the proportion of funding earmarked under the Grand Bargain
commitments for each recipient. Helps to assess how much funding aligns
with international humanitarian reform commitments.

## Usage

``` r
plot_recipient_grandbargain(flows, recipient_name)
```

## Arguments

- flows:

  FTS flows dataframe.

- recipient_name:

  Recipient organization name.

## Value

A ggplot object showing the split of earmarked vs non-earmarked funding.

## Examples

``` r
p <- plot_recipient_grandbargain(flows,
          recipient_name = "United Nations High Commissioner for Refugees")
#> Scale for y is already present.
#> Adding another scale for y, which will replace the existing scale.
# and plot with more powerful subtitle
dubbed <- generate_plot_story(p, provider = "azure", model = "gpt-4.1-mini")
p + ggplot2::labs(subtitle = dubbed)
```
