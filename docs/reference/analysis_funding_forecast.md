# Aggregate historical amounts by month and forecast future funding for a donor or recipient.

Aggregate historical amounts by month and forecast future funding for a
donor or recipient.

## Usage

``` r
analysis_funding_forecast(flows, by = c("donor", "recipient"), name, h = 12)
```

## Arguments

- flows:

  Dataframe `flows`.

- by:

  Character: "donor" or "recipient" (which entity to forecast for).

- name:

  Character: name of donor or recipient to forecast.

- h:

  Integer: months to forecast ahead (default 12).

## Value

A list with components: ts (monthly ts), model (fitted ARIMA), forecast
(forecast object)

## Examples

``` r
result <- analysis_funding_forecast(flows,
                                     by = "donor", 
                                    name = "Germany")
print(result$plot)
```
