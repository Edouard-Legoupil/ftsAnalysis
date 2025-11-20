# Plot Recipient Funding by Contribution Type

Visualizes the split of funding received by a recipient based on
contribution type (e.g., financial or in-kind). Useful to assess funding
modality diversity.

## Usage

``` r
plot_recipient_contribution_type(flows, recipient_name)
```

## Arguments

- flows:

  FTS flows dataframe.

- recipient_name:

  Recipient organization name.

## Value

A ggplot object showing funding by contribution type.

## Examples

``` r
p <- plot_recipient_contribution_type(flows, 
                recipient_name = "United Nations High Commissioner for Refugees")


# getting LLm story
story <- generate_plot_story(p, max_tokens = 300)
#> Using model = "gemini-2.5-flash".
cat(story)
#> The United Nations High Commissioner for Refugees (UNHCR) relies heavily on global support to assist millions displaced by conflict and disaster. This visualization starkly reveals the dominant role of financial contributions in funding UNHCR's vital operations.
#> 
#> The agency receives nearly 900 times more funding in cash than in goods. Specifically, financial contributions represent the vast majority of the support, totaling over $1.4 billion, while in-kind aid amounts to just under $1.6 million.
#> 
#> This overwhelming preference for flexible financial funding provides UNHCR with crucial agility. Cash empowers the agency to respond effectively to evolving crises, procuring precise goods and services where they are most needed, often buying locally to support affected economies. While in-kind donations can be valuable, flexible financial support ensures resources are optimized to deliver tailored and timely assistance, protecting the world's most vulnerable with maximum efficiency.
# and plot with more powerful subtitle
dubbed <- generate_plot_story(p)
#> Using model = "gemini-2.5-flash".
p + ggplot2::labs(subtitle = dubbed)
```
