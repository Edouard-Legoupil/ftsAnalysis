# Plot Funding by Destination Location

Visualizes total humanitarian funding directed to a given destination
location. Useful to identify funding hotspots and compare regions.

## Usage

``` r
plot_location_funding_destination(flows, location_name)
```

## Arguments

- flows:

  A dataframe of humanitarian funding flows (FTS format).

- location_name:

  The name of the destination location to filter.

## Value

A ggplot object showing total funding per donor for the location.

## Examples

``` r
p <- plot_location_funding_destination(flows, location_name= "Burundi")

# getting LLm story
story <- generate_plot_story(p, max_tokens = 300)
#> Using model = "gemini-2.5-flash".
cat(story)
#> Burundi's humanitarian landscape relies heavily on external support, and understanding funding sources is key to sustaining aid efforts. This visualization starkly reveals that a single donor stands out, contributing over $81 million. This colossal contribution represents the vast majority of aid detailed here, demonstrating a high concentration of funding for the country.
#> 
#> While a few other donors provide significant support, each in the range of $7-8 million, their combined contributions still pale in comparison to the largest funder. Many other partners provide smaller, yet vital, amounts. This concentrated funding pattern underscores both the critical commitment of major donors and a potential vulnerability. Diversifying humanitarian funding for Burundi could enhance resilience and ensure more stable, predictable resources for people in need, minimizing over-reliance on any single source.
# and plot with more powerful subtitle
dubbed <- generate_plot_story(p)
#> Using model = "gemini-2.5-flash".
p + ggplot2::labs(subtitle = dubbed)
```
