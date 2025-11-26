
globalVariables(unique(c(
  # filter_flows_for_indicators:
  "boundary", "budgetYear", "childFlowIds", "flowType", "has_children",
  # indicator_destination_dependency:
  "amountUSD", "destination", "destinationObjects", "destinationObjects_name", "destinationObjects_type", "donor", "sourceObjects", "sourceObjects_name", "sourceObjects_type", "top_share", "total",
  # indicator_destination_donor_diversity:
  "amountUSD", "destination", "destinationObjects", "destinationObjects_name", "destinationObjects_type", "donor", "share", "sourceObjects", "sourceObjects_name", "sourceObjects_type", "total",
  # indicator_destination_donor_retention:
  "amountUSD", "budgetYear", "destination", "destinationObjects", "destinationObjects_name", "destinationObjects_type", "donor", "donors", "prev_donors", "retained", "sourceObjects", "sourceObjects_name", "sourceObjects_type",
  # indicator_destination_earmarking_flexibility:
  "amountUSD", "destinationObjects", "destinationObjects_name", "destinationObjects_type", "grandBargainEarmarkingType", "score",
  # indicator_destination_funding_diversity:
  "amountUSD", "destination", "Destination_Funding_Diversity", "destinationObjects", "destinationObjects_name", "destinationObjects_type", "donor", "entropy", "share", "sourceObjects", "sourceObjects_name", "sourceObjects_type", "total",
  # indicator_destination_funding_stability:
  "amountUSD", "budgetYear", "destination", "destinationObjects", "destinationObjects_name", "destinationObjects_type", "mean_amt", "sd_amt", "total_year",
  # indicator_destination_funding_trend:
  "amountUSD", "budgetYear", "destination", "destinationObjects", "destinationObjects_name", "destinationObjects_type",
  # indicator_destination_funding_volatility:
  "amountUSD", "budgetYear", "cv", "destination", "destinationObjects", "destinationObjects_name", "destinationObjects_type", "mean_amt", "sd_amt", "total",
  # indicator_destination_modality_balance:
  "amountUSD", "destination", "Destination_Modality_Balance", "destinationObjects", "destinationObjects_name", "destinationObjects_type", "method", "total",
  # indicator_destination_modality_innovation:
  "amountUSD", "ctp", "destinationObjects", "method", "name", "total", "type",
  # indicator_destination_pipeline_visibility:
  "amountUSD", "budgetYear", "destinationObjects", "future_flows", "name", "total_flows", "type",
  # indicator_donor_destination_concentration:
  "amountUSD", "destination", "destinationObjects", "destinationObjects_name", "destinationObjects_type", "donor", "share", "sourceObjects", "sourceObjects_name", "sourceObjects_type", "total",
  # indicator_donor_destination_coverage:
  "amountUSD", "destination", "destinationObjects", "destinationObjects_name", "destinationObjects_type", "donor", "sourceObjects", "sourceObjects_name", "sourceObjects_type", "supported_dest", "total_dest",
  # indicator_donor_destination_earmarking_flexibility:
  "amountUSD", "destination", "destinationObjects", "destinationObjects_name", "destinationObjects_type", "donor", "grandBargainEarmarkingType", "score", "sourceObjects", "sourceObjects_name", "sourceObjects_type",
  # indicator_donor_destination_geographic_alignment:
  "destinationObjects", "destinationObjects_name", "destinationObjects_type", "donor", "donor_locs", "Geographic_Alignment", "location", "sourceObjects", "sourceObjects_name", "sourceObjects_type",
  # indicator_donor_destination_risk_tolerance:
  "amountUSD", "destinationObjects", "destinationObjects_name", "destinationObjects_type", "donor", "entity_clean", "entity_name", "entity_type", "is_risky", "risky", "sourceObjects", "sourceObjects_name", "sourceObjects_type", "total",
  # indicator_donor_destination_stability:
  "active_years", "amountUSD", "budgetYear", "destination", "destinationObjects", "destinationObjects_name", "destinationObjects_type", "donor", "sourceObjects", "sourceObjects_name", "sourceObjects_type", "total_years",
  # indicator_donor_destination_trend:
  "amount", "amountUSD", "budgetYear", "destination", "destinationObjects", "destinationObjects_name", "destinationObjects_type", "donor", "share", "sourceObjects", "sourceObjects_name", "sourceObjects_type",
  # indicator_donor_funding_consistency:
  "amountUSD", "budgetYear", "n_years_funded", "name", "sourceObjects", "total_years", "type",
  # indicator_donor_funding_growth:
  "amountUSD", "budgetYear", "name", "sourceObjects", "type",
  # indicator_donor_knowledge_sharing_intensity:
  "description", "donor", "mention", "sourceObjects", "sourceObjects_name", "sourceObjects_type", "text",
  # indicator_donor_recipient_concentration:
  "amountUSD", "destinationObjects", "destinationObjects_name", "destinationObjects_type", "donor", "recipient", "sourceObjects", "sourceObjects_name", "sourceObjects_type", "total",
  # indicator_donor_recipient_funding_growth:
  "amountUSD", "budgetYear", "destinationObjects", "destinationObjects_name", "destinationObjects_type", "donor", "recipient", "sourceObjects", "sourceObjects_name", "sourceObjects_type",
  # indicator_donor_recipient_reciprocity:
  "destinationObjects", "destinationObjects_name", "destinationObjects_type", "donor", "DonorRecipient_Reciprocity_Ratio", "recipient", "sourceObjects", "sourceObjects_name", "sourceObjects_type",
  # indicator_donor_recipient_relationship_duration:
  "budgetYear", "destinationObjects", "destinationObjects_name", "destinationObjects_type", "donor", "first_year", "last_year", "recipient", "sourceObjects", "sourceObjects_name", "sourceObjects_type",
  # indicator_donor_recipient_stability:
  "active_years", "amountUSD", "budgetYear", "destinationObjects", "destinationObjects_name", "destinationObjects_type", "donor", "recipient", "sourceObjects", "sourceObjects_name", "sourceObjects_type", "total_years",
  # indicator_donor_recipient_trend:
  "amountUSD", "budgetYear", "destinationObjects", "destinationObjects_name", "destinationObjects_type", "donor", "recipient", "sourceObjects", "sourceObjects_name", "sourceObjects_type",
  # indicator_donor_relationship_duration:
  "boundary", "budgetYear", "donor", "name", "sourceObjects", "type",
  # indicator_donor_sector_alignment:
  "amountUSD", "capacity_weight", "destinationObjects", "destinationObjects_name", "destinationObjects_type", "donor", "donor_sector_funding", "sector", "sourceObjects", "sourceObjects_name", "sourceObjects_type",
  # indicator_donor_systemic_concentration:
  "amountUSD", "destinationObjects", "destinationObjects_name", "destinationObjects_type", "donor", "Donor_Concentration_Index", "recipient", "share", "sourceObjects", "sourceObjects_name", "sourceObjects_type", "total",
  # indicator_donor_systemic_destination_alignment:
  "destination", "destinationObjects", "destinationObjects_name", "destinationObjects_type", "donor", "donor1", "donor2", "sourceObjects", "sourceObjects_name", "sourceObjects_type",
  # indicator_donor_timing_consistency:
  "amountUSD", "donor", "monthly_total", "name", "sd_share", "share", "sourceObjects", "Timing_Consistency", "type",
  # indicator_recipient_amount_stability:
  "amountUSD", "annual_amount", "budgetYear", "destinationObjects", "mean_amt", "name", "sd_amt", "type",
  # indicator_recipient_cofunding_rate:
  "amountUSD", "destinationObjects", "destinationObjects_name", "destinationObjects_type", "id", "recipient", "recipient_count", "shared",
  # indicator_recipient_funding_share:
  "amountUSD", "destinationObjects", "name", "total_received", "type",
  # indicator_recipient_systemic_diversification:
  "amountUSD", "destinationObjects", "destinationObjects_name", "destinationObjects_type", "donor", "entropy", "recipient", "Recipient_Diversification_Index", "share", "sourceObjects", "sourceObjects_name", "sourceObjects_type", "total",
  # plot_donor_cluster_coverage:
  "flows_per_cluster",
  # plot_donor_earmarking:
  "total_usd",
  # plot_donor_flowtype:
  "total_usd",
  # plot_donor_funding_over_time:
  "total_usd",
  # plot_funding_status_timeline:
  "status", "total_usd",
  # plot_location_funding_destination:
  "total_usd",
  # plot_location_funding_donor:
  "total_usd",
  # plot_location_heatmap:
  "destinationObjects2", "destinationObjects2_name", "destinationObjects2_type", "total_usd",
  # plot_recipient_cofunding:
  "category",
  # plot_recipient_contribution_type:
  "contributionType", "total_usd",
  # plot_recipient_funding_composition:
  "total_usd",
  # plot_recipient_grandbargain:
  "total_usd"
)))
