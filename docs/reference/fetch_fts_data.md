# Fetch FTS Flow Data with Pagination

Retrieves FTS flow data for a specified year, handling API pagination to
pull all available results, not just the first page.

## Usage

``` r
fetch_fts_data(year = 2023, limit = 1000)
```

## Format

A data frame with funding flow records containing the following
variables:

## Source

FTS (Financial Tracking Service) database

## Arguments

- year:

  Integer. Year to fetch data for (default: 2023).

- limit:

  Integer. Maximum number of flows per page (API max: 1000).

## Value

Data frame of all FTS flows for the specified criteria.#' A dataset
containing funding flow information from the FTS database.

## Identifiers

- id:

  character Unique identifier for this row, to be used when there are
  updates to the same funding record

- versionId:

  character Version identifier

- childFlowIds:

  character The FTS database allows funding flows to be linked together
  to represent funding cascading through the implementation chain from
  primary donors to field implementers. When flows are chained together
  in this way, any flow downstream of the flow being viewed is referred
  to as a child flow. All child flows have a parent flow upstream.

- parentFlowId:

  character The FTS database allows funding flows to be linked together
  to represent funding cascading through the implementation chain from
  primary donors to field implementers. When flows are chained together
  in this way, any flow upstream of the flow being viewed is referred to
  as the parent flow. All parent flows have one or more child flows
  downstream.

- flowType:

  factor Type of flow with levels: "Carryover", "Parked", "Pass
  through", "Standard"

- refCode:

  character A code related to the grant agreement of the fund, ideally
  known by the donor and recipient organizations

## Report Details

- reportDetails:

  list containing:

  - `sourceType`

  - `organization`

  - `reportChannel`

  - `date`

## Flow Description

- description:

  character Brief description of the destination activity/project,
  location within the country, and duration

- grandBargainEarmarkingType:

  character Modality of earmarking (Earmarked, Softly earmarked, Tightly
  earmarked, Unearmarked)

- contributionType:

  character Type of contribution: "financial" or "in-kind"

- reportingStatus:

  character Status of the humanitarian fund reported per row: "New
  Contribution", "Top-up/Update", "Old Contribution"

- newMoney:

  logical TRUE/FALSE indicating if this is new money

- keywords:

  character Keywords associated with the flow

- method:

  character Assistance modality: "Cash Transfer Programming (CTP)" or
  "Traditional"

- boundary:

  character Boundary classification: "incoming", "internal", "outgoing"

- onBoundary:

  logical Indicator if the flow is on the boundary

- status:

  character Status of humanitarian funding: "pledge", "commitment",
  "paid"

## Quantity

- amountUSD:

  numeric Total Amount in US\$

- fullParkedAmountUSD:

  numeric Full parked amount in US\$

- originalAmount:

  numeric Original amount in the original currency

- originalCurrency:

  character Original currency of the humanitarian fund reported

- exchangeRate:

  numeric Exchange rate used for conversion. If blank, FTS uses the UN
  Operational Exchange Rate as of the grant decision date

## Date

- budgetYear:

  integer Year in which the funding will be used. FTS works in calendar
  year system (January to December)

- date:

  Date Date when submitted to FTS

- decisionDate:

  Date Date of the grant agreement signing or official endorsement by
  the donor member state

- firstReportedDate:

  Date First reported date

- createdAt:

  Date Record creation date

- updatedAt:

  Date Record last update date

## Source

- sourceObjects:

  list containing source information with:

  - `id` - Source identifier

  - `name` - Source name

  - `type` - Source type: "Organization" (Source Organisation),
    "Location" (Location of source organisation), "UsageYear"

## Destination

- destinationObjects:

  list containing destination information with:

  - `id` - Destination identifier

  - `name` - Destination name

  - `type` - Destination type: "Cluster" (technical area in specific
    coordinated plan), "GlobalCluster" (global technical area),
    "Location" (where emergency is addressed), "Plan" (Destination
    Plan/Appeal), "UsageYear", "Organization" (Recipient Organisation)

  - `behavior` - Behavior when multiple records of same type: "single"
    or "shared"

  - For type "Organization", additional variables:

    - `organizationTypes`

    - `organizationSubTypes`

    - `organizationLevels`

## Flow Type Details

- Carryover:

- Parked:

  A 'parked' flow refers to a funding flow that initially may not be
  allocated to specific organizations or sectors, but for which
  additional information is forthcoming. 'Parked' funding is usually a
  parent flow with a number of linked child flows. Parking a parent flow
  allows the children to reflect the source information from the linked
  parent. Parked records are either major funding decisions (e.g. ECHO
  decisions that begin as a large funding envelope without destination
  organizations) where the information on recipients is determined at a
  later time (and added as child flows), or multi-year funding records
  where yearly contributions are broken down as child flows of the
  'parked' flow.

- Pass through:

  Pass-through funding refers to downstream funding allocations (e.g.
  Donor to UN Agency to NGO, Donor to International NGO to Local NGO,
  etc.)

- Standard:

## Grand Bargain Earmarking Types

- Unearmarked:

  - A: Fully flexible core contribution - Financial contribution to the
    aid organisation budget, fully flexible (within the boundaries set
    in mandates, governing body regulations etc.)

  - B: Fully flexible core contribution to the CERF - Financial
    contribution to CERF budget, fully flexible within the CERF
    regulations.

  - C: Core contribution - Financial contribution to a significant part
    of the aid organisation's mandate, e.g. restricted to the
    humanitarian operations of a double-mandated organisation. The aid
    organisation can be instructed to distribute at its discretion - on
    several strategic objectives/regions/crises to avoid the entire
    contribution being used in one context.

