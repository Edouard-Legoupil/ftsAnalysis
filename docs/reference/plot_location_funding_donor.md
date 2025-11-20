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
story <- generate_plot_story(p, max_tokens = 300)
#> Using model = "gemini-2.5-flash".
cat(story)
#> Burundi consistently faces complex humanitarian challenges, requiring sustained international support. This visualization sheds light on the critical financial contributions made by various donors to address these needs.
#> 
#> The data reveals a clear pattern: a significant portion of humanitarian funding for Burundi comes from a few key contributors. One major donor stands out, providing over $81 million, demonstrating an immense commitment to alleviating suffering in the country. While a broad base of other donors also contribute, many provide smaller, yet still valuable, sums.
#> 
#> This concentration of funding highlights the indispensable role of major donors in enabling large-scale humanitarian operations in Burundi. However, it also underscores a potential vulnerability – a heavy reliance on a limited number of sources. Sustained and predictable funding from these crucial partners, alongside continued efforts to diversify the donor base, remains vital to ensure that humanitarian organizations can effectively deliver life-saving assistance to the people of Burundi.
# and plot with more powerful subtitle
dubbed <- generate_plot_story(p)
#> Using model = "gemini-2.5-flash".
p + ggplot2::labs(subtitle = dubbed)
```
