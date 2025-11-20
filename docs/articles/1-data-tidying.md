# 1-Data Tidying

``` r
library(ftsAnalysis)
```

FTS focuses on humanitarian funding flows that is provided
internationally. The exception is in-country provision of funds (whether
from private or governmental sources) for projects in an appeal launched
by an international organisation or organisations.

Data does not include:

- a government’s expenditure on crises within its own borders (except
  the in-country provision of funds whether from private or government
  sources, for projects in a response plan or appeal launched by an
  international organization)
- a government’s expenditure on refugees within its own borders
- development data (except where funding has been reported for projects
  in an inter-agency response plan or appeal)
- concessional finance and soft loans
- remittances.

## fetch_fts_data

Below is a description of the type of variables on `flows` data -

### Identifiers

- `id` the unique identifier for this row, to be used in the future when
  there is an update on the same funding for this row.

- `versionId`

- `childFlowIds` The FTS database allows funding flows to be linked
  together to represent funding cascading through the implementation
  chain from primary donors to field implementers. When flows are
  chained together in this way, any flow downstream of the flow being
  viewed is referred to as a child flow. All child flows have a parent
  flow upstream.

- `parentFlowId` The FTS database allows funding flows to be linked
  together to represent funding cascading through the implementation
  chain from primary donors to field implementers. When flows are
  chained together in this way, any flow upstream of the flow being
  viewed is referred to as the parent flow. All parent flows have one or
  more child flows downstream.

- `flowType` factor with the following levels “Carryover” “Parked” “Pass
  through” “Standard”

  - A `parked` flow refers to a funding flow that initially may not be
    allocated to specific organizations or sectors, but for which
    additional information is forthcoming. ‘Parked’ funding is usually a
    parent flow (see glossary for parent flow) with a number of linked
    child flows. Parking a parent flow allows the children to reflect
    the source information from the linked parent. Parked records are
    either major funding decisions (e.g. ECHO decisions that begin as a
    large funding envelope without destination organizations) where the
    information on recipients is determined at a later time (and added
    as child flows), or multi-year funding records where yearly
    contributions are broken down as child flows of the ‘parked’ flow.

  - `Pass through` funding refers to downstream funding allocations
    (e.g. Donor to UN Agency to NGO, Donor to International NGO to Local
    NGO, etc.).

- `refCode` a code related to the grant agreement of the fund, ideally
  known by the donor and by the recipient organizations.

- `reportDetails` list of the following variables  
  `sourceType` `organization` `reportChannel` `date`

### Flow Description

- `description` the description briefly; ie. about the destination
  activity/project, location within the country, and duration.

- `grandBargainEarmarkingType` modality of earmarking (Earmarked, Softly
  earmarked, tightly earmarked, unearmarked)
  <https://fts.unocha.org/glossary>

  **Unearmarked**

  - A Fully flexible core contribution Financial contribution to the aid
    organisation budget, fully flexible (within the boundaries set in
    mandates, governing body regulations etc.)  
  - B Fully flexible core contribution to the CERF Financial
    contribution to CERF budget, fully flexible within the CERF
    regulations.  
  - C Core contribution Financial contribution to a significant part of
    the aid organisation’s mandate, e.g. restricted to the humanitarian
    operations of a double-mandated organisation. The aid organisation
    can be instructed to distribute at its discretion – on several
    strategic objectives/regions/crises to avoid the entire contribution
    being used in one context.

  **Softly earmarked**

  - D Core contribution with limitations Financial contribution, but
    with exclusions pertaining to a small number of specific countries.
    The aid organisation can be instructed to only use funding outside
    of certain areas or countries.
  - E Directed to a geographical region or a strategic objective
    Financial contribution, fully flexible within the boundaries of the
    strategic objective (e.g. health or education) or region
    (e.g. Africa). Should reflect priorities in the Strategic Plan
    approved by the relevant governing body.
  - F Directed to a Country-Based Pooled Fund Financial contribution
    directed to a specific Country-Based Pooled Fund, otherwise fully
    flexible.

  **Earmarked**

  - G Directed to an aid organiastion’s country operations Financial
    contribution, directed to a specific country, otherwise fully
    flexible. Should reflect priorities set by the relevant governing
    body regarding country operations.
  - H Directed to subobjective/target Financial contribution, directed
    to subcategories of strategic objectives, e.g. health/malaria or
    education /teacher training, but without geographical limitations.
    Should reflect priorities in the Strategic Plan approved by the
    relevant governing body.

  **Tightly earmarked**

  - I Directed to a specific project Financial contribution directed to
    a specific project in a specific country.  
  - J Directed geographically and thematically, tied financial Financial
    contribution, tied to certain conditions in terms of purchase
    restrictions, directed to a specific country/region and to a
    specific objective. For instance, financial contribution for
    purchase of ABC for school feeding in X-land.  
  - K Directed geographically and thematically, in kind. In-kind
    contribution directed to a specific country/region and to a specific
    objective. For instance, rice for school feeding in X-land.  
  - L Donor-initiated projects/directed contributions Financial
    contribution coupled with the demand for a specific project in a
    specific country fulfilling donor priorities. Not reflecting
    Strategic Plan of the aid organisation. For instance, it becomes a
    service provider. This will also put strain on non-project support
    costs (overhead costs).

