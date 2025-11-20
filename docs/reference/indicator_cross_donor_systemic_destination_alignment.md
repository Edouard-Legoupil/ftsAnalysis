# Donors Systemic: Destination Alignment (Optimized)

Calculates pairwise Jaccard similarity between donors based on their
funded destinations (locations or clusters). This indicates overlap or
convergence in geographic or thematic focus.

## Usage

``` r
indicator_cross_donor_systemic_destination_alignment(flows)
```

## Arguments

- flows:

  A dataframe including at least `sourceObjects` and
  `destinationObjects` as nested data frames.

## Value

A tibble with columns:

- donor1:

  First donor in the pair.

- donor2:

  Second donor in the pair.

- Destination_Alignment:

  Jaccard similarity (0–1) of destinations.

## Details

Goal: Measures how many destinations are common between donors relative
to their total unique destinations, producing a 0–1 index.

The function works as follows:

1.  Filters flows using
    [`filter_flows_for_indicators()`](filter_flows_for_indicators.md) to
    remove flows that should not be included (e.g., parked parents,
    pass-throughs, out-of-boundary flows).

2.  Unnests `sourceObjects` and `destinationObjects`, keeping only
    donors and valid destination types (`Cluster`, `GlobalCluster`,
    `Location`).

3.  Creates a list of destinations for each donor.

4.  Computes Jaccard similarity between all unique donor pairs using
    precomputed lists, avoiding repeated filtering.

5.  Returns a tibble with `donor1`, `donor2`, and
    `Destination_Alignment`.

## Examples

``` r
# Compute alignment
alignment <- indicator_cross_donor_systemic_destination_alignment(flows)

# Viz
library(ggplot2)
library(dplyr)
#> 
#> Attaching package: ‘dplyr’
#> The following objects are masked from ‘package:stats’:
#> 
#>     filter, lag
#> The following objects are masked from ‘package:base’:
#> 
#>     intersect, setdiff, setequal, union


# Compute total funding per donor
top_donors <- flows |>
  tidyr::unnest(sourceObjects, names_sep = "_") |>
  dplyr::filter(sourceObjects_type == "Organization") |>
  dplyr::rename(donor = sourceObjects_name) |>
  dplyr::group_by(donor) |>
  dplyr::summarise(total_funding = sum(amountUSD, na.rm = TRUE),
                   .groups = "drop") |>
  dplyr::arrange(desc(total_funding)) |>
  dplyr::slice_head(n = 15) |>
  dplyr::pull(donor)

# Filter alignment to top donors
alignment_top <- alignment |>
  dplyr::filter(donor1 %in% top_donors, donor2 %in% top_donors) |>
    dplyr::mutate(
      donor1 = stringr::str_wrap(donor1, width = 40),
      donor2 = stringr::str_wrap(donor2, width = 40)
    )

# Prepare data for ggplot
plot_df <- alignment_top |>
  dplyr::mutate(
    donor1 = factor(donor1),
    donor2 = factor(donor2)
  )

# Heatmap
ggplot(plot_df, aes(x = donor2, y = donor1, fill = Destination_Alignment)) +
  geom_tile(color = "white") +
  scale_fill_viridis_c(option = "plasma", na.value = "grey80", limits = c(0, 1)) +
  unhcrthemes::theme_unhcr(grid = FALSE, axis =  FALSE, axis_title = FALSE, legend=TRUE) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(
    title = "Top 15 Donors to Destination Alignment",
    x = "Donor 2",
    y = "Donor 1",
    fill = "Jaccard\nSimilarity",
    caption = paste(
    "Indicator interpretation:",
    "Jaccard similarity measuring overlap in funded locations/clusters 
    between donor pairs (0 = no overlap, 1 = identical destination portfolios).",
    "\n\n",
    
    "How to read the visualization:",
    "Heatmap shows pairwise alignment. Dark colors indicate high 
    geographic/thematic overlap, light colors indicate complementary coverage.",
    "\n\n",
    
    "Humanitarian relevance:",
    "Identifies donor clusters with similar focus areas, helping coordinate 
    advocacy and avoid duplication in under-funded crises.", "\n\n",
    
    "Source: Financial Tracking Service (FTS) API."
  )
  )

```
