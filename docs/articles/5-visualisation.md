# 5-Visualisation

``` r
library(ftsAnalysis)
```

## generate_plot_story

``` r

library(ggplot2)
p <- ggplot(mtcars, aes(x = wt, y = mpg)) +
   geom_point() +
    unhcrthemes::theme_unhcr(grid = "Y", axis = "X", axis_title = FALSE) +
   labs(title = "Vehicle Efficiency",
        subtitle = "Fuel consumption vs weight",
        caption = "Source: mtcars dataset")

story <- generate_plot_story(p)
#> Using model = "gemini-2.5-flash".
cat(story)
#> Heavier vehicles consume more fuel. In humanitarian aid, optimizing fleet efficiency stretches resources further, delivering vital support to more people.
# To use as subtitle:
p + ggplot2::labs(subtitle = story)
```

![](5-visualisation_files/figure-html/example-generate_plot_story-1.png)

## plot_donor_funding_over_time

``` r
p <- plot_donor_funding_over_time(flows, donor_name= "Spain, Government of")
#> Warning: Using `size` aesthetic for lines was deprecated in ggplot2 3.4.0.
#> ℹ Please use `linewidth` instead.
#> ℹ The deprecated feature was likely used in the ftsAnalysis package.
#>   Please report the issue to the authors.
#> This warning is displayed once every 8 hours.
#> Call `lifecycle::last_lifecycle_warnings()` to see where this warning was
#> generated.

# getting LLm story
story <- generate_plot_story(p, max_tokens = 300)
#> Using model = "gemini-2.5-flash".
cat(story)
#> **Spain's Evolving Humanitarian Commitment: A Rising Tide of Support**
#> 
#> The Government of Spain has demonstrated a dynamic and ultimately escalating commitment to global humanitarian action, with significant funding increases marked in recent years. After an initial contribution of approximately €10.1 million in 2022, there was a temporary dip to €1.5 million in 2023.
#> 
#> However, this was swiftly followed by a powerful resurgence of support. Spain's humanitarian funding soared to over €50 million in 2024, marking a substantial fivefold increase from its 2022 levels. This upward trajectory is projected to continue, with an even more robust contribution of nearly €65 million anticipated in 2025.
#> 
#> This remarkable growth in funding from the Spanish government is a critical lifeline for humanitarian operations globally. It signifies a deepening resolve to address crises, ensure essential aid reaches vulnerable populations, and strengthen the collective capacity to alleviate human suffering worldwide.
# and plot with more powerful subtitle
dubbed <- generate_plot_story(p)
#> Using model = "gemini-2.5-flash".
print(p + ggplot2::labs(subtitle = dubbed))
#> Warning: Removed 1 row containing missing values or values outside the scale range
#> (`geom_col()`).
#> Warning: Removed 1 row containing missing values or values outside the scale range
#> (`geom_line()`).
#> Warning: Removed 1 row containing missing values or values outside the scale range
#> (`geom_point()`).
```

![](5-visualisation_files/figure-html/example-plot_donor_funding_over_time-1.png)

## plot_donor_earmarking

``` r
p <- plot_donor_earmarking(flows, donor_name= "Spain, Government of")

# getting LLm story
story <- generate_plot_story(p, max_tokens = 300)
#> Using model = "gemini-2.5-flash".
cat(story)
#> The Government of Spain is a vital donor to humanitarian efforts, and this visualization reveals how its contributions are allocated across different earmarking types. The data shows a distinct pattern: a substantial portion of funding is directed towards specific areas (the largest category exceeding €76 million), while other crucial needs receive significantly less (the smallest category just over €8 million).
#> 
#> This distribution highlights the delicate balance between donor priorities and operational flexibility. While earmarking allows Spain to strategically target funds, it can inadvertently limit the agility of humanitarian organizations on the ground. When funds are heavily earmarked, responders may struggle to quickly reallocate resources to emerging crises, unforeseen challenges, or neglected areas that don't fit a specific funding mandate.
#> 
#> For effective humanitarian action, particularly in dynamic and unpredictable emergencies, flexible funding is paramount. It empowers aid workers to adapt to evolving needs, address urgent gaps, and ensure resources reach the most vulnerable populations wherever they are. While earmarked contributions are valuable, a balance that includes more flexible support is crucial for a truly agile and responsive global humanitarian system.
# and plot with more powerful subtitle
dubbed <- generate_plot_story(p)
#> Using model = "gemini-2.5-flash".
p + ggplot2::labs(subtitle = dubbed)
```

![](5-visualisation_files/figure-html/example-plot_donor_earmarking-1.png)

## plot_donor_flowtype