- Softly earmarked:

  - D: Core contribution with limitations - Financial contribution, but
    with exclusions pertaining to a small number of specific countries.
    The aid organisation can be instructed to only use funding outside
    of certain areas or countries.

  - E: Directed to a geographical region or a strategic objective -
    Financial contribution, fully flexible within the boundaries of the
    strategic objective (e.g. health or education) or region (e.g.
    Africa). Should reflect priorities in the Strategic Plan approved by
    the relevant governing body.

  - F: Directed to a Country-Based Pooled Fund - Financial contribution
    directed to a specific Country-Based Pooled Fund, otherwise fully
    flexible.

- Earmarked:

  - G: Directed to an aid organisation's country operations - Financial
    contribution, directed to a specific country, otherwise fully
    flexible. Should reflect priorities set by the relevant governing
    body regarding country operations.

  - H: Directed to subobjective/target - Financial contribution,
    directed to subcategories of strategic objectives, e.g.
    health/malaria or education /teacher training, but without
    geographical limitations. Should reflect priorities in the Strategic
    Plan approved by the relevant governing body.

- Tightly earmarked:

  - I: Directed to a specific project - Financial contribution directed
    to a specific project in a specific country.

  - J: Directed geographically and thematically, tied financial -
    Financial contribution, tied to certain conditions in terms of
    purchase restrictions, directed to a specific country/region and to
    a specific objective. For instance, financial contribution for
    purchase of ABC for school feeding in X-land.

  - K: Directed geographically and thematically, in kind - In-kind
    contribution directed to a specific country/region and to a specific
    objective. For instance, rice for school feeding in X-land.

  - L: Donor-initiated projects/directed contributions - Financial
    contribution coupled with the demand for a specific project in a
    specific country fulfilling donor priorities. Not reflecting
    Strategic Plan of the aid organisation. For instance, it becomes a
    service provider. This will also put strain on non-project support
    costs (overhead costs).

## Reporting Status

- New Contribution:

  The fund is being reported to FTS by the same reporter for the first
  time

- Top-up/Update:

  The fund was reported to FTS by the same reporter and now there is an
  update on the amount and/or on any other details

- Old Contribution:

  The fund was reported to FTS by the same reporter and there is no
  change. Used when reporters share cumulative reports

## Method

- Cash Transfer Programming (CTP):

  Refers to all programs where cash (or vouchers for goods or services)
  is directly provided to beneficiaries. The CTP can be of three types:
  cash, mobile phone transfer and vouchers.

- Traditional:

  Non-cash assistance provided in the form of materials or services
  (i.e. food, tents, PSS, secondment of staff). FTS refers to all other
  humanitarian assistance modalities as traditional aid.

## Boundary

Boundaries classify relevant flows into the categories incoming,
internal and outgoing. The FTS database records flows of funding, and
draws boundaries around (combinations of) flow properties to calculate
totals. Examples of common boundaries are a response plan/appeal or a
combination of a (donor or affected) country and a year. Drawing a
boundary classifies the flows in the database into those crossing the
boundary inward (incoming flows), those originating and terminating
within the boundary (internal flows), those crossing it outwards
(outgoing flows), and a fourth category that is not displayed - those
that are irrelevant to the boundary because they originate and terminate
outside of it.

- incoming:

  Flows which cross a given search boundary inwards. If the boundary is
  e.g. an affected country and year, flows originating in donor
  countries or multilateral organisations attributed to the country are
  incoming flows, as is carry-over from a previous year. To avoid
  double-counting, incoming flows should never be added to internal
  flows.

- internal:

  Flows originating and terminating within the boundary

- outgoing:

  Flows which originate within and terminate outside a given search
  boundary. If the boundary is e.g. an affected country and year, flows
  representing carry-overs to the next year are outgoing flows.

## Status

- pledge:

  A non-binding announcement of an intended contribution or allocation
  by the donor. The recipient organization and response plan or project
  are not necessarily specified. As soon as a commitment is reported to
  FTS against a pledge, the amount in the pledge column is reduced
  accordingly. FTS tables therefore show the 'outstanding' (not 'total
  original') pledge amount. The information is reported to us directly
  by donors and agencies and may or may not include verbal commitments
  made at pledging conferences.

- commitment:

  A binding agreement signed between parties OR approval of a grant by
  the donor member state. Creation of a contractual obligation regarding
  funding between the donor and appealing agency; almost always takes
  the form of a signed contract. This is the crucial stage of
  humanitarian funding: agencies cannot spend money and implement before
  a funding commitment is made.

- paid:

  The money transfer has been realized. FTS does not track
  disbursements/installments.

## Examples

``` r
# flows <- fetch_fts_data(year = 2025)
# 
# names(flows)
# dplyr::glimpse(flows)
# nrow(flows)
# head(flows,1)
# 
# #sinew::makeOxygen(flows, add_fields = "source")
# ## Saving it in the package to avoid constnat API Call
# save(flows, file =  here::here("data","flows.RData"))
# # Note: significantly better compression could be obtained
# #by using R CMD build --resave-data
# tools::resaveRdaFiles(here::here("data","flows.RData"),compress="bzip2")
```
