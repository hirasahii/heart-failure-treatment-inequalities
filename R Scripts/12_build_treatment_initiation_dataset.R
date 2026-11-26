# Load longitudinal dataset
library(dplyr)

longitudinal_dataset <- readRDS(
  "Hira_Sahi/longitudinal_dataset.rds"
)

# First ACE initiation
ace_first <- longitudinal_dataset %>%
  filter(dr_ace_recent_1 == 1) %>%
  group_by(patid) %>%
  slice_min(
    X_time_since_HF,
    with_ties = FALSE
  ) %>%
  ungroup() %>%
  select(
    patid,
    ace_time = X_time_since_HF
  )

# First beta-blocker initiation
beta_first <- longitudinal_dataset %>%
  filter(dr_beta_recent_1 == 1) %>%
  group_by(patid) %>%
  slice_min(
    X_time_since_HF,
    with_ties = FALSE
  ) %>%
  ungroup() %>%
  select(
    patid,
    beta_time = X_time_since_HF
  )

# First SGLT2 initiation
sglt2_first <- longitudinal_dataset %>%
  filter(dr_sglt2i_recent_1 == 1) %>%
  group_by(patid) %>%
  slice_min(
    X_time_since_HF,
    with_ties = FALSE
  ) %>%
  ungroup() %>%
  select(
    patid,
    sglt2_time = X_time_since_HF
  )

# First Entresto initiation
entresto_first <- longitudinal_dataset %>%
  filter(dr_entresto_recent_1 == 1) %>%
  group_by(patid) %>%
  slice_min(
    X_time_since_HF,
    with_ties = FALSE
  ) %>%
  ungroup() %>%
  select(
    patid,
    entresto_time = X_time_since_HF
  )

# Check treatment initiation datasets
dim(ace_first)

dim(beta_first)

dim(sglt2_first)

dim(entresto_first)

# Check timing distributions
summary(
  ace_first$ace_time
)

summary(
  beta_first$beta_time
)

summary(
  sglt2_first$sglt2_time
)

summary(
  entresto_first$entresto_time
)

# Merge treatment initiation datasets
treatment_init <- ace_first %>%
  full_join(
    beta_first,
    by = "patid"
  ) %>%
  full_join(
    sglt2_first,
    by = "patid"
  ) %>%
  full_join(
    entresto_first,
    by = "patid"
  )

# Check dataset
dim(
  treatment_init
)

names(
  treatment_init
)

# First HF treatment time
treatment_init$first_hf_treatment_time <- apply(
  treatment_init[
    ,
    c(
      "ace_time",
      "beta_time",
      "sglt2_time",
      "entresto_time"
    )
  ],
  1,
  min,
  na.rm = TRUE
)

# Check distribution
summary(
  treatment_init$first_hf_treatment_time
)

# Check infinite values
table(
  is.infinite(
    treatment_init$first_hf_treatment_time
  )
)

# Replace infinite values with missing
treatment_init$first_hf_treatment_time[
  is.infinite(
    treatment_init$first_hf_treatment_time
  )
] <- NA

# Recheck distribution
summary(
  treatment_init$first_hf_treatment_time
)

# Treatment within 6 months
treatment_init$treated_within_6m <- ifelse(
  treatment_init$first_hf_treatment_time <= 0.5,
  1,
  0
)

table(
  treatment_init$treated_within_6m,
  useNA = "ifany"
)

prop.table(
  table(
    treatment_init$treated_within_6m,
    useNA = "ifany"
  )
) * 100

# Treatment within 12 months
treatment_init$treated_within_12m <- ifelse(
  treatment_init$first_hf_treatment_time <= 1,
  1,
  0
)

table(
  treatment_init$treated_within_12m,
  useNA = "ifany"
)

prop.table(
  table(
    treatment_init$treated_within_12m,
    useNA = "ifany"
  )
) * 100

# Merge treatment dataset back to analysis dataset
analysis_dataset2 <- merge(
  analysis_dataset,
  treatment_init,
  by = "patid",
  all.x = TRUE
)

# Check size
dim(
  analysis_dataset2
)

# Check missing treatment initiation
table(
  is.na(
    analysis_dataset2$first_hf_treatment_time
  )
)

# Recreate treatment within 6 months in full cohort
analysis_dataset2$treated_within_6m <- ifelse(
  !is.na(
    analysis_dataset2$first_hf_treatment_time
  ) &
    analysis_dataset2$first_hf_treatment_time <= 0.5,
  1,
  0
)