- `contributionType` - (financial, in-kind)

- `Reporting Status` indicate the status of the humanitarian fund
  reported per each row (“New Contribution”, “Top-up/Update”, “Old
  Contribution”)

  -   New contribution (aka New money): The fund is being reported to FTS by the same reporter for the first time. 

  -  Top-up/update: The fund was reported to FTS by the same reporter and now there is an update on the amount and/or on any other details.

  -  Old contribution: The fund was reported to FTS by the same reporter and there is no change. Used when reporters share cumulative reports.

- `newMoney` FALSE/TRUE

- `keywords`

- `method` Cash Transfer Programming (CTP) refers to all programs where
  cash (or vouchers for goods or services) is directly provided to
  beneficiaries.The CTP can be of three types: cash, mobile phone
  transfer and vouchers. FTS refers to all other humanitarian assistance
  modalities as traditional aid. Traditional: Non-cash assistance
  provided in the form of materials or services (i.e. food, tents, PSS,
  secondment of staff).

- `boundary` Boundaries classify relevant flows into the categories
  incoming, internal and outgoing. The FTS database records flows of
  funding, and draws boundaries around (combinations of) flow properties
  to calculate totals. Examples of common boundaries are a response
  plan/appeal or a combination of a (donor or affected) country and a
  year. Drawing a boundary classifies the flows in the database into
  those crossing the boundary inward (incoming flows), those originating
  and terminating within the boundary (internal flows), those crossing
  it outwards (outgoing flows), and a fourth category that is not
  displayed - those that are irrelevant to the boundary because they
  originate and terminate outside of it. Incoming flows are flows which
  cross a given search boundary inwards. If the boundary is e.g. an
  affected country and year, flows originating in donor countries or
  multilateral organisations attributed to the country are incoming
  flows, as is carry-over from a previous year. To avoid
  double-counting, incoming flows should never be added to internal
  flows. Outgoing flows are flows which originate within and terminate
  outside a given search boundary. If the boundary is e.g. an affected
  country and year, flows representing carry-overs to the next year are
  outgoing flows.

- `onBoundary`

- `status` The status of humanitarian funding reported. (pledge,
  commitment, paid)

  - “commitment” is for a binding agreement signed between parties OR
    for approval of a grant by the donor member state. Creation of a
    contractual obligation regarding funding between the donor and
    appealing agency; almost always takes the form of a signed contract.
    This is the crucial stage of humanitarian funding: agencies cannot
    spend money and implement before a funding commitment is made.

  - “pledge” is for no binding agreement OR no official government
    approval.A non-binding announcement of an intended contribution or
    allocation by the donor. The recipient organization and response
    plan or project are not necessarily specified. As soon as a
    commitment is reported to FTS against a pledge, the amount in the
    pledge column is reduced accordingly. FTS tables therefore show the
    ‘outstanding’ (not ‘total original’) pledge amount. The information
    is reported to us directly by donors and agencies and may or may not
    include verbal commitments made at pledging conferences.

  - “paid” is for the money transfer realized. FTS does not track
    disbursements / installments

### Quantity

- `amountUSD` Total Amount in US\$
- `fullParkedAmountUSD`
- `originalAmount`
- `originalCurrency` Original Currency The currency of the humanitarian
  fund reported.
- `exchangeRate` If blank, FTS will use the UN Operational Exchange Rate
  (<https://treasury.un.org/operationalrates/OperationalRates.php>), as
  of the grant decision date

### Date

- `budgetYear` Indicate the year in which the funding will be used. FTS
  works in calendar year system (from January to December for each year)
- `date` Date when submited to FTS
- `decisionDate` Date of the grant agreement that was signed between the
  recipient organization and the donor organization. OR date of the
  official endorsement by the donor member state
- `firstReportedDate`
- `createdAt`
- `updatedAt`

### Source

`sourceObjects` is a list variable including:  
\* `id" *`name”  
\* `type` that can take the following values:  
\* “Organization”Source Organisation \* “Location” Location of source
organisation \*“UsageYear” Indicate the year from which the donor plans
to allocate funding

### Destination

`destinationObjects` is a list variable including:  
\* `id" *`name”  
\* `type` that can take the following values: \* “Cluster” Global Sector
refers to a discrete technical area of humanitarian action, whereas
field cluster is technical area in a specific coordinated plan. List of
Global Sectors can be found here:
<https://fts.unocha.org/global-sectors/summary/2025>. \* “GlobalCluster”
Global Sector refers to a discrete technical area of humanitarian
action, whereas field cluster is technical area in a specific
coordinated plan. List of Global Sectors can be found here:
<https://fts.unocha.org/global-sectors/summary/2025>. \* “Location” The
location where the emergency is being addressed by the humanitarian
funding reported \* “Plan” Destination Plan/Appeal Name = left blank for
funding outside plan. Refer to the Coordinated Plans Page on FTS
website  
\* “UsageYear” \* “Organization”Recipient Organisation \* “behavior”
used if two records are of the same type - signal breakdown “single” or
“shared” if type==“Organization” - then the following additional
variables are available  
\* `organizationTypes`  
\* `organizationSubTypes` \* `organizationLevels`

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

## filter_flows_for_indicators

``` r
#cleaned <- filter_flows_for_indicators(flows)
```
