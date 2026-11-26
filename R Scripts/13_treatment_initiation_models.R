# Load data
analysis_dataset2 <- readRDS(
  "Hira_Sahi/analysis_dataset2.rds"
)

# Check outcome
table(
  analysis_dataset2$treated_within_6m,
  useNA = "ifany"
)

# Compare with prior treatment
table(
  analysis_dataset2$treated_within_6m,
  analysis_dataset2$dr_ace_prior
)

table(
  analysis_dataset2$treated_within_6m,
  analysis_dataset2$dr_beta_prior
)

# Compare with current treatment
table(
  analysis_dataset2$treated_within_6m,
  analysis_dataset2$dr_ace_bin
)

table(
  analysis_dataset2$treated_within_6m,
  analysis_dataset2$dr_beta_bin
)

# Crude treatment initiation by ethnicity
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

# Ethnicity model
model_ethnicity <- glm(
  treated_within_6m ~
    ethnicity +
    X_age_at_HF +
    gender,
  family = binomial(),
  data = analysis_dataset2
)

summary(
  model_ethnicity
)

exp(
  coef(model_ethnicity)
)

exp(
  confint(model_ethnicity)
)

# IMD model
model_imd <- glm(
  treated_within_6m ~
    imd10_pat +
    X_age_at_HF +
    gender,
  family = binomial(),
  data = analysis_dataset2
)

summary(
  model_imd
)

exp(
  coef(model_imd)
)

exp(
  confint(model_imd)
)

# Fully adjusted model
model_full <- glm(
  treated_within_6m ~
    ethnicity +
    imd10_pat +
    X_age_at_HF +
    gender +
    co_diab_any +
    co_ischaemic +
    co_afib +
    co_cardiomyop +
    co_proteinuria +
    co_pvd +
    co_valvular +
    aki_prior +
    bmi_prior,
  family = binomial(),
  data = analysis_dataset2
)

summary(
  model_full
)

exp(
  coef(model_full)
)

# Fully adjusted odds ratios
exp(
  confint(model_full)
)

# Complete case count
nobs(
  model_full
)

# Complete case sample size
nobs(
  model_ethnicity
)

nobs(
  model_imd
)

nobs(
  model_full
)

# Summary
# Built treatment initiation inequality models
# Outcome = treated_within_6m
# Unadjusted ethnicity differences observed
# Adjusted ethnicity model fitted
# Adjusted IMD model fitted
# Fully adjusted model fitted
# Complete case sample size = 32,243 patients
# Large reductions in sample size occurred due to missing covariate data