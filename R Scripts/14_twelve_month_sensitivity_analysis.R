# Load data
analysis_dataset2 <- readRDS(
  "Hira_Sahi/analysis_dataset2.rds"
)

# Check outcome
table(
  analysis_dataset2$treated_within_12m
)

prop.table(
  table(
    analysis_dataset2$treated_within_12m
  )
) * 100

# Ethnicity model
model_ethnicity_12m <- glm(
  treated_within_12m ~
    ethnicity +
    X_age_at_HF +
    gender,
  family = binomial(),
  data = analysis_dataset2
)

summary(
  model_ethnicity_12m
)

exp(
  coef(model_ethnicity_12m)
)

exp(
  confint(model_ethnicity_12m)
)

# IMD model
model_imd_12m <- glm(
  treated_within_12m ~
    imd10_pat +
    X_age_at_HF +
    gender,
  family = binomial(),
  data = analysis_dataset2
)

summary(
  model_imd_12m
)

exp(
  coef(model_imd_12m)
)

exp(
  confint(model_imd_12m)
)

# Fully adjusted model
model_full_12m <- glm(
  treated_within_12m ~
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
  model_full_12m
)

exp(
  coef(model_full_12m)
)

exp(
  confint(model_full_12m)
)

nobs(
  model_full_12m
)

# Complete case sample size
nobs(
  model_ethnicity_12m
)

nobs(
  model_imd_12m
)

nobs(
  model_full_12m
)

# Summary
# 12-month sensitivity analysis completed
# Outcome = treated_within_12m
# Ethnicity model fitted
# IMD model fitted
# Fully adjusted model fitted
# Odds ratios and confidence intervals calculated
# Ethnicity model sample size = 42,643
# IMD model sample size = 42,602
# Fully adjusted model sample size = 5,493
# Large reductions in sample size occurred due to missing

# Note
# Fully adjusted model sample size reduced substantially
# due to missing covariate data (n = 5,493)
# The impact of missing data should be considered
# when interpreting results


