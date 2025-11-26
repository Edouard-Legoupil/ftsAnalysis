# Fit a simple Funding Opportunity Model (logistic)

Fits a logistic regression to predict whether a donor will fund a
recipient in year t+1 based on features prepared by
`prepare_opportunity_dataset()`.

## Usage

``` r
analysis_fit_opportunity_model(features, min_year = NULL)
```

## Arguments

- features:

  Dataframe produced by
  [`analysis_prepare_opportunity_dataset()`](analysis_prepare_opportunity_dataset.md).

- min_year:

  Minimum year to use for training (filters older data).

## Value

A glm object (binomial) and the training frame (list with components
model, data).

## Details

Label construction: response = 1 if total_amount \> 0 in year t+1 for
same donor-recipient.

## Examples

``` r
features <- analysis_prepare_opportunity_dataset(flows)
#> Warning: There was 1 warning in `dplyr::summarise()`.
#> ℹ In argument: `max_cluster_share = max(cluster_share, na.rm = TRUE)`.
#> ℹ In group 347: `donor = "European Commission's Humanitarian Aid and Civil
#>   Protection Department"`, `recipient = "Emergency Shelter and NFI"`, `year =
#>   2021`.
#> Caused by warning in `max()`:
#> ! no non-missing arguments to max; returning -Inf
model_results <- analysis_fit_opportunity_model(features, min_year = NULL)
train_data <- model_results$train
model <- model_results$model
train_data$predicted_prob <- predict(model, newdata = train_data, type = "response")

ggplot2::ggplot(train_data, 
                ggplot2::aes(x = predicted_prob, fill = factor(opportunity))) +
  ggplot2::geom_density(alpha = 0.5) +
  ggplot2::scale_y_continuous(
      labels = scales::label_number(scale_cut = scales::cut_short_scale())
    ) +
  ggplot2::scale_x_continuous(
      labels = scales::label_number(scale_cut = scales::cut_short_scale())
    ) +
  ggplot2::labs(title = "Ability to forecast potential funding streams based on previous years",
    subtitle = "Comparing the probability score assigned by the model against the
    actual outcome \n (Funding Occurred = 1, No Funding = 0).",
       x = "Predicted Probability",
       fill = "Actual Opportunity",
    caption = paste0("The X-axis shows the **Predicted Probability**
    (a score from 0 to 1) that a donor will fund a recipient in the next year. 
    The two colored curves show the distribution of this score based on the 
    **Actual Outcome** for that relationship-year observation:  **Blue Curve
    (0: No Funding):** Represents relationships where the donor *did not* fund
    the recipient next year. Most of these probabilities should cluster near 0.
    **Red Curve (1: Funding Occurred):** Represents relationships where 
    the donor *did* fund the recipient next year. 
    Most of these probabilities should cluster near 1.",
    "\n\n",
    "**Data Source**: OCHA Financial Tracking Service (FTS) API.")) +
  unhcrthemes::theme_unhcr(grid = TRUE, axis =  TRUE, axis_title = TRUE, legend=TRUE)  
```
