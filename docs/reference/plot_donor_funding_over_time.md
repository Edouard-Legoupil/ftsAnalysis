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
#> Warning: Using `size` aesthetic for lines was deprecated in ggplot2 3.4.0.
#> ℹ Please use `linewidth` instead.
#> ℹ The deprecated feature was likely used in the ftsAnalysis package.
#>   Please report the issue to the authors.

# getting LLm story
story <- generate_plot_story(p, max_tokens = 300)
#> Using model = "gemini-2.5-flash".
cat(story)
#> The Spanish Government's humanitarian funding reveals a dynamic and significantly increasing commitment to global crises in recent years.
#> 
#> After providing over $10 million in 2022, Spain's humanitarian aid saw a sharp dip to just under $1.5 million in 2023. However, this decline was swiftly followed by a powerful resurgence.
#> 
#> The data shows a dramatic escalation in support, with over $50 million allocated for 2024 – a more than thirty-fold increase from the previous year. This robust positive trend is set to continue, with an even greater commitment exceeding $64 million projected for 2025. This trajectory highlights Spain's renewed and substantially strengthened role in humanitarian efforts, promising increased resources for critical relief operations globally.
# and plot with more powerful subtitle
dubbed <- generate_plot_story(p)
#> Using model = "gemini-2.5-flash".
print(p + ggplot2::labs(subtitle = dubbed))
#> Warning: Removed 1 row containing missing values or values outside the scale range
#> (`geom_col()`).
#> Warning: Removed 1 row containing missing values or values outside the scale range
#> (`geom_line()`).
#> Warning: Removed 1 row containing missing values or values outside the scale range
#> (`geom_point()`).

```
