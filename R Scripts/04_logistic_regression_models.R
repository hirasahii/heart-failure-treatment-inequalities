# Logistic regression models
analysis_dataset <- readRDS(
  "Hira_Sahi/analysis_dataset.rds"
)

# Set White as reference ethnicity group 
analysis_dataset$ethnicity <- relevel(
  factor(analysis_dataset$ethnicity),
  ref = "White"
)

# Model 1
# Unadjusted association between ethnicity and ACE inhibitor receipt
model1_ace <- glm(
  dr_ace_bin ~ ethnicity,
  data = analysis_dataset,
  family = binomial()
)

summary(model1_ace)

# Model 2
# Adjusted for age and sex
model2_ace <- glm(
  dr_ace_bin ~ ethnicity +
    X_age_at_HF +
    gender,
  data = analysis_dataset,
  family = binomial()
)

summary(model2_ace)

# Model 3
# Fully adjusted model including HF subtype
model3_ace <- glm(
  dr_ace_bin ~
    ethnicity +
    imd10_pat +
    X_age_at_HF +
    gender +
    HFrEF_anytime +
    HFpEF_anytime +
    co_diab_any +
    co_ischaemic +
    co_afib +
    co_cardiomyop +
    co_proteinuria +
    co_pvd +
    co_valvular,
  data = analysis_dataset,
  family = binomial()
)

summary(model3_ace)

# Assess missingness
colSums(is.na(analysis_dataset))

# HF subtype missingness
# HFrEF_anytime
# 66,338 HFrEF
# 14,129 non HFrEF
# 99,625 missing subtype information

# HFpEF_anytime
# 15,361 HFpEF
# 65,106 non HFpEF
# 99,625 missing subtype information
# Subtype variables remove approximately 100,000 patients from fully adjusted models

# Model 3a
# Fully adjusted model excluding HF subtype
model3a_ace <- glm(
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
  data = analysis_dataset,
  family = binomial()
)

summary(model3a_ace)

# ACE inhibitor interpretation
# Model 3a retains almost the entire cohort
# Only 158 observations removed due to missing IMD
# Results are broadly similar to Model 3
# HF subtype may be better investigated as a separate subgroup analysis
# Black ethnicity remained associated with higher odds of ACE inhibitor receipt after adjustment
# Asian ethnicity was not significantly different from White ethnicity after adjustment
# Ischaemic heart disease atrial fibrillation and cardiomyopathy were strongly associated with treatment receipt
# Odds ratios and confidence intervals should be reported in the Results chapter
# Beta blocker models

# Model 1
model1_beta <- glm(
  dr_beta_bin ~ ethnicity,
  data = analysis_dataset,
  family = binomial()
)

summary(model1_beta)

# Model 2
model2_beta <- glm(
  dr_beta_bin ~ ethnicity +
    X_age_at_HF +
    gender,
  data = analysis_dataset,
  family = binomial()
)

summary(model2_beta)

# Model 3a
model3a_beta <- glm(
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
  data = analysis_dataset,
  family = binomial()
)

summary(model3a_beta)

# Beta blocker interpretation
# Model 3a retains almost the entire cohort
# Only 158 observations removed due to missing IMD
# Ethnicity remains associated with beta blocker receipt after adjustment
# Asian ethnicity showed lower odds of beta blocker receipt compared with White ethnicity
# Unknown ethnicity showed lower odds of beta blocker receipt compared with White ethnicity
# Black ethnicity was not clearly different from White ethnicity after adjustment
# Ischaemic heart disease and atrial fibrillation were strongly associated with beta blocker receipt
# Odds ratios and confidence intervals should be reported in the Results chapter

# Odds ratios for ACE inhibitor model
exp(coef(model3a_ace))

# Odds ratios for beta blocker model
exp(coef(model3a_beta))

# 95 percent confidence intervals for ACE inhibitor model
exp(confint(model3a_ace))

# 95 percent confidence intervals for beta blocker model
exp(confint(model3a_beta))