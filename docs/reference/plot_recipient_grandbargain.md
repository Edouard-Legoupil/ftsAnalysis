# Plot Grand Bargain Earmarking by Recipient

Visualizes the proportion of funding earmarked under the Grand Bargain
commitments for each recipient. Helps to assess how much funding aligns
with international humanitarian reform commitments.

## Usage

``` r
plot_recipient_grandbargain(flows, recipient_name)
```

## Arguments

- flows:

  FTS flows dataframe.

- recipient_name:

  Recipient organization name.

## Value

A ggplot object showing the split of earmarked vs non-earmarked funding.

## Examples

``` r
p <- plot_recipient_grandbargain(flows,
          recipient_name = "United Nations High Commissioner for Refugees")
#> Scale for y is already present.
#> Adding another scale for y, which will replace the existing scale.

# getting LLm story
story <- generate_plot_story(p, max_tokens = 300)
#> Using model = "gemini-2.5-flash".
cat(story)
#> The United Nations High Commissioner for Refugees (UNHCR) plays a critical role in assisting millions displaced globally, and the nature of its funding is paramount to its effectiveness. A key principle of the Grand Bargain, an agreement among major humanitarian donors and organizations, is to enhance funding flexibility to better meet evolving needs.
#> 
#> This visualization provides a crucial insight into how UNHCR receives its financial support, illustrating the distribution of earmarked (restricted) versus non-earmarked (flexible) contributions. The distinct columns, representing hundreds of millions of dollars, showcase the substantial financial streams flowing to UNHCR. While some funds are specifically designated by donors for particular projects or regions, other contributions offer greater flexibility.
#> 
#> The ability for UNHCR to access flexible, non-earmarked funding is vital. It allows the agency to adapt swiftly to new crises, allocate resources to underfunded emergencies, and address the most urgent priorities for refugees and displaced populations worldwide without the delays inherent in seeking new approvals for restricted funds. Understanding this distribution is key to assessing UNHCR's operational agility and its overall humanitarian impact.
# and plot with more powerful subtitle
dubbed <- generate_plot_story(p)
#> Using model = "gemini-2.5-flash".
p + ggplot2::labs(subtitle = dubbed)
```
