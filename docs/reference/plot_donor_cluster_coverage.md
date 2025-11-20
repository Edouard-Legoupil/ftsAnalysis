# Plot Donor Cluster Coverage

Visualizes which humanitarian clusters each donor supports, using the
number of flows per cluster. Useful to understand donor focus and
alignment with sector priorities.

## Usage

``` r
plot_donor_cluster_coverage(flows, donor_name)
```

## Arguments

- flows:

  FTS flows dataframe.

- donor_name:

  Donor organization name.

## Value

A ggplot object showing donor funding coverage across clusters.

## Examples

``` r
p <- plot_donor_cluster_coverage(flows, donor_name= "Spain, Government of")

# getting LLm story
story <- generate_plot_story(p, max_tokens = 300)
#> Using model = "gemini-2.5-flash".
cat(story)
#> The Spanish government demonstrates a broad commitment to humanitarian action, extending financial support across at least 17 distinct humanitarian clusters. This wide-ranging engagement indicates a dedication to addressing diverse urgent needs globally.
#> 
#> However, a closer look at the financial flows reveals a clear strategic focus. While Spain contributes to many areas, certain clusters receive significantly more attention and investment through a higher volume of transactions. One cluster in particular (cluster 17) stands out as a major priority, drawing 46 separate financial flows. Other clusters also show substantial engagement, receiving 30, 25, and 24 flows respectively, suggesting concentrated efforts in these specific aid sectors.
#> 
#> Conversely, some clusters receive much less frequent financial support, with one cluster (cluster 1) recording only a single flow and others receiving just two or three. This disparity underscores a strategic allocation of resources, where the Spanish government prioritizes certain critical humanitarian areas for more robust and frequent support, while still maintaining a presence in other vital, yet less frequently funded, sectors.
# and plot with more powerful subtitle
dubbed <- generate_plot_story(p)
#> Using model = "gemini-2.5-flash".
p + ggplot2::labs(subtitle = dubbed)
```
