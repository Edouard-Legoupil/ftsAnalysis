# Plot Recipient Co-Funding Rate

Shows how often a recipient shares funding with other recipients for a
given donor. Useful to see multi-recipient funding trends.

## Usage

``` r
plot_recipient_cofunding(flows, recipient_name)
```

## Arguments

- flows:

  A dataframe of FTS funding flows.

- recipient_name:

  Recipient organization name to filter.

## Value

A ggplot object with co-funding rates.

## Examples

``` r
p <- plot_recipient_cofunding(flows, 
              recipient_name = "United Nations High Commissioner for Refugees")
# and plot with more powerful subtitle
dubbed <- generate_plot_story(p, provider = "azure", model = "gpt-4.1-mini")
p + ggplot2::labs(subtitle = dubbed)
```
