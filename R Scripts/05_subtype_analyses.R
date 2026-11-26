# HF subtype analyses
analysis_dataset <- readRDS(
  "Hira_Sahi/analysis_dataset.rds"
)
table(analysis_dataset$HFrEF_anytime, useNA = "ifany")
table(analysis_dataset$HFpEF_anytime, useNA = "ifany")

# HFrEF dataset
hfref_dataset <- analysis_dataset[
  analysis_dataset$HFrEF_anytime == 1,
]
dim(hfref_dataset)

# HFpEF dataset
hfpef_dataset <- analysis_dataset[
  analysis_dataset$HFpEF_anytime == 1,
]
dim(hfpef_dataset)

# Dataset exploration 
sum(hfref_dataset$HFrEF_anytime == 1, na.rm = TRUE)
sum(hfpef_dataset$HFpEF_anytime == 1, na.rm = TRUE)
table(hfref_dataset$HFrEF_anytime, useNA = "ifany")

table(hfpef_dataset$HFpEF_anytime, useNA = "ifany")
sum(is.na(hfref_dataset$HFrEF_anytime))
sum(is.na(hfpef_dataset$HFpEF_anytime))

# HFrEF only dataset
hfref_only <- analysis_dataset[
  !is.na(analysis_dataset$HFrEF_anytime) &
    analysis_dataset$HFrEF_anytime == 1,
]
dim(hfref_only)

# HFpEF only dataset
hfpef_only <- analysis_dataset[
  !is.na(analysis_dataset$HFpEF_anytime) &
    analysis_dataset$HFpEF_anytime == 1,
]

dim(hfpef_only)

# HFrEF ACE inhibitor model
hfref_only$ethnicity <- relevel(
  factor(hfref_only$ethnicity),
  ref = "White"
)

hfref_ace_model <- glm(
  dr_ace_bin ~
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
    co_valvular,
  data = hfref_only,
  family = binomial()
)

summary(hfref_ace_model)

# HFpEF ACE inhibitor model
hfpef_only$ethnicity <- relevel(
  factor(hfpef_only$ethnicity),
  ref = "White"
)

hfpef_ace_model <- glm(
  dr_ace_bin ~
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
    co_valvular,
  data = hfpef_only,
  family = binomial()
)

summary(hfpef_ace_model)

# Odds ratios for HFrEF ACE model
exp(coef(hfref_ace_model))

# Odds ratios for HFpEF ACE model
exp(coef(hfpef_ace_model))

# 95 percent confidence intervals for HFrEF ACE model
exp(confint(hfref_ace_model))

# 95 percent confidence intervals for HFpEF ACE model
exp(confint(hfpef_ace_model))

# HFrEF beta blocker model
hfref_beta_model <- glm(
  dr_beta_bin ~
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
    co_valvular,
  data = hfref_only,
  family = binomial()
)

summary(hfref_beta_model)

# HFpEF beta blocker model
hfpef_beta_model <- glm(
  dr_beta_bin ~
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
    co_valvular,
  data = hfpef_only,
  family = binomial()
)

summary(hfpef_beta_model)

# Model outputs 
exp(coef(hfref_beta_model))
exp(coef(hfpef_beta_model))

exp(confint(hfref_beta_model))
exp(confint(hfpef_beta_model))

# Findings
# HFrEF cohort
# 66,338 patients
# HFpEF cohort
# 15,361 patients

# ACE inhibitor models
# No ethnicity variable remained statistically
# significant in HFrEF or HFpEF models
# Beta blocker models

# Associations appeared stronger in HFrEF than HFpEF
# Asian ethnicity showed lower odds of beta blocker
# receipt in HFrEF patients
# Ethnic differences observed in the full cohort
# were attenuated in subtype specific analyses

# Notes
# HFrEF models retained approximately 66,000 patients
# HFpEF models retained approximately 15,000 patients
# Missing subtype information was excluded from all
# subtype specific analyses
# Subtype analyses address Objective 4 of the dissertation
# Results should be compared against the full cohort
# models from 04_logistic_regression_models.R