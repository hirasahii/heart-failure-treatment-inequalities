# Load updated analysis dataset
analysis_dataset <- readRDS(
  "Hira_Sahi/analysis_dataset.rds"
)

# ACE
table(
  analysis_dataset$dr_ace_cat,
  analysis_dataset$dr_ace_recent_1,
  useNA = "ifany"
)

summary(
  analysis_dataset$dr_ace_statusdur[
    analysis_dataset$dr_ace_recent_1 == 1
  ]
)

# Beta
table(
  analysis_dataset$dr_beta_cat,
  analysis_dataset$dr_beta_recent_1,
  useNA = "ifany"
)

summary(
  analysis_dataset$dr_beta_statusdur[
    analysis_dataset$dr_beta_recent_1 == 1
  ]
)

# SGLT2i
table(
  analysis_dataset$dr_sglt2i_cat,
  analysis_dataset$dr_sglt2i_recent_1,
  useNA = "ifany"
)

summary(
  analysis_dataset$dr_sglt2i_statusdur[
    analysis_dataset$dr_sglt2i_recent_1 == 1
  ]
)

# Entresto
table(
  analysis_dataset$dr_entresto_cat,
  analysis_dataset$dr_entresto_recent_1,
  useNA = "ifany"
)

summary(
  analysis_dataset$dr_entresto_statusdur[
    analysis_dataset$dr_entresto_recent_1 == 1
  ]
)

# Any recent initiation across HF therapies
analysis_dataset$initiated_any_hf_tx <- ifelse(
  analysis_dataset$dr_ace_recent_1 == 1 |
    analysis_dataset$dr_beta_recent_1 == 1 |
    analysis_dataset$dr_sglt2i_recent_1 == 1 |
    analysis_dataset$dr_entresto_recent_1 == 1,
  1,
  0
)

table(
  analysis_dataset$initiated_any_hf_tx,
  useNA = "ifany"
)

# Compare treatment initiation by ethnicity
table(
  analysis_dataset$ethnicity,
  analysis_dataset$initiated_any_hf_tx
)

prop.table(
  table(
    analysis_dataset$ethnicity,
    analysis_dataset$initiated_any_hf_tx
  ),
  1
)

# Additional Code
table(
  analysis_dataset$dr_ace_recent,
  analysis_dataset$dr_ace_recent_1
)

table(
  analysis_dataset$dr_beta_recent,
  analysis_dataset$dr_beta_recent_1
)

table(
  analysis_dataset$dr_sglt2i_recent,
  analysis_dataset$dr_sglt2i_recent_1
)

table(
  analysis_dataset$dr_entresto_recent,
  analysis_dataset$dr_entresto_recent_1
)

# Potential treatment initiation outcome
analysis_dataset$initiated_any_hf_tx <- ifelse(
  analysis_dataset$dr_ace_recent_1 == 1 |
    analysis_dataset$dr_beta_recent_1 == 1 |
    analysis_dataset$dr_sglt2i_recent_1 == 1 |
    analysis_dataset$dr_entresto_recent_1 == 1,
  1,
  0
)

# Logistic regression
model_init_ethnicity <- glm(
  initiated_any_hf_tx ~ ethnicity + X_age_at_HF + gender,
  family = binomial(),
  data = analysis_dataset
)

summary(model_init_ethnicity)

# Odds ratios
exp(coef(model_init_ethnicity))

exp(confint(model_init_ethnicity))
