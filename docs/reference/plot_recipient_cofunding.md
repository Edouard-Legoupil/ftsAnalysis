# Plot Recipient Co-Funding Rate

Shows how often a recipient shares funding with other recipients for a
given donor. Useful to see multi-recipient funding trends.

## Usage

``` r
plot_recipient_cofunding(flows, recipient_name)
```

## Arguments

- flows:

  A dataframe of FTS funding flows.

- recipient_name:

  Recipient organization name to filter.

## Value

A ggplot object with co-funding rates.

## Examples

``` r
p <- plot_recipient_cofunding(flows, 
              recipient_name = "United Nations High Commissioner for Refugees")


# getting LLm story
story <- generate_plot_story(p, max_tokens = 300)
#> Using model = "gemini-2.5-flash".
cat(story)
#> This chart reveals the 'co-funding rate' for the United Nations High Commissioner for Refugees (UNHCR), illustrating the proportion of funding that supports UNHCR's work as part of multi-recipient projects.
#> 
#> Understanding this metric is vital for effective humanitarian action. A higher co-funding rate signifies a coordinated approach from donors, where funds are channeled to initiatives involving multiple humanitarian agencies, not just UNHCR in isolation. This collaborative funding model is crucial in complex crises, enabling a more integrated and holistic response to the needs of displaced populations.
#> 
#> Such shared funding can enhance efficiency, prevent duplication of efforts, and ensure that diverse expertise is brought to bear on multifaceted challenges. By supporting joint projects, donors reinforce the humanitarian community's capacity for collective action, ultimately leading to a more comprehensive and impactful delivery of aid to those most in need. Tracking these patterns helps us gauge the level of inter-agency cooperation and strategic investment in collaborative solutions.
# and plot with more powerful subtitle
dubbed <- generate_plot_story(p)
#> Using model = "gemini-2.5-flash".
p + ggplot2::labs(subtitle = dubbed)
```
