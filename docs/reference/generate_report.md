# Generate Quarto HTML / PDF Country Factsheets in Batch

This function renders the 'Country_Factsheet' Quarto template for a list
of countries, generating a report file for each.

## Usage

``` r
generate_report(type = "donor", name = NULL)
```

## Arguments

- type:

  either donor recipient or destination.

- name:

  name of donor recipient or destination if NULL batch process them

## Value

nothing, reports are generated in the specified folder.

## Examples

``` r
#generate_report(type = "donor")
```
