# Filter and Normalize FTS Funding Flows for Indicator Computation

This utility function applies the standard set of preprocessing and
filtering rules required when computing donor-, recipient-, or
destination-level indicators from FTS (Financial Tracking Service)
funding flow data.

## Usage

``` r
filter_flows_for_indicators(flows)
```

## Arguments

- flows:

  A tibble or dataframe containing FTS funding flows, with at minimum
  the following columns:

  - `boundary`: classification of flow direction relative to a search
    boundary

  - `childFlowIds`: list-column of IDs of downstream child flows

  - `flowType`: flow categorization ("Carryover", "Parked", "Pass
    through", "Standard")

  - `budgetYear`: year of budget attribution (character, factor, or
    numeric)

## Value

A tibble of cleaned and normalized flows suitable for all donor-,
recipient-, destination-, and donor→recipient indicator functions. The
returned dataset contains only incoming, non-parent, non-parked flows
with numeric budget years.

## Details

The FTS data model contains several elements—such as funding chains,
boundaries, parent/child flows, and "parked" envelopes—that must be
normalized prior to any aggregation. This function enforces the official
FTS logic to ensure indicators are computed without double-counting or
misclassification of funding flows.

**Key filtering rules applied:**

### 1. Boundary Filtering

Only **incoming** flows are retained. Incoming flows represent funding
entering a boundary (e.g., affected country + year, appeal,
donor-country-year). This is the standard FTS method for calculating
donor contributions, and prevents contamination from:

- Internal flows (money moving within the boundary)

- Outgoing flows (money leaving the boundary)

- Irrelevant flows (fully outside the boundary)

Boundary filtering ensures that only flows relevant to the selected
analytical scope enter the indicator dataset.

### 2. Parent/Child Flow Deduplication

FTS allows funding flows to be "chained" to represent cascading funding
(donor → agency → partner). Parent flows are typically high-level
envelopes; child flows represent operational allocations.

This function:

- Identifies parents by the presence of one or more `childFlowIds`.

- Removes all parent flows from the dataset.

This prevents double-counting parent envelopes together with their child
breakdowns and ensures only operational flows are used in indicator
calculations.

### 3. Removal of "Parked" Flows

Flows with `flowType == "Parked"` represent undecided envelopes awaiting
breakdown into child flows (e.g., large ECHO decisions or multi-year
envelopes).

These should not be used for:

- donor funding totals

- donor–recipient relationships

- sector or geographic alignment indicators

The function removes them entirely, relying instead on their child flows
when available.

### 4. Budget Year Normalization

The `budgetYear` column is converted safely to numeric to support
time-series indicators such as:

- funding trends

- relationship duration

- consistency indices

Non-numeric and malformed values are converted to `NA` with warnings
suppressed.

## Warning

This function removes parent flows and parked envelopes by design. If
users require indicators specifically about envelope-level commitments,
they should apply a custom filter before calling this function.

## Examples

``` r
#cleaned <- filter_flows_for_indicators(flows)
```
