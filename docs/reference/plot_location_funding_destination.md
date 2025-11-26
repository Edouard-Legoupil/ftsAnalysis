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
story <- generate_plot_story(p, provider = "ollama", model = "deepseek-r1")
# cat(story)
# and plot with more powerful subtitle
dubbed <- generate_plot_story(p, provider = "ollama", model = "deepseek-r1")
p + ggplot2::labs(subtitle = dubbed)
```
