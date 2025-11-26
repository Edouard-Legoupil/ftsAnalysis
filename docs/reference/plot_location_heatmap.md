# Plot Top Donors Heatmap

Visualizes the total funding from top donors to recipient organizations
for a given location.

## Usage

``` r
plot_location_heatmap(flows, location_name, top_n = 5)
```

## Arguments

- flows:

  FTS flows dataframe

- location_name:

  Name of the destination location to filter for

- top_n:

  Number of top donors to display (default = 5)

## Value

A ggplot heatmap

## Examples

``` r
p <- plot_location_heatmap(flows, location_name= "Burundi", top_n = 5)

# getting LLm story
story <- generate_plot_story(p, provider = "ollama", model = "deepseek-r1")
# cat(story)
# and plot with more powerful subtitle
dubbed <- generate_plot_story(p, provider = "ollama", model = "deepseek-r1")
p + ggplot2::labs(subtitle = dubbed)
```
