# Load data
analysis_dataset2 <- readRDS(
  "Hira_Sahi/analysis_dataset2.rds"
)

# Original complete-case sample
analysis_dataset2$current_cc <- complete.cases(
  analysis_dataset2[
    ,
    c(
      "treated_within_6m",
      "ethnicity",
      "imd10_pat",
      "X_age_at_HF",
      "gender",
      "co_diab_any",
      "co_ischaemic",
      "co_afib",
      "co_cardiomyop",
      "co_proteinuria",
      "co_pvd",
      "co_valvular",
      "aki_prior",
      "bmi_prior"
    )
  ]
)

table(analysis_dataset2$current_cc)

# Explore AKI variable
table(
  analysis_dataset2$aki_prior,
  useNA = "always"
)

# Recode AKI
analysis_dataset2$aki_prior_fix <- ifelse(
  is.na(analysis_dataset2$aki_prior),
  0,
  analysis_dataset2$aki_prior
)

table(analysis_dataset2$aki_prior_fix)

table(
  analysis_dataset2$aki_prior_fix,
  useNA = "always"
)

# Re-run complete-case check
analysis_dataset2$new_cc <- complete.cases(
  analysis_dataset2[
    ,
    c(
      "treated_within_6m",
      "ethnicity",
      "imd10_pat",
      "X_age_at_HF",
      "gender",
      "co_diab_any",
      "co_ischaemic",
      "co_afib",
      "co_cardiomyop",
      "co_proteinuria",
      "co_pvd",
      "co_valvular",
      "aki_prior_fix",
      "bmi_prior"
    )
  ]
)

table(analysis_dataset2$new_cc)

# Audit missingness for model variables
vars_check <- c(
  "treated_within_6m",
  "ethnicity",
  "imd10_pat",
  "X_age_at_HF",
  "gender",
  "co_diab_any",
  "co_ischaemic",
  "co_afib",
  "co_cardiomyop",
  "co_proteinuria",
  "co_pvd",
  "co_valvular",
  "bmi_prior"
)

data.frame(
  Variable = vars_check,
  Missing = sapply(
    analysis_dataset2[vars_check],
    function(x) sum(is.na(x))
  ),
  Percent = round(
    sapply(
      analysis_dataset2[vars_check],
      function(x) mean(is.na(x)) * 100
    ),
    2
  )
)

# Fully adjusted model using AKI recode
model_full_fix <- glm(
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
    aki_prior_fix +
    bmi_prior,
  family = binomial(),
  data = analysis_dataset2
)

summary(model_full_fix)

exp(coef(model_full_fix))

exp(confint(model_full_fix))

nobs(model_full_fix)

# --------------------------------------------
# White-reference ethnicity models
# --------------------------------------------

analysis_dataset2$ethnicity_white_ref <- relevel(
  factor(analysis_dataset2$ethnicity),
  ref = "White"
)

levels(analysis_dataset2$ethnicity_white_ref)

# Age/sex adjusted

model_ethnicity_white <- glm(
  treated_within_6m ~
    ethnicity_white_ref +
    X_age_at_HF +
    gender,
  family = binomial(),
  data = analysis_dataset2
)

summary(model_ethnicity_white)

exp(coef(model_ethnicity_white))

exp(confint(model_ethnicity_white))

# Fully adjusted
model_full_white <- glm(
  treated_within_6m ~
    ethnicity_white_ref +
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
    aki_prior_fix +
    bmi_prior,
  family = binomial(),
  data = analysis_dataset2
)

summary(model_full_white)

exp(coef(model_full_white))

exp(confint(model_full_white))