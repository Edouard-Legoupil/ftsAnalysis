# FTS Humanitarian Funding Flows Dataset

A comprehensive dataset of humanitarian funding flows from the UN OCHA
Financial Tracking Service (FTS). Contains detailed records of funding
contributions, allocations, and implementation chains across global
humanitarian responses. The data captures the entire funding lifecycle
from pledges to disbursements, including donor behaviors, recipient
patterns, and strategic funding characteristics.

## Usage

``` r
flows
```

## Format

A data frame with 22441 rows and 29 variables:

- `id`:

  character Unique identifier for each funding flow record, used for
  tracking updates and modifications to the same funding entry over time

- `amountUSD`:

  integer Total funding amount in US dollars, representing the
  standardized value for cross-donor comparison

- `fullParkedAmountUSD`:

  integer Complete parked amount in US dollars for flows that are
  temporarily held without specific allocation

- `budgetYear`:

  character Calendar year (January-December) in which the funding is
  planned to be utilized, following FTS's calendar year system

- `childFlowIds`:

  list List of downstream funding flow identifiers representing cascaded
  funding through implementation chains; child flows receive allocations
  from parent flows

- `contributionType`:

  character Type of humanitarian contribution: "financial" for monetary
  transfers or "in-kind" for goods and services

- `createdAt`:

  character Timestamp indicating when the funding flow record was
  initially created in the FTS database

- `date`:

  character Date when the funding information was submitted to FTS by
  the reporting organization

- `decisionDate`:

  character Date of grant agreement signing between donor and recipient,
  or official endorsement by donor member state - marks the commitment
  point

- `description`:

  character Detailed description of the funded activity/project,
  including location context, intervention details, and implementation
  timeframe

- `grandBargainEarmarkingType`:

  list Classification of funding flexibility according to Grand Bargain
  categories: Unearmarked (A-C), Softly earmarked (D-F), Earmarked
  (G-H), Tightly earmarked (I-L)

- `exchangeRate`:

  double Currency conversion rate applied to transform original amount
  to USD; uses UN Operational Exchange Rate if not specified

- `firstReportedDate`:

  character Initial date when the funding flow was first reported to
  FTS, used for tracking reporting history

- `flowType`:

  character Classification of flow structure: "Carryover" (previous year
  funds), "Parked" (temporarily unallocated), "Pass through" (cascaded
  funding), "Standard" (direct allocation)

- `keywords`:

  list Thematic tags and categorical labels associated with the funding
  flow for search and analysis purposes

- `newMoney`:

  logical Indicator of whether the funding represents new resources
  (TRUE) versus reallocated or reprofiled existing funds (FALSE)

- `originalAmount`:

  double Funding amount in the original currency before conversion to
  USD

- `originalCurrency`:

  character Currency in which the funding was originally provided or
  committed

- `method`:

  character Modality of assistance delivery: "Cash Transfer Programming
  (CTP)" (cash, mobile, vouchers) or "Traditional" (in-kind
  goods/services)

- `parentFlowId`:

  integer Identifier of the upstream funding flow from which this flow
  originates; used to trace funding through implementation chains

- `status`:

  character Funding lifecycle stage: "pledge" (non-binding intent),
  "commitment" (binding agreement), "paid" (disbursed funds)

- `updatedAt`:

  character Timestamp of the most recent modification to the funding
  flow record

- `versionId`:

  integer Version number tracking sequential updates and revisions to
  the funding flow information

- `sourceObjects`:

  list Nested data structure containing donor/origin information with
  components: id (identifier), name (source name), type
  (Organization/Location/UsageYear - indicating funding source year)

- `destinationObjects`:

  list Nested data structure containing recipient/allocation information
  with components: id, name, type
  (Cluster/GlobalCluster/Location/Plan/UsageYear/Organization), behavior
  (single/shared breakdown), and organization metadata (types, subtypes,
  levels) for organizational recipients

- `boundary`:

  character Classification of flow direction relative to analysis
  boundaries: "incoming" (crossing inward), "internal" (within
  boundary), "outgoing" (crossing outward)

- `onBoundary`:

  character Additional specification of boundary relationship for
  complex flow categorization

- `reportDetails`:

  list Reporting metadata containing: sourceType (information origin),
  organization (reporting entity), reportChannel (submission method),
  date (reporting date)

- `refCode`:

  character Grant agreement or reference code used by donors and
  recipients for administrative tracking and reconciliation

## Source

<https://fts.unocha.org/>
