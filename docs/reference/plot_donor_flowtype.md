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

# getting LLm story
story <- generate_plot_story(p, max_tokens = 300)
#> Using model = "gemini-2.5-flash".
cat(story)
#> The Government of Spain stands as a significant humanitarian donor, and this visualization offers a clear view into how its funding is distributed across different channels.
#> 
#> A striking pattern emerges: the vast majority of Spain's humanitarian financial support, amounting to over $132 million, is channeled through a single, predominant flow type. This represents the lion's share of its contributions. In comparison, other funding streams receive significantly smaller allocations, with one flow type garnering less than $300,000 and another barely registering.
#> 
#> This highly concentrated distribution reveals a strategic approach to Spanish humanitarian funding. While the specific nature of these flow types isn't detailed, such a strong focus could indicate a preference for certain long-term partnerships, specific aid mechanisms, or key strategic priorities. For humanitarian organizations and those they serve, understanding this concentration is crucial. It highlights where the bulk of Spain's support is directed, enabling better planning for operations aligned with these major funding channels, while also prompting considerations about flexibility in addressing diverse and emerging crises.
# and plot with more powerful subtitle
dubbed <- generate_plot_story(p)
#> Using model = "gemini-2.5-flash".
p + ggplot2::labs(subtitle = dubbed)
```
