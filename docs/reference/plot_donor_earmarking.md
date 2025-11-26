# Plot Donor Funding by Earmarking Type

Visualizes the proportion of funding per earmarking type (Unearmarked,
Softly earmarked, etc.) for a selected donor. Helps understand donor
flexibility and restrictions.

## Usage

``` r
plot_donor_earmarking(flows, donor_name)
```

## Arguments

- flows:

  A dataframe of humanitarian funding flows (FTS format).

- donor_name:

  Donor organization name to filter.

## Value

A ggplot object showing donor funding by earmarking type.

## Examples

``` r
p <- plot_donor_earmarking(flows, donor_name= "Spain, Government of")

# getting LLm story
story <- generate_plot_story(p, provider = "azure", model = "gpt-4.1-mini", max_tokens = 300)
# cat(story)
# and plot with more powerful subtitle
dubbed <- generate_plot_story(p, provider = "azure", model = "gpt-4.1-mini")
p + ggplot2::labs(subtitle = dubbed)
```
