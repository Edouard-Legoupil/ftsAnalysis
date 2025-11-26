# 5-Visualisation

``` r
library(ftsAnalysis)
#> Registered S3 method overwritten by 'quantmod':
#>   method            from
#>   as.zoo.data.frame zoo
```

## clean_llm_response

``` r
response <- "<think>
First, I'm a humanitarian data visualization expert. My role includes extracting insights 
from visualizations, creating accessible narratives, highlighting patterns relevant to aid
efforts, using clear language with emotional resonance.
Aligning with constraints: Use plain language, be concise and impactful. Don't rehash 
every detail; build narrative depth around 2 key insights maximum in under 30 tokens.
</think>
This visualization tracks a relationship potentially critical for humanitarian logistics: 
higher fuel consumption versus increased weight. 车辆设计"
clean_llm_response(response)
#> [1] "This visualization tracks a relationship potentially critical for humanitarian logistics: higher fuel consumption versus increased weight."
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

generate_plot_story(p, provider = "ollama", model = "deepseek-r1")
#> [1] "This scatter plot maps efficiency against weight. We observe a strong correlation: generally, higher weight is associated with lower fuel economy. Points showing highly efficient models combined with relatively low \"weight\" are visible on one end. Conversely, we note two data points at very low mpg and high wt, highlighting particularly inefficient solutions for heavier needs scenarios requiring more resources. These outliers indicate potential gaps in our understanding of solution viability under demanding conditions. The tight clustering near higher efficiency suggests reliable performance across moderate need levels. However, the spread towards lower efficiency models signals challenges matching capability appropriately across all situations, especially heavy ones. This calls into question resource allocation strategies for major needs."

story <- generate_plot_story(p, provider = "azure", model = "gpt-4.1-mini", max_tokens = 300)
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
#>   Please report the issue at
#>   <https://github.com/edouard-legoupil/ftsAnalysis/issues>.
#> This warning is displayed once every 8 hours.
#> Call `lifecycle::last_lifecycle_warnings()` to see where this warning was
#> generated.

# getting LLm story
story <- generate_plot_story(p, provider = "azure", model = "gpt-4.1-mini", max_tokens = 300)
#cat(story)
# and plot with more powerful subtitle
dubbed <- generate_plot_story(p, provider = "azure", model = "gpt-4.1-mini")
print(p + ggplot2::labs(subtitle = dubbed))
```

![](5-visualisation_files/figure-html/example-plot_donor_funding_over_time-1.png)

The Government of Spains funding for humanitarian efforts shows a
striking recent shift. After a peak investment of over 10 million USD in
2022, contributions dramatically dropped to just under 1.5 million USD
in 2023. However, this dip appears to be a temporary pause before a
significant ramp-up, with pledged funds jumping to more than 50 million
USD for 2024 and further increasing to over 63 million USD in 2025. This
trend highlights Spains evolving commitment to global humanitarian
needs. The sharp decline in 2023 may reflect internal budget adjustments
or shifting priorities, but the substantial increase in subsequent years
signals a strong, renewed focus on supporting crisis response and
recovery efforts worldwide. For humanitarian planners and partners, this
pattern emphasizes the importance of preparing for a surge in available
resources from Spain over the next few years. It suggests opportunities
to enhance program scale and reach, particularly as funding levels are
projected to multiply fivefold after 2023. In short, Spains funding
trajectory reveals both a momentary contraction and a promising,
sustained expansion of support, underscoring the need for strategic
alignment to maximize the impact of these resources on vulnerable
populations.

## plot_donor_earmarking

``` r
p <- plot_donor_earmarking(flows, donor_name= "Spain, Government of")

# getting LLm story
story <- generate_plot_story(p, provider = "azure", model = "gpt-4.1-mini", max_tokens = 300)
# cat(story)
# and plot with more powerful subtitle
dubbed <- generate_plot_story(p, provider = "azure", model = "gpt-4.1-mini")
p + ggplot2::labs(subtitle = dubbed)
```

![](5-visualisation_files/figure-html/example-plot_donor_earmarking-1.png)