table(
  analysis_dataset2$treated_within_6m
)

prop.table(
  table(
    analysis_dataset2$treated_within_6m
  )
) * 100

# Treatment within 6 months by ethnicity
table(
  analysis_dataset2$ethnicity,
  analysis_dataset2$treated_within_6m
)

prop.table(
  table(
    analysis_dataset2$ethnicity,
    analysis_dataset2$treated_within_6m
  ),
  1
)

# Treatment within 6 months by IMD
table(
  analysis_dataset2$imd10_pat,
  analysis_dataset2$treated_within_6m
)

prop.table(
  table(
    analysis_dataset2$imd10_pat,
    analysis_dataset2$treated_within_6m
  ),
  1
)

# Validate treated_within_6m outcome
table(
  analysis_dataset2$treated_within_6m,
  analysis_dataset2$dr_ace_bin
)

table(
  analysis_dataset2$treated_within_6m,
  analysis_dataset2$dr_beta_bin
)

prop.table(
  table(
    analysis_dataset2$treated_within_6m,
    analysis_dataset2$dr_ace_bin
  ),
  1
)

prop.table(
  table(
    analysis_dataset2$treated_within_6m,
    analysis_dataset2$dr_beta_bin
  ),
  1
)

# Investigate patients with no initiation time
table(
  is.na(
    analysis_dataset2$first_hf_treatment_time
  ),
  analysis_dataset2$dr_ace_bin
)

table(
  is.na(
    analysis_dataset2$first_hf_treatment_time
  ),
  analysis_dataset2$dr_beta_bin
)

prop.table(
  table(
    is.na(
      analysis_dataset2$first_hf_treatment_time
    ),
    analysis_dataset2$dr_ace_bin
  ),
  1
)

# Check treatment duration among patients with no initiation time
summary(
  analysis_dataset2$dr_ace_currdur[
    is.na(
      analysis_dataset2$first_hf_treatment_time
    )
  ]
)

summary(
  analysis_dataset2$dr_ace_totaldur[
    is.na(
      analysis_dataset2$first_hf_treatment_time
    )
  ]
)
prop.table(
  table(
    is.na(
      analysis_dataset2$first_hf_treatment_time
    ),
    analysis_dataset2$dr_beta_bin
  ),
  1
)

# Check treatment duration variables
summary(
  analysis_dataset2$dr_ace_currdur
)

summary(
  analysis_dataset2$dr_ace_totaldur
)

summary(
  analysis_dataset2$dr_beta_currdur
)

summary(
  analysis_dataset2$dr_beta_totaldur
)

# Check treatment before HF diagnosis
table(
  analysis_dataset2$dr_ace_prior,
  useNA = "ifany"
)

table(
  analysis_dataset2$dr_beta_prior,
  useNA = "ifany"
)

table(
  analysis_dataset2$dr_ace_prior,
  is.na(
    analysis_dataset2$first_hf_treatment_time
  )
)

table(
  analysis_dataset2$dr_beta_prior,
  is.na(
    analysis_dataset2$first_hf_treatment_time
  )
)

prop.table(
  table(
    analysis_dataset2$dr_ace_prior,
    is.na(
      analysis_dataset2$first_hf_treatment_time
    )
  ),
  1
)

prop.table(
  table(
    analysis_dataset2$dr_beta_prior,
    is.na(
      analysis_dataset2$first_hf_treatment_time
    )
  ),
  1
)

# ACE prior by treatment status
table(
  analysis_dataset2$dr_ace_prior,
  analysis_dataset2$treated_within_6m
)

prop.table(
  table(
    analysis_dataset2$dr_ace_prior,
    analysis_dataset2$treated_within_6m
  ),
  1
)

# Beta prior by treatment status
table(
  analysis_dataset2$dr_beta_prior,
  analysis_dataset2$treated_within_6m
)

prop.table(
  table(
    analysis_dataset2$dr_beta_prior,
    analysis_dataset2$treated_within_6m
  ),
  1
)

# Save updated analysis dataset
saveRDS(
  analysis_dataset2,
  "Hira_Sahi/analysis_dataset2.rds"
)

# Conclusion
# Treatment initiation variables can be reconstructed
# First treatment timing variables were created
# Treatment initiation appears to capture new therapy initiation
# rather than all treatment receipt following HF diagnosis