# Donor-Destination Earmarking Flexibility

Computes a weighted average earmarking flexibility score for each
donor–destination pair. Higher values indicate more flexible (less
earmarked) funding.

## Usage

``` r
indicator_donor_destination_earmarking_flexibility(flows)
```

## Arguments

- flows:

  A dataframe containing `sourceObjects`, `destinationObjects`,
  `amountUSD`, and `grandBargainEarmarkingType`.

## Value

A tibble with `donor`, `destination`, `Earmarking_Flexibility`, and
`total_amount`.

## Details

Scoring:

- unearmarked = 1.00

- softly earmarked = 0.75

- earmarked = 0.50

- tightly earmarked = 0.25

The indicator helps understand donor behaviour: how flexible their
funding is across crisis-affected destinations.

## Examples

``` r
donor_destination <- indicator_donor_destination_earmarking_flexibility(flows)
#table(donor_destination$Earmarking_Flexibility)
donor_destination <- indicator_donor_destination_earmarking_flexibility(flows)

# ---- Select top donors & top destinations by total USD ----
top_donors <- donor_destination |>
  dplyr::group_by(donor) |>
  dplyr::summarise(total = sum(total_amount, na.rm = TRUE)) |>
  dplyr::arrange(desc(total)) |>
  dplyr::slice_head(n = 15)

top_destinations <- donor_destination |>
  dplyr::group_by(destination) |>
  dplyr::summarise(total = sum(total_amount, na.rm = TRUE)) |>
  dplyr::arrange(desc(total)) |>
  dplyr::slice_head(n = 15)

donor_destination_top15 <- donor_destination |>
  dplyr::filter(
    donor %in% top_donors$donor,
    destination %in% top_destinations$destination
  )

# (Optional) reorder factors for readability
donor_destination_top15 <- donor_destination_top15 |>
  dplyr::mutate(
    donor = factor(donor, levels = sort(unique(donor))),
    destination = factor(destination, levels = sort(unique(destination)))
  )

# ---- ggplot2 heatmap ----
ggplot2::ggplot(
  donor_destination_top15,
  ggplot2::aes(
    x = destination,
    y = donor,
    fill = Earmarking_Flexibility
  )
) +
  ggplot2::geom_tile(color = "white") +

  # Color-blind friendly scale
  viridis::scale_fill_viridis(
    name = "Flexibility",
    option = "viridis",      # color-blind friendly
    direction = 1,
    limits = c(0.25, 1.0),
    na.value = "grey80"
  ) +
  ggplot2::labs(
    title = "Donor–Destination Earmarking Flexibility
    (Top 15 Donors & Destinations)",
    subtitle = "Weighted average flexibility score 
    (1.0 = unearmarked → 0.25 = tightly earmarked)",
    x = "Destination Country",
    y = "Donor",
    caption = paste(
    "Indicator interpretation:",
    "Weighted average earmarking flexibility for donor-destination pairs 
    (1=unearmarked, 0.75=softly earmarked, 0.5=earmarked, 0.25=tightly earmarked).",
    "\n\n",
    
    "How to read the visualization:",
    "Heatmap shows flexibility patterns. Darker colors indicate more flexible 
    funding arrangements between specific donor-destination combinations.", 
    "\n\n",
    
    "Humanitarian relevance:",
    "Identifies which donors provide flexible funding to specific crises,
    enabling context-responsive programming and local decision-making.", "\n\n",
    
    "Source: Financial Tracking Service (FTS) API."
  )
  ) +
  unhcrthemes::theme_unhcr(grid = "Y", axis = "X", axis_title = FALSE) +
  ggplot2::theme(
    axis.text.x = ggplot2::element_text(angle = 45, hjust = 1),
    legend.position = "right",
    panel.grid = ggplot2::element_blank()
  )
```
