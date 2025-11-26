# Plot Donor Funding Over Time

Visualizes the total funding provided by a given donor across budget
years. Useful to track trends, identify peaks, and assess consistency.

## Usage

``` r
plot_donor_funding_over_time(flows, donor_name)
```

## Arguments

- flows:

  A dataframe of humanitarian funding flows (FTS format).

- donor_name:

  The name of the donor organization to filter.

## Value

A ggplot object showing donor funding trends over budget years.

## Examples

``` r
p <- plot_donor_funding_over_time(flows, donor_name= "Spain, Government of")

# getting LLm story
story <- generate_plot_story(p, provider = "azure", model = "gpt-4.1-mini", max_tokens = 300)
#cat(story)
# and plot with more powerful subtitle
dubbed <- generate_plot_story(p, provider = "azure", model = "gpt-4.1-mini")
print(p + ggplot2::labs(subtitle = dubbed))

```
