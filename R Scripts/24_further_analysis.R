# CODE 2
# Interaction terms 
library(broom)
library(dplyr)

interaction_model <- glm(
  dr_ace_bin ~
    ethnicity * calendar_year +
    imd10_pat * calendar_year +
    X_age +
    gender +
    co_diab_any +
    co_ischaemic +
    co_afib +
    aki_prior +
    bmi_prior,
  data = analysis_dataset,
  family = binomial()
)

interaction_results <- tidy(
  interaction_model,
  exponentiate = TRUE,
  conf.int = TRUE
)

interaction_results |>
  filter(grepl("calendar_year", term))

# CODE 4
library(broom)
library(dplyr)

all_subtype_results <- bind_rows(
  
  tidy(hfref_ace_model) %>%
    mutate(model = "HFrEF_ACE"),
  
  tidy(hfpef_ace_model) %>%
    mutate(model = "HFpEF_ACE"),
  
  tidy(hfref_beta_model) %>%
    mutate(model = "HFrEF_BETA"),
  
  tidy(hfpef_beta_model) %>%
    mutate(model = "HFpEF_BETA")
)

# Code 3
library(broom)
library(dplyr)

tidy(
  model_monitor_ethnicity,
  exponentiate = TRUE,
  conf.int = TRUE
) %>%
  filter(term != "(Intercept)")

ace_first_monitor %>%
  group_by(ethnicity) %>%
  summarise(
    N = n(),
    monitored = sum(monitored_within_6m == 1),
    pct_monitored = round(
      100 * mean(monitored_within_6m),
      1
    )
  )

# CODE 4 (BH correction)
library(broom)
library(dplyr)

subtype_results <- bind_rows(
  
  tidy(hfref_ace_model)  %>%
    mutate(model = "HFrEF_ACE"),
  
  tidy(hfpef_ace_model)  %>%
    mutate(model = "HFpEF_ACE"),
  
  tidy(hfref_beta_model) %>%
    mutate(model = "HFrEF_BETA"),
  
  tidy(hfpef_beta_model) %>%
    mutate(model = "HFpEF_BETA")
  
)

ethnicity_results <- subtype_results %>%
  filter(grepl("ethnicity", term))

ethnicity_results <- ethnicity_results %>%
  mutate(
    p_BH = p.adjust(
      p.value,
      method = "BH"
    )
  )

ethnicity_results

ethnicity_results %>%
  filter(p_BH < 0.05)

# Code 1
final_model <- glm(
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
  data = analysis_dataset2,
  family = binomial()
)
summary(final_model)

# Code 4
analysis_dataset2$aki_prior_fix <- ifelse(
  is.na(analysis_dataset2$aki_prior),
  0,
  analysis_dataset2$aki_prior
)

final_model <- glm(
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
  data = analysis_dataset2,
  family = binomial()
)

summary(final_model)
nobs(final_model)
vif(final_model)