``` r
p <- plot_donor_flowtype(flows, donor_name= "Spain, Government of")

# getting LLm story
story <- generate_plot_story(p, max_tokens = 300)
#> Using model = "gemini-2.5-flash".
cat(story)
#> The Government of Spain is a committed donor to humanitarian action, but a closer look at its funding mechanisms reveals a highly focused strategy.
#> 
#> The vast majority of Spain's humanitarian contributions, a substantial **$132.7 million**, are channeled through a single, dominant flow type. This significant allocation highlights a primary pipeline for their aid, suggesting a consistent and robust approach to supporting critical humanitarian needs through a specific, established mechanism.
#> 
#> In stark contrast, other flow types receive comparatively minimal funding. One secondary flow type accounts for approximately **$286,700**, while a third registers a negligible **$3**. This distribution indicates a clear prioritization in how Spain's humanitarian aid is dispersed, concentrating resources heavily on one main avenue to deliver impact. Understanding these funding pathways is key to optimizing the effectiveness of Spanish aid in reaching vulnerable populations.
# and plot with more powerful subtitle
dubbed <- generate_plot_story(p)
#> Using model = "gemini-2.5-flash".
p + ggplot2::labs(subtitle = dubbed)
```

![](5-visualisation_files/figure-html/example-plot_donor_flowtype-1.png)

## plot_donor_cluster_coverage

``` r
p <- plot_donor_cluster_coverage(flows, donor_name= "Spain, Government of")

# getting LLm story
story <- generate_plot_story(p, max_tokens = 300)
#> Using model = "gemini-2.5-flash".
cat(story)
#> The Government of Spain demonstrates a broad commitment to humanitarian aid, channeling support across numerous critical humanitarian clusters.
#> 
#> However, this support is not uniformly distributed. The data reveals a clear prioritization, with one particular humanitarian cluster (ID 17) receiving a significantly higher number of funding flows – 46 instances of support. This suggests a consistent focus or a critical area of need for Spanish humanitarian assistance.
#> 
#> Several other clusters also benefit from substantial engagement, with between 18 and 30 funding flows each. In contrast, some clusters receive fewer contributions, ranging from just 1 to 5 flows. This diverse pattern highlights Spain's varied approach to humanitarian action, strategically concentrating efforts in certain areas while maintaining wider coverage where needed.
# and plot with more powerful subtitle
dubbed <- generate_plot_story(p)
#> Using model = "gemini-2.5-flash".
p + ggplot2::labs(subtitle = dubbed)
```

![](5-visualisation_files/figure-html/example-plot_donor_cluster_coverage-1.png)

## plot_recipient_funding_composition

``` r
p <- plot_recipient_funding_composition(flows, 
              recipient_name = "United Nations High Commissioner for Refugees")

# getting LLm story
story <- generate_plot_story(p, max_tokens = 300)
#> Using model = "gemini-2.5-flash".
cat(story)
#> The United Nations High Commissioner for Refugees (UNHCR) plays a critical role in protecting and assisting millions of forcibly displaced people worldwide. This visualization offers a crucial look into the funding composition that empowers UNHCR's humanitarian operations, highlighting contributions from various donor organizations.
#> 
#> The data reveals that while a broad spectrum of donors supports UNHCR, a significant portion of its funding comes from a concentrated group of major contributors. One leading donor alone stands out with over $230 million in contributions, with several others providing tens of millions of dollars. These substantial commitments form the financial bedrock for UNHCR's extensive global response.
#> 
#> Alongside these large contributions, the chart also shows numerous smaller, yet collectively vital, funding streams. This mix of significant and modest donations is essential for UNHCR's capacity to deliver timely assistance, from providing emergency shelter and food to advocating for the rights of refugees. Understanding this funding landscape is key to ensuring sustained, predictable resources for an organization at the forefront of responding to escalating humanitarian crises.
# and plot with more powerful subtitle
dubbed <- generate_plot_story(p)
#> Using model = "gemini-2.5-flash".
p + ggplot2::labs(subtitle = dubbed)
```

![](5-visualisation_files/figure-html/example-plot_recipient_funding_composition-1.png)

## plot_recipient_grandbargain

