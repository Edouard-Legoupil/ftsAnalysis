# Plot Recipient Funding Composition by Donor

Shows how a specific recipient organization’s funding is distributed
across donors. Useful for assessing donor diversification and reliance.

## Usage

``` r
plot_recipient_funding_composition(flows, recipient_name)
```

## Arguments

- flows:

  A dataframe of humanitarian funding flows (FTS format).

- recipient_name:

  The name of the recipient organization to filter.

## Value

A ggplot object showing donor shares of recipient funding.

## Examples

``` r
p <- plot_recipient_funding_composition(flows, 
              recipient_name = "United Nations High Commissioner for Refugees")

# getting LLm story
story <- generate_plot_story(p, provider = "azure", model = "gpt-4.1-mini", max_tokens = 300)
# cat(story)
# and plot with more powerful subtitle
dubbed <- generate_plot_story(p, provider = "azure", model = "gpt-4.1-mini")
p + ggplot2::labs(subtitle = dubbed)
```
