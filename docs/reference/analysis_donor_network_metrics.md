# Donor-Destination Network Metrics

Builds a bipartite donor -\> destination network from flows, filtered to
include only flows directed to the specified `recipient_name`. Computes
node centrality measures (degree, betweenness, eigenvector) for the
involved donors and destinations.

## Usage

``` r
analysis_donor_network_metrics(flows, recipient_name = NULL, top_n = 20)
```

## Arguments

- flows:

  Dataframe `flows`.

- recipient_name:

  Character: The name of the specific recipient/destination to analyze.

- top_n:

  Optional integer: restricts the network to top_n donors and top_n
  destinations by amount *within the filtered flows* for readability.

## Value

A list with components: graph (igraph object), donor_metrics (tibble),
destination_metrics (tibble)

## Examples

``` r
recipient_name <-  "United Nations High Commissioner for Refugees"
network_metrics <- analysis_donor_network_metrics(flows, recipient_name)

g <- network_metrics$graph

# Create a data frame for nodes, including the calculated degree
nodes_df_all <- tibble::tibble(name = igraph::V(g)$name) |>
  dplyr::mutate(
    # Get the type property added in the original setup
    type = ifelse(name %in% network_metrics$donor_metrics$donor, 
                  "Donor", "Destination"),
    # Calculate degree for sizing and labeling
    degree = igraph::degree(g, v = name)
  )

# --- Prepare Node Data AND Compute Coordinates 
# Create the layout object first to get the coordinates (x, y)
layout_data <- ggraph::create_layout(g,
 layout = "fr") # Fruchterman-Reingold  General networks
# layout = "circle")
# layout = "kk")  #Kamada-Kawai  Small to medium networks 
# layout = "dr") #  Davidson-Harel  Finding a minimum-energy state; 

# Filter the layout data to only include the nodes of interest, 
# ensuring all necessary columns (x, y, name, type, degree) are present.
nodes_df_all_coords <- layout_data |>
  dplyr::as_tibble() |>
  dplyr::left_join(
    nodes_df_all |> dplyr::select(name, type, degree), 
    by = "name"
  ) |>
  dplyr::filter(!is.na(type)) # Filter out any non-donor/non-destination nodes 

# --- Ggraph Plot ---
ggraph::ggraph(layout_data) + # Use the layout_data object here

  # EDGES: Use geom_edge_fan (works seamlessly with layout_data)
  ggraph::geom_edge_fan(ggplot2::aes(alpha = weight), 
                        alpha = 0.3, 
                        width = 0.5, 
                        show.legend = FALSE) +

  ggraph::geom_node_point(
    ggplot2::aes(color = nodes_df_all_coords$type[match(name, 
                                                    nodes_df_all_coords$name)],
                              size = nodes_df_all_coords$degree[match(name,
                                                    nodes_df_all_coords$name)]),
                          alpha = 0.6) +

  # --- label ---
  ggrepel::geom_label_repel(
    data = nodes_df_all_coords, 
    ggplot2::aes(x = x, y = y, label = name, color = type), 
    inherit.aes = FALSE,
    size = 2.5,
    force = 2,
    max.overlaps = Inf,
    box.padding = 0.4,
    segment.color = 'grey80',
    show.legend = FALSE) +
  ggplot2::scale_size_continuous(range = c(2, 15), name = "Degree") +
  ggplot2::scale_color_manual(values = c("Donor" = "#007BFF",
                                         "Destination" = "#FFC300"), 
                              name = "Node Type") +

  ggplot2::labs(
    title = paste0("Funding Network for ", recipient_name),
    subtitle = "Node size reflects Degree (number of destination).",
    caption = "Data Source: OCHA Financial Tracking Service (FTS) API. 
    Layout: Fruchterman-Reingold."
  ) +
  ggraph::theme_graph(
    background = "white",
    base_family = "sans"
  )

```