The funding profile from the Government of Spain reveals a clear
prioritization pattern in humanitarian aid allocations by earmarking
type. The largest share, over 71 million USD, is dedicated to the least
earmarked category, indicating Spains preference to provide flexible
funding that allows humanitarian actors to adapt resources where most
needed. This approach supports agile responses in volatile settings,
where rigidly earmarked funds could delay critical interventions. The
second largest portion, about 33 million USD, is more moderately
earmarked, suggesting Spain also values some targeted funding to
specific needs or sectors, balancing flexibility with strategic focus.
Smaller amountsaround 14 million and 5.4 million USDgo to more narrowly
defined earmarking types, reflecting a declining emphasis on restrictive
funding. These patterns highlight Spains intention to empower
humanitarian partners through flexible resources while still supporting
priority areas. For humanitarian planners and responders, this funding
distribution signals opportunities to align proposals with Spains
preferences for versatile aid, enhancing the impact of collaborative
efforts on the ground. Strengthening dialogues with Spain on earmarking
priorities could amplify funding effectiveness and adaptability in
crisis contexts.

## plot_donor_flowtype

``` r
p <- plot_donor_flowtype(flows, donor_name= "Spain, Government of")

# getting LLm story
story <- generate_plot_story(p, provider = "azure", model = "gpt-4.1-mini", max_tokens = 300)
# cat(story)
# and plot with more powerful subtitle
dubbed <- generate_plot_story(p, provider = "azure", model = "gpt-4.1-mini")
p + ggplot2::labs(subtitle = dubbed)
```

![](5-visualisation_files/figure-html/example-plot_donor_flowtype-1.png)

The Government of Spains humanitarian funding reveals a clear focus in
its allocation strategy. The flow type distribution shows a striking
disparity: while one category received a modest contribution of about
287,000 USD, another flow type dominates with over 124 million USD in
funding. This suggests Spain prioritizes specific forms of aid or
interventions, potentially those with larger operational scale or
longer-term impact. This concentration of resources in one flow type may
reflect targeted responses to urgent crises or strategic investments in
particular regions or sectors. However, the relatively small amount
allocated to the other flow type highlights a risk of underfunding
complementary or emerging needs that might be critical in a
comprehensive humanitarian response. For decision-makers and partners,
this insight signals two key actions: first, to assess the effectiveness
and reach of the dominant funding flow to ensure optimal impact; second,
to consider whether the lesser-funded flow requires increased support to
address overlooked gaps. Balancing these funding flows could enhance
overall humanitarian outcomes, ensuring Spains contributions are both
strategic and inclusive in a rapidly evolving global humanitarian
landscape.

## plot_donor_cluster_coverage

``` r
p <- plot_donor_cluster_coverage(flows, donor_name= "Spain, Government of")

# getting LLm story
story <- generate_plot_story(p, provider = "azure", model = "gpt-4.1-mini", max_tokens = 300)
# cat(story)
# and plot with more powerful subtitle
dubbed <- generate_plot_story(p, provider = "azure", model = "gpt-4.1-mini")
p + ggplot2::labs(subtitle = dubbed)
```

![](5-visualisation_files/figure-html/example-plot_donor_cluster_coverage-1.png)

The data reveals how the Government of Spain allocates its humanitarian
funding across different clusters, measured by the number of financial
flows. Notably, a few clusters receive significantly higher engagement.
One cluster stands out prominently with 42 flows, indicating a major
focus area likely critical to Spains humanitarian priorities. Two other
clusters also show elevated attention with 26 and 21 flows respectively,
suggesting strategic investment in these areas as well. In contrast,
several clusters receive minimal flows, with some only seeing one or two
financial inputs. This uneven distribution highlights prioritization but
also potential gaps where funding is sparse. For decision-makers, this
pattern implies opportunities to reassess the balance of support to
ensure a comprehensive and effective humanitarian response tailored to
evolving global needs. Overall, Spains funding patterns reflect targeted
interventions with concentrated efforts in select clusters, signaling
where Spains government may be leveraging its influence for maximum
humanitarian impact. Yet, the relatively narrow focus also underlines
the importance of ongoing evaluation to prevent neglect in less-funded
sectors and optimize overall aid effectiveness.

## plot_recipient_funding_composition

