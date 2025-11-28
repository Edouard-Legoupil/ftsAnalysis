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
result <- analysis_donor_network_metrics(flows,
               recipient_name = "United Nations High Commissioner for Refugees")
print(result$plot)
```
