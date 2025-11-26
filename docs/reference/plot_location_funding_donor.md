# Plot Destination Funding by Donor

Shows funding received at a location from multiple donors. Useful to
identify funding hotspots or dependency.

## Usage

``` r
plot_location_funding_donor(flows, location_name)
```

## Arguments

- flows:

  FTS flows dataframe.

- location_name:

  Destination location name.

## Value

A ggplot object showing total funding per donor for the location.

## Examples

``` r
p <- plot_location_funding_donor(flows, location_name= "Burundi")

# getting LLm story
story <- generate_plot_story(p, provider = "ollama", model = "deepseek-r1")
# cat(story)
# and plot with more powerful subtitle
dubbed <- generate_plot_story(p, provider = "ollama", model = "deepseek-r1")
p + ggplot2::labs(subtitle = dubbed)
```
