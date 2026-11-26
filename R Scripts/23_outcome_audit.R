# How many patients currently receive any HF medication?
table(
  analysis_dataset2$dr_ace_bin
)

table(
  analysis_dataset2$dr_beta_bin
)

# Combined current treatment receipt
analysis_dataset2$current_treatment <- ifelse(
  analysis_dataset2$dr_ace_bin == 1 |
    analysis_dataset2$dr_beta_bin == 1 |
    analysis_dataset2$dr_sglt2i_bin == 1 |
    analysis_dataset2$dr_entresto_bin == 1,
  1,
  0
)

table(
  analysis_dataset2$current_treatment
)

prop.table(
  table(
    analysis_dataset2$current_treatment
  )
) * 100

# Patients receiving treatment
table(
  analysis_dataset2$current_treatment
)

prop.table(
  table(
    analysis_dataset2$current_treatment
  )
) * 100

# Treatment initiation
table(
  analysis_dataset2$treated_within_6m
)

prop.table(
  table(
    analysis_dataset2$treated_within_6m
  )
) * 100

# Prior treatment status
prop.table(
  table(
    analysis_dataset2$dr_ace_prior
  )
) * 100

prop.table(
  table(
    analysis_dataset2$dr_beta_prior
  )
) * 100

# Patients already on treatment before HF diagnosis
table(analysis_dataset2$dr_ace_prior)

table(analysis_dataset2$dr_beta_prior)

# Patients currently treated
table(analysis_dataset2$current_treatment)

# Patients newly initiated
table(analysis_dataset2$treated_within_6m)

# Treated but not newly initiated
table(
  analysis_dataset2$current_treatment,
  analysis_dataset2$treated_within_6m
)

# Any recent treatment initiation
analysis_dataset2$recent_treatment <- ifelse(
  analysis_dataset2$dr_ace_recent == 1 |
    analysis_dataset2$dr_beta_recent == 1 |
    analysis_dataset2$dr_sglt2i_recent == 1 |
    analysis_dataset2$dr_entresto_recent == 1,
  1,
  0
)

table(
  analysis_dataset2$recent_treatment
)

prop.table(
  table(
    analysis_dataset2$recent_treatment
  )
) * 100

# Alternative treatment initiation definition
analysis_dataset2$recent_treatment_any <- ifelse(
  analysis_dataset2$dr_ace_recent == 1 |
    analysis_dataset2$dr_beta_recent == 1 |
    analysis_dataset2$dr_sglt2i_recent == 1 |
    analysis_dataset2$dr_entresto_recent == 1,
  1,
  0
)

table(
  analysis_dataset2$recent_treatment_any
)

prop.table(
  table(
    analysis_dataset2$recent_treatment_any
  )
) * 100

# Compare with current outcome
table(
  analysis_dataset2$recent_treatment_any,
  analysis_dataset2$treated_within_6m
)

prop.table(
  table(
    analysis_dataset2$recent_treatment_any,
    analysis_dataset2$treated_within_6m
  ),
  1
) * 100