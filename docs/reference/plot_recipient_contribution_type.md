# Plot Recipient Funding by Contribution Type

Visualizes the split of funding received by a recipient based on
contribution type (e.g., financial or in-kind). Useful to assess funding
modality diversity.

## Usage

``` r
plot_recipient_contribution_type(flows, recipient_name)
```

## Arguments

- flows:

  FTS flows dataframe.

- recipient_name:

  Recipient organization name.

## Value

A ggplot object showing funding by contribution type.

## Examples

``` r
p <- plot_recipient_contribution_type(flows, 
                recipient_name = "United Nations High Commissioner for Refugees")
# and plot with more powerful subtitle
dubbed <- generate_plot_story(p, provider = "azure", model = "gpt-4.1-mini")
p + ggplot2::labs(subtitle = dubbed)
```
