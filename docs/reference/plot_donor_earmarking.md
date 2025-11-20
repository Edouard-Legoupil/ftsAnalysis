# Plot Donor Funding by Earmarking Type

Visualizes the proportion of funding per earmarking type (Unearmarked,
Softly earmarked, etc.) for a selected donor. Helps understand donor
flexibility and restrictions.

## Usage

``` r
plot_donor_earmarking(flows, donor_name)
```

## Arguments

- flows:

  A dataframe of humanitarian funding flows (FTS format).

- donor_name:

  Donor organization name to filter.

## Value

A ggplot object showing donor funding by earmarking type.

## Examples

``` r
p <- plot_donor_earmarking(flows, donor_name= "Spain, Government of")

# getting LLm story
story <- generate_plot_story(p, max_tokens = 300)
#> Using model = "gemini-2.5-flash".
cat(story)
#> The Government of Spain plays a crucial role in humanitarian action, and this chart reveals how their funding is strategically distributed across different earmarking types. The insights show a clear preference for a particular funding mechanism.
#> 
#> A dominant share of Spain's humanitarian support, over €76 million, is directed towards a single earmarking type. This significant allocation often indicates funding with greater flexibility, a highly valued resource for humanitarian organizations. Flexible funding empowers aid agencies to quickly adapt to rapidly changing crises, allocate resources where needs are most critical, and cover underfunded emergencies.
#> 
#> While this primary category leads, Spain also provides substantial support to other earmarking types, including over €33 million to another significant category, and additional amounts to more specific initiatives. This diversified approach ensures support for a range of humanitarian interventions. Spain's distribution of funds, particularly the large flexible component, strengthens the ability of humanitarian partners to deliver timely and effective assistance to those most in need worldwide.
# and plot with more powerful subtitle
dubbed <- generate_plot_story(p)
#> Using model = "gemini-2.5-flash".
p + ggplot2::labs(subtitle = dubbed)
```
