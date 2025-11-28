# Doc-4-Analysis

``` r
library(ftsAnalysis)
#> Registered S3 method overwritten by 'quantmod':
#>   method            from
#>   as.zoo.data.frame zoo
```

## Global

### analysis_wordcloud_from_flows

``` r
analysis_wordcloud_from_flows(flows, facet_by_year = FALSE)
```

``` r
# Returns a named list of word cloud objects
yearly_clouds <- analysis_wordcloud_from_flows(flows, facet_by_year = TRUE)
#> Warning in max(dataOut$freq): no non-missing arguments to max; returning -Inf
#> Warning in max(dataOut$freq): no non-missing arguments to max; returning -Inf
#> Warning in max(dataOut$freq): no non-missing arguments to max; returning -Inf
#> Warning in max(dataOut$freq): no non-missing arguments to max; returning -Inf
#> Warning in max(dataOut$freq): no non-missing arguments to max; returning -Inf

# To view the cloud for a specific year  
print(yearly_clouds[["2015"]])
print(yearly_clouds[["2024"]])
print(yearly_clouds[["2025"]])
```

### analysis_systemic_network_insights

``` r
result <- analysis_systemic_network_insights(flows)
#> Warning: Using `size` aesthetic for lines was deprecated in ggplot2 3.4.0.
#> ℹ Please use `linewidth` instead.
#> ℹ The deprecated feature was likely used in the ftsAnalysis package.
#>   Please report the issue at
#>   <https://github.com/edouard-legoupil/ftsAnalysis/issues>.
#> This warning is displayed once every 8 hours.
#> Call `lifecycle::last_lifecycle_warnings()` to see where this warning was
#> generated.
print(result$plot)
#> `geom_smooth()` using formula = 'y ~ x'
```

![](doc-4-analysis_files/figure-html/example-analysis_systemic_network_insights-1.png)

### analysis_prepare_opportunity_dataset

``` r
crisis_keywords = c("refugees", "refugee","displacement", "displaced",
                         "returnees","idps",
                        "protection", "conflict", "vulnerable")

result <- analysis_prepare_opportunity_dataset( flows,
    lookback_years = 3,
    crisis_keywords = crisis_keywords)
#> Warning: There was 1 warning in `dplyr::summarise()`.
#> ℹ In argument: `max_cluster_share = max(cluster_share, na.rm = TRUE)`.
#> ℹ In group 347: `donor = "European Commission's Humanitarian Aid and Civil
#>   Protection Department"`, `recipient = "Emergency Shelter and NFI"`, `year =
#>   2021`.
#> Caused by warning in `max()`:
#> ! no non-missing arguments to max; returning -Inf
print(result$plot)
#> Warning in ggplot2::scale_x_log10(labels = scales::label_number(scale_cut =
#> scales::cut_short_scale())): log-10 transformation introduced
#> infinite values.
#> Warning: Removed 6559 rows containing missing values or values outside the scale range
#> (`geom_point()`).
```

![](doc-4-analysis_files/figure-html/example-analysis_prepare_opportunity_dataset-1.png)

### analysis_fit_opportunity_model

``` r
features <- analysis_prepare_opportunity_dataset(flows)$data
#> Warning: There was 1 warning in `dplyr::summarise()`.
#> ℹ In argument: `max_cluster_share = max(cluster_share, na.rm = TRUE)`.
#> ℹ In group 347: `donor = "European Commission's Humanitarian Aid and Civil
#>   Protection Department"`, `recipient = "Emergency Shelter and NFI"`, `year =
#>   2021`.
#> Caused by warning in `max()`:
#> ! no non-missing arguments to max; returning -Inf
model_results <- analysis_fit_opportunity_model(features , min_year = NULL)
print(model_results$plot)
```

![](doc-4-analysis_files/figure-html/example-analysis_fit_opportunity_model-1.png)

## Donor or Recipient

### analysis_funding_forecast

Aggregate historical amounts by month and forecast future funding for a
donor or recipient.

``` r
result <- analysis_funding_forecast(flows,
                                     by = "donor", 
                                    name = "Germany")
print(result$plot)
```

![](doc-4-analysis_files/figure-html/example-analysis_funding_forecast-1.png)

## Recipient

### analysis_portfolio_scores

``` r
result <- analysis_portfolio_scores(flows, 
               recipient_name="United Nations High Commissioner for Refugees", 
                          top_n = 10)

print(result$plot)
```

![](doc-4-analysis_files/figure-html/example-analysis_portfolio_scores-1.png)

### analysis_donor_lifecycle_stage

``` r
result <- analysis_donor_lifecycle_stage(flows, 
             recipient_name= "United Nations High Commissioner for Refugees" )
print(result$plot)
```

![](doc-4-analysis_files/figure-html/example-analysis_donor_lifecycle_stage-1.png)

### analysis_donor_segmentation

``` r
result <- analysis_donor_segmentation(flows,
             recipient_name ="United Nations High Commissioner for Refugees" )
print(result$plot)
```

![](doc-4-analysis_files/figure-html/example-analysis_donor_segmentation-1.png)

### analysis_donor_network_metrics

``` r
result <- analysis_donor_network_metrics(flows,
               recipient_name = "United Nations High Commissioner for Refugees")
print(result$plot)
```

![](doc-4-analysis_files/figure-html/example-analysis_donor_network_metrics-1.png)

### analysis_competitive_intel_matrix

``` r
result <- analysis_competitive_intel_matrix(flows,
               recipient_name = "United Nations High Commissioner for Refugees",
                peers = NULL)
print(result$plot)
#> Warning: Removed 21 rows containing missing values or values outside the scale range
#> (`geom_point()`).
#> Warning: Removed 21 rows containing missing values or values outside the scale range
#> (`geom_text()`).
```

![](doc-4-analysis_files/figure-html/example-analysis_competitive_intel_matrix-1.png)