``` r
p <- plot_recipient_grandbargain(flows,
          recipient_name = "United Nations High Commissioner for Refugees")
#> Scale for y is already present.
#> Adding another scale for y, which will replace the existing scale.

# getting LLm story
story <- generate_plot_story(p, max_tokens = 300)
#> Using model = "gemini-2.5-flash".
cat(story)
#> The Grand Bargain, a critical initiative in humanitarian financing, seeks to improve the efficiency and effectiveness of aid by encouraging greater flexibility in funding. For agencies like the United Nations High Commissioner for Refugees (UNHCR), this means increasing the share of non-earmarked, predictable contributions that allow them to respond to crises with agility and foresight.
#> 
#> This visualization, detailing the distribution of earmarked versus non-earmarked funding for UNHCR, reveals that flexible funding remains a significant challenge. While precise categories are not labeled, the data clearly shows a substantial portion of UNHCR's support comes with specific conditions. The largest funding segment, exceeding $650 million, likely represents tightly earmarked contributions, dwarfing what appears to be the most flexible funding category, which is only around $128 million.
#> 
#> This imbalance highlights a key tension in humanitarian response. While donors often earmark funds to ensure accountability and track specific outcomes, this practice can inadvertently hinder UNHCR's ability to allocate resources where needs are most urgent, pivot to sudden emergencies, or support underfunded, protracted crises. To truly realize the Grand Bargain's vision and empower UNHCR to protect and assist vulnerable populations effectively, a greater commitment to unearmarked and softly earmarked funding is essential, enabling quicker, more adaptive, and ultimately more impactful humanitarian action.
# and plot with more powerful subtitle
dubbed <- generate_plot_story(p)
#> Using model = "gemini-2.5-flash".
p + ggplot2::labs(subtitle = dubbed)
```

![](5-visualisation_files/figure-html/example-plot_recipient_grandbargain-1.png)

## plot_recipient_cofunding

``` r
p <- plot_recipient_cofunding(flows, 
              recipient_name = "United Nations High Commissioner for Refugees")


# getting LLm story
story <- generate_plot_story(p, max_tokens = 300)
#> Using model = "gemini-2.5-flash".
cat(story)
#> This visualization illuminates the varied landscape of funding for the UN Refugee Agency (UNHCR), specifically focusing on its involvement in "multi-recipient" funding. These are crucial funds distributed among several humanitarian partners, often signaling a coordinated and collaborative response to complex crises.
#> 
#> The data reveals that UNHCR's co-funding rate isn't consistently high. While in some instances, UNHCR receives funding as a sole recipient, suggesting independent projects, other examples show 100% of the funding coming as part of a joint effort. This spectrum, from fully independent to highly collaborative funding, prompts important questions about the strategic choices and operational contexts influencing these differences. Maximizing multi-recipient funding can significantly enhance the efficiency, reduce duplication, and strengthen the collective impact of humanitarian aid for refugees worldwide.
# and plot with more powerful subtitle
dubbed <- generate_plot_story(p)
#> Using model = "gemini-2.5-flash".
p + ggplot2::labs(subtitle = dubbed)
```

![](5-visualisation_files/figure-html/example-plot_recipient_cofunding-1.png)

## plot_recipient_contribution_type

``` r
p <- plot_recipient_contribution_type(flows, 
                recipient_name = "United Nations High Commissioner for Refugees")


# getting LLm story
story <- generate_plot_story(p, max_tokens = 300)
#> Using model = "gemini-2.5-flash".
cat(story)
#> The United Nations High Commissioner for Refugees (UNHCR) plays a vital role in protecting and assisting millions displaced worldwide. This visualization offers a clear insight into how this crucial work is funded, highlighting the significant preference for financial contributions over in-kind support.
#> 
#> Our data shows a staggering difference: UNHCR receives over \$1.4 billion in direct financial contributions compared to approximately \$1.5 million in in-kind donations. This means for nearly every dollar received in tangible goods or services, the agency receives roughly a thousand dollars in cash.
#> 
#> This overwhelming reliance on financial aid provides UNHCR with critical flexibility. Monetary contributions enable the agency to procure precisely what's needed, when and where it's needed most – whether that's emergency shelter, food, medical care, or protection services. While all support is valued, this strong financial backing ensures agile, efficient, and adaptable responses to the complex and ever-changing needs of the world's most vulnerable populations.
# and plot with more powerful subtitle
dubbed <- generate_plot_story(p)
#> Using model = "gemini-2.5-flash".
p + ggplot2::labs(subtitle = dubbed)
```

![](5-visualisation_files/figure-html/example-plot_recipient_contribution_type-1.png)

## plot_location_funding_destination

``` r
p <- plot_location_funding_destination(flows, location_name= "Burundi")

# getting LLm story
story <- generate_plot_story(p, max_tokens = 300)
#> Using model = "gemini-2.5-flash".
cat(story)
#> Burundi's humanitarian response relies heavily on international support, and this visualization clearly illustrates the origins of that crucial funding. The data reveals a highly concentrated donor landscape, with one particular donor standing out as the overwhelmingly largest contributor.
#> 
#> This single donor provides a substantial majority of all reported humanitarian funds for Burundi. While several other partners also contribute millions of dollars, and numerous smaller donors provide valuable assistance, the reliance on a few major sources is evident.
#> 
#> This funding structure is critical for addressing urgent needs such as food insecurity, health crises, and displacement among vulnerable populations in Burundi. However, such a concentrated donor base also highlights a potential vulnerability; shifts in the priorities or capacity of these major contributors could significantly impact the continuity and scale of life-saving operations for the Burundian people.
# and plot with more powerful subtitle
dubbed <- generate_plot_story(p)
#> Using model = "gemini-2.5-flash".
p + ggplot2::labs(subtitle = dubbed)
```