``` r
p <- plot_recipient_funding_composition(flows, 
              recipient_name = "United Nations High Commissioner for Refugees")

# getting LLm story
story <- generate_plot_story(p, provider = "azure", model = "gpt-4.1-mini", max_tokens = 300)
# cat(story)
# and plot with more powerful subtitle
dubbed <- generate_plot_story(p, provider = "azure", model = "gpt-4.1-mini")
p + ggplot2::labs(subtitle = dubbed)
```

![](5-visualisation_files/figure-html/example-plot_recipient_funding_composition-1.png)

The funding composition for the United Nations High Commissioner for
Refugees (UNHCR) reveals critical insights into the scale and diversity
of financial support it receives from various donor organizations. The
visualization orders donors by the total amount contributed, showing a
substantial range in funding levels. Notably, a small number of donors
provide the majority of funding, with the top contributors donating tens
of millions to over 160 million USD. This concentration of funding
highlights both the strong commitment of key donors and the
vulnerability of UNHCRs financial stability should any major donor
reduce their support. The data underscores the importance of maintaining
and expanding partnerships with diverse donors to ensure more balanced,
reliable funding streams. Such diversification can enhance UNHCR’s
capacity to respond effectively to global displacement crises,
guaranteeing sustained humanitarian assistance across regions and
populations. For executive decision-makers, this calls for strategic
engagement with existing large donors while actively cultivating
emerging funders to secure long-term resilience in humanitarian funding.

## plot_recipient_grandbargain

``` r
p <- plot_recipient_grandbargain(flows,
          recipient_name = "United Nations High Commissioner for Refugees")
#> Scale for y is already present.
#> Adding another scale for y, which will replace the existing scale.

# getting LLm story
story <- generate_plot_story(p, provider = "azure", model = "gpt-4.1-mini", max_tokens = 300)
# cat(story)
# and plot with more powerful subtitle
dubbed <- generate_plot_story(p, provider = "azure", model = "gpt-4.1-mini")
p + ggplot2::labs(subtitle = dubbed)
```

![](5-visualisation_files/figure-html/example-plot_recipient_grandbargain-1.png)

The data reveals critical insights into how funding to the United
Nations High Commissioner for Refugees (UNHCR) is allocated under the
Grand Bargain agreement, distinguishing between earmarked and
non-earmarked support. Notably, the largest portion of funding, over 500
million USD, falls into one specific type of earmarkingpotentially
indicating targeted but restricted use. In contrast, non-earmarked or
less strictly designated funding amounts to significantly less, around
131 million USD, highlighting a considerable reliance on conditional
contributions. This imbalance suggests that while donors are committing
substantial resources, they often come with strings attached, limiting
the flexibility UNHCR has in responding to evolving humanitarian needs
on the ground. Earmarked funding can improve transparency and
accountability but may reduce the agencys ability to allocate funds
where they are most urgently needed. For humanitarian leaders and
policymakers, this underscores the importance of advocating for more
flexible, non-earmarked funding streams to enhance UNHCRs operational
agility and improve timely assistance delivery. In summary, while
overall funding to UNHCR is substantial, the predominance of earmarked
funding challenges the organizations capacity to respond dynamically to
refugee crises. Strengthening efforts to increase non-earmarked
contributions could be a strategic priority to maximize the impact of
humanitarian aid.

## plot_recipient_cofunding

``` r
p <- plot_recipient_cofunding(flows, 
              recipient_name = "United Nations High Commissioner for Refugees")


# getting LLm story
story <- generate_plot_story(p, provider = "azure", model = "gpt-4.1-mini", max_tokens = 300)
# cat(story)
# and plot with more powerful subtitle
dubbed <- generate_plot_story(p, provider = "azure", model = "gpt-4.1-mini")
p + ggplot2::labs(subtitle = dubbed)
```

![](5-visualisation_files/figure-html/example-plot_recipient_cofunding-1.png)

