# Plot Recipient Funding Composition by Donor

Shows how a specific recipient organization’s funding is distributed
across donors. Useful for assessing donor diversification and reliance.

## Usage

``` r
plot_recipient_funding_composition(flows, recipient_name)
```

## Arguments

- flows:

  A dataframe of humanitarian funding flows (FTS format).

- recipient_name:

  The name of the recipient organization to filter.

## Value

A ggplot object showing donor shares of recipient funding.

## Examples

``` r
p <- plot_recipient_funding_composition(flows, 
              recipient_name = "United Nations High Commissioner for Refugees")

# getting LLm story
story <- generate_plot_story(p, max_tokens = 300)
#> Using model = "gemini-2.5-flash".
cat(story)
#> The United Nations High Commissioner for Refugees (UNHCR), a frontline agency in protecting displaced populations, relies on a vast network of support to carry out its life-saving mission. This visualization highlights the varied funding composition for UNHCR, illustrating where its financial strength originates.
#> 
#> The data reveals that UNHCR receives contributions from a diverse range of donor organizations. While a few key donors provide substantial financial backing, sometimes in the hundreds of millions of dollars (e.g., over $230 million from a single donor), a multitude of other organizations also contribute, ranging from millions down to thousands of dollars.
#> 
#> This mixed funding model is critical for UNHCR's operational capacity. Large, consistent contributions enable the agency to plan and execute extensive humanitarian operations, providing shelter, food, water, and protection to millions of refugees globally. Simultaneously, the broad base of smaller donations signifies a widespread commitment from various stakeholders, enhancing resilience and demonstrating a collective global responsibility towards those forced to flee their homes. This diverse support ensures UNHCR can respond to emergencies, sustain long-term programs, and advocate for durable solutions for the world's most vulnerable.
# and plot with more powerful subtitle
dubbed <- generate_plot_story(p)
#> Using model = "gemini-2.5-flash".
p + ggplot2::labs(subtitle = dubbed)
```