![](5-visualisation_files/figure-html/example-plot_location_funding_destination-1.png)

## plot_location_funding_donor

``` r
p <- plot_location_funding_donor(flows, location_name= "Burundi")

# getting LLm story
story <- generate_plot_story(p, max_tokens = 300)
#> Using model = "gemini-2.5-flash".
cat(story)
#> Burundi's humanitarian efforts depend on the generosity of its international partners. This visualization reveals the landscape of funding contributions, showing a clear disparity among donors.
#> 
#> One major donor stands out, providing over $81 million in critical support. This substantial contribution forms the backbone of the humanitarian response in Burundi. While other donors also contribute significantly, with several providing multi-million dollar sums, their individual contributions are considerably smaller than the largest one.
#> 
#> Beneath these larger figures, numerous other donors provide essential, albeit smaller, amounts, demonstrating a broad commitment to Burundi's needs. This funding pattern highlights a reliance on a few key funders, particularly the largest. Ensuring diverse and sustained support from all partners remains crucial to address ongoing humanitarian challenges and build resilience for the people of Burundi.
#> 
#> Source: OCHA Financial Tracking Service (Flow API)
# and plot with more powerful subtitle
dubbed <- generate_plot_story(p)
#> Using model = "gemini-2.5-flash".
p + ggplot2::labs(subtitle = dubbed)
```

![](5-visualisation_files/figure-html/example-plot_location_funding_donor-1.png)

## plot_location_heatmap

``` r
p <- plot_location_heatmap(flows, location_name= "Burundi", top_n = 5)

# getting LLm story
story <- generate_plot_story(p, max_tokens = 300)
#> Using model = "gemini-2.5-flash".
cat(story)
#> For humanitarian efforts in Burundi, understanding the funding landscape is vital. This visualization offers a critical snapshot of the direct financial pathways, tracing aid from the top 5 donor organizations to their direct recipients on the ground.
#> 
#> By mapping these specific, organization-level flows, we gain crucial clarity on who is funding whom. This transparency is essential for several reasons: it strengthens accountability for aid delivery, helps identify key partnerships, and highlights the distribution of resources within the humanitarian ecosystem. Such detailed insight allows for better strategic planning, enabling donors and implementing partners to coordinate more effectively, minimize overlaps, and ensure that assistance efficiently reaches vulnerable populations in Burundi. This visualization reveals the intricate backbone of the humanitarian response.
# and plot with more powerful subtitle
dubbed <- generate_plot_story(p)
#> Using model = "gemini-2.5-flash".
p + ggplot2::labs(subtitle = dubbed)
```

![](5-visualisation_files/figure-html/example-plot_location_heatmap-1.png)

## plot_funding_status_timeline

``` r
p <- plot_funding_status_timeline(flows)

# getting LLm story
story <- generate_plot_story(p, max_tokens = 300)
#> Using model = "gemini-2.5-flash".
cat(story)
#> This visualization tracks the journey of humanitarian funding from initial promises to actual delivery, revealing a critical challenge. While global humanitarian needs continue to rise, so do the *pledges* and *commitments* made by donors, particularly in recent years and projected into the near future. We observe substantial sums being committed, indicating a willingness to support.
#> 
#> However, a stark disparity emerges when we look at the *paid funding*. Actual disbursements remain significantly lower than the pledged and committed amounts. This widening gap suggests a bottleneck in the funding pipeline. For example, while billions are pledged and committed for 2024 and 2025, only a fraction has been paid out.
#> 
#> This translates directly into delays in essential aid reaching people in crisis. Pledges and commitments, while crucial, do not feed the hungry or provide shelter. The insights from this timeline underscore the urgent need for faster, more efficient conversion of promises into tangible financial flows. Bridging this gap is vital to ensure that humanitarian assistance can be delivered effectively and on time to those who need it most.
# and plot with more powerful subtitle
dubbed <- generate_plot_story(p)
#> Using model = "gemini-2.5-flash".
p + ggplot2::labs(subtitle = dubbed)
#> Warning: Removed 3 rows containing missing values or values outside the scale range
#> (`geom_line()`).
#> Warning: Removed 3 rows containing missing values or values outside the scale range
#> (`geom_point()`).
```

![](5-visualisation_files/figure-html/example-plot_funding_status_timeline-1.png)