The data highlights the co-funding dynamics for the United Nations High
Commissioner for Refugees (UNHCR), focusing on the proportion of funding
that comes from multiple donors. Specifically, it shows two categories:
one with zero shared funding and another fully shared, indicating
multi-recipient contributions. The critical insight here is the presence
of a substantial proportion of funding that is entirely co-funded,
meaning multiple donors are contributing together to UNHCRs initiatives.
This pattern reflects strong collaboration, which is essential for
pooling resources and maximizing the impact of humanitarian programs
supporting refugees globally. Conversely, the category with zero shared
funding points to funds provided by single donors. While important, such
funding may limit the scope for resource coordination and risk
spreading. For decision-makers, this data suggests the value of
promoting co-funding mechanisms, which can enhance the scale and
effectiveness of the humanitarian response. Encouraging more donors to
participate in shared funding could improve flexibility and reduce
duplication, ultimately strengthening UNHCRs ability to respond to
refugee crises efficiently. In summary, fostering multi-donor
partnerships should be a priority to sustain and expand humanitarian
assistance for displaced populations worldwide.

## plot_recipient_contribution_type

``` r
p <- plot_recipient_contribution_type(flows, 
                recipient_name = "United Nations High Commissioner for Refugees")


# getting LLm story
story <- generate_plot_story(p, provider = "azure", model = "gpt-4.1-mini", max_tokens = 300)
# cat(story)
# and plot with more powerful subtitle
dubbed <- generate_plot_story(p, provider = "azure", model = "gpt-4.1-mini")
p + ggplot2::labs(subtitle = dubbed)
```

![](5-visualisation_files/figure-html/example-plot_recipient_contribution_type-1.png)

6 The data reveals a significant imbalance in the funding received by
the United Nations High Commissioner for Refugees (UNHCR), with a vast
majority of contributions provided as financial resources rather than
in-kind donations. Specifically, over 1.16 billion US dollars have been
contributed financially, while in-kind contributions amount to just over
1.3 million dollars. This stark contrast highlights a reliance on
monetary donations, which offer flexibility for UNHCR to allocate funds
quickly and effectively across diverse humanitarian needsfrom shelter
and food to legal assistance. However, the relatively minimal in-kind
support suggests there may be underutilized opportunities for donors to
provide direct goods and services that could enhance operational
efficiency or address specific, tangible needs on the ground. For
decision-makers, this insight underscores the importance of sustaining
and possibly increasing financial contributions to maintain UNHCRs
capacity to respond swiftly. At the same time, exploring ways to
encourage and streamline in-kind contributions could diversify resource
flows, potentially strengthening the overall humanitarian response.
Promoting a balanced approach might improve resilience and better serve
displaced populations worldwide.

## plot_destination_funding_destination

``` r
p <- plot_destination_funding_destination(flows, destination_name= "Burundi")

# getting LLm story
story <- generate_plot_story(p, provider = "azure", model = "gpt-4.1-mini", max_tokens = 300)
# cat(story)
# and plot with more powerful subtitle
dubbed <- generate_plot_story(p, provider = "azure", model = "gpt-4.1-mini")
p + ggplot2::labs(subtitle = dubbed)
```

![](5-visualisation_files/figure-html/example-plot_destination_funding_destination-1.png)

The funding landscape for humanitarian efforts in Burundi reveals a
striking concentration of financial support among a few key donors. One
donor stands out overwhelmingly, contributing over 80 million USD,
dwarfing the next largest contributors who have provided funding in the
range of five to seven million USD. Beyond these top contributors,
funding sharply declines, with several donors contributing amounts below
half a million USD, and some even less than 100,000 USD. This pattern
indicates a heavy reliance on a small number of major donors to drive
Burundi’s humanitarian response. While this ensures significant
resources are available, it also exposes the response to risks if any
major donor reduces support. The limited diversity in funding sources
underscores the need to broaden donor engagement and explore new
partnerships to build a more resilient funding base. For
decision-makers, this calls for strategic outreach to emerging donors
and efforts to strengthen coordination among contributing partners.
Increasing the donor pool will enhance financial stability, enabling
sustained and effective humanitarian interventions that respond to
Burundis urgent needs.

## plot_destination_funding_donor

``` r
p <- plot_destination_funding_donor(flows, destination_name= "Burundi")

# getting LLm story
story <- generate_plot_story(p, provider = "azure", model = "gpt-4.1-mini", max_tokens = 300)
# cat(story)
# and plot with more powerful subtitle
dubbed <- generate_plot_story(p, provider = "azure", model = "gpt-4.1-mini")
p + ggplot2::labs(subtitle = dubbed)
```

![](5-visualisation_files/figure-html/example-plot_destination_funding_donor-1.png)

The data on funding for humanitarian efforts in Burundi reveals a highly
uneven distribution of donor contributions. While most donors provide
modest amounts, one donor stands out by contributing over 80 million
USD, significantly surpassing all others. This single, dominant funding
source plays a critical role in sustaining relief and development
programs in Burundi. Two other donors also contribute substantial
amounts, around 5 to 6 million USD each, but the majority of donors
provide less than 600,000 USD each. This concentration of funding
highlights a vulnerability: the humanitarian response in Burundi depends
heavily on a very limited number of donors. Any reduction in their
support could severely impact ongoing operations. This pattern calls for
urgent diversification of funding. Engaging more donors and increasing
financial commitments from smaller contributors is essential to build a
more resilient support system. Strengthening the funding base will help
ensure continuous assistance for Burundi’s vulnerable populations facing
ongoing challenges.

## plot_destination_heatmap

``` r
p <- plot_destination_heatmap(flows, destination_name= "Burundi", top_n = 5)

# getting LLm story
story <- generate_plot_story(p, provider = "azure", model = "gpt-4.1-mini", max_tokens = 300)
# cat(story)
# and plot with more powerful subtitle
dubbed <- generate_plot_story(p, provider = "azure", model = "gpt-4.1-mini")
p + ggplot2::labs(subtitle = dubbed)
```

![](5-visualisation_files/figure-html/example-plot_destination_heatmap-1.png)

This analysis highlights the top five donor organizations supporting
humanitarian efforts in Burundi, revealing critical funding patterns
that inform response priorities. The data shows distinct funding flows,
with certain donors channeling significant resources to specific
recipient entities. The visualizations use of color intensity signals
varying total USD amounts, underlining that a few key donors contribute
the bulk of financial support. This concentration suggests reliance on
major donors, which may expose vulnerabilities if funding priorities
shift. Moreover, the chart exposes a diversified recipient landscape in
Burundi, indicating multiple organizations receiving aid, each
potentially addressing different humanitarian sectors or geographic
areas. This distribution emphasizes the complexity and breadth of needs,
from emergency relief to development interventions. For executives,
these insights underscore the importance of sustaining and broadening
the donor base to mitigate risks of funding shortfalls, while
encouraging coordination among recipients to maximize impact. Strategic
engagement with lead donors and enhancing transparency in fund
allocation can strengthen response effectiveness and resilience in
Burundis humanitarian landscape.

## plot_funding_status_timeline

``` r
p <- plot_funding_status_timeline(flows)

# getting LLm story
story <- generate_plot_story(p, provider = "azure", model = "gpt-4.1-mini", max_tokens = 300)
# cat(story)
# and plot with more powerful subtitle
dubbed <- generate_plot_story(p, provider = "azure", model = "gpt-4.1-mini")
p + ggplot2::labs(subtitle = dubbed)
```

![](5-visualisation_files/figure-html/example-plot_funding_status_timeline-1.png)

The funding timeline from 2020 through 2026 reveals a significant and
accelerating increase in pledged and committed resources for
humanitarian efforts globally. Pledged funding, representing announced
resources, shows a dramatic rise from roughly 45 million USD in 2021 to
over 2.7 billion USD projected for 2025, indicating growing donor
promises amid increasing global needs. Committed funding, reflecting
resources formally allocated, follows a similar upward trend, surging
from 34 million USD in 2020 to nearly 8.9 billion USD anticipated in
2025. This gap between pledged and committed figures in recent years
underscores progress in turning donor intentions into tangible funding,
but also highlights the importance of tracking commitments closely to
ensure pledges are fulfilled. Paid amounts, the actual disbursed funds,
remain very low in comparison, consistently under 6 million USD
annually. This lag between commitment and payment suggests a critical
bottleneck, potentially delaying frontline response and assistance
delivery. For humanitarian executives, this pattern signals encouraging
donor engagement but raises urgent questions about the pace of fund
disbursement. To maximize impact, efforts must focus on accelerating
payment mechanisms to bridge the gap between commitments and actual aid
delivery. Timely funding is crucial to respond effectively to evolving
crises and save lives on the ground.

## generate_report

``` r
#generate_report(type = "donor")
```
