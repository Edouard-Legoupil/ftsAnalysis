# Plot Top Donors Heatmap

Visualizes the total funding from top donors to recipient organizations
for a given location. Correctly handles deeply nested FTS
destinationObjects.

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
story <- generate_plot_story(p, max_tokens = 300)
#> Using model = "gemini-2.5-flash".
cat(story)
#> Humanitarian aid to Burundi is vital, and this visualization offers a critical look at how funds are channeled. It maps the direct organizational flows from the top five donors to their various recipients within the country.
#> 
#> The diverse array of colors across the tiles immediately reveals that while a few flows are significant (indicated by bright hues like yellow), many others are smaller but contribute to the overall response (darker shades). This granular view highlights a diversified funding strategy, with major donors often supporting multiple implementing partners rather than concentrating funds in a single entity.
#> 
#> Understanding these specific donor-to-recipient pathways is essential for enhancing accountability, coordination, and identifying potential strengths or gaps in the aid delivery ecosystem. It shows who funds whom, giving invaluable insights into Burundi's humanitarian landscape. Such transparency ensures that resources effectively reach vulnerable populations and strengthens the overall impact of humanitarian interventions.
# and plot with more powerful subtitle
dubbed <- generate_plot_story(p)
#> Using model = "gemini-2.5-flash".
p + ggplot2::labs(subtitle = dubbed)
```
