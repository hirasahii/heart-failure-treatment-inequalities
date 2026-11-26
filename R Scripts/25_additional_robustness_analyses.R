# Investigate missingness 
library(dplyr)

analysis_dataset2 %>%
  summarise(
    ACE = sum(!is.na(ace_time)),
    Beta = sum(!is.na(beta_time)),
    SGLT2 = sum(!is.na(sglt2_time)),
    Entresto = sum(!is.na(entresto_time)),
    Any_Treatment = sum(treated_within_6m == 1, na.rm = TRUE)
  )

analysis_dataset2 %>%
  summarise(
    ACE_pct = mean(!is.na(ace_time)) * 100,
    Beta_pct = mean(!is.na(beta_time)) * 100,
    SGLT2_pct = mean(!is.na(sglt2_time)) * 100,
    Entresto_pct = mean(!is.na(entresto_time)) * 100,
    Any_Treatment_pct = mean(treated_within_6m == 1, na.rm = TRUE) * 100
  )

# Check subtype missingness
analysis_dataset2 <- analysis_dataset2 %>%
  mutate(
    subtype_status = case_when(
      HFrEF_anytime == 1 ~ "HFrEF",
      HFpEF_anytime == 1 ~ "HFpEF",
      TRUE ~ "Missing"
    )
  )

analysis_dataset2 %>%
  group_by(subtype_status) %>%
  summarise(
    N = n(),
    Mean_Age = mean(X_age_at_HF, na.rm = TRUE),
    Male_Pct = mean(gender == 1, na.rm = TRUE) * 100,
    White_Pct = mean(ethnicity == "White", na.rm = TRUE) * 100,
    Treatment_Pct = mean(treated_within_6m == 1, na.rm = TRUE) * 100
  )

# Treatment initiation by calendar period
install.packages("lubridate")
library(lubridate)

analysis_dataset2$date_hf <- dmy(analysis_dataset2$indexdate)
analysis_dataset2 <- analysis_dataset2 %>%
  mutate(
    diagnosis_year = year(date_hf),
    period = case_when(
      diagnosis_year <= 2009 ~ "2005-2009",
      diagnosis_year <= 2014 ~ "2010-2014",
      diagnosis_year <= 2018 ~ "2015-2018",
      TRUE ~ "2019-2022"
    )
  )

analysis_dataset2 %>%
  group_by(period) %>%
  summarise(
    N = n(),
    Treated = sum(treated_within_6m == 1, na.rm = TRUE),
    Treatment_Pct = mean(treated_within_6m == 1, na.rm = TRUE) * 100
  )

# Check your reference categories
table(analysis_dataset2$gender)
table(analysis_dataset2$bmi_prior)

# Exploring further 
analysis_dataset2 %>%
  summarise(
    ACE_prior_pct = mean(dr_ace_prior == 1, na.rm = TRUE) * 100,
    Beta_prior_pct = mean(dr_beta_prior == 1, na.rm = TRUE) * 100,
    SGLT2_prior_pct = mean(dr_sglt2i_prior == 1, na.rm = TRUE) * 100,
    Entresto_prior_pct = mean(dr_entresto_prior == 1, na.rm = TRUE) * 100
  )

# Create diagnosis year
library(dplyr)
library(lubridate)

analysis_dataset2$date_hf <- dmy(analysis_dataset2$indexdate)

analysis_dataset2 <- analysis_dataset2 %>%
  mutate(
    diagnosis_year = year(date_hf)
  )

# Variables 
analysis_dataset2$ethnicity <- factor(
  analysis_dataset2$ethnicity,
  levels = c("White", "Asian", "Black", "Mixed", "Other", "Unknown")
)

analysis_dataset2$bmi_prior <- factor(
  analysis_dataset2$bmi_prior,
  levels = c("Normal", "Overweight", "Obese", "Underweight", "Unknown")
)

analysis_dataset2$gender <- factor(
  analysis_dataset2$gender
)

# Interaction model 
model_interaction <- glm(
  treated_within_6m ~
    ethnicity * diagnosis_year +
    imd10_pat * diagnosis_year +
    X_age_at_HF +
    gender +
    bmi_prior +
    aki_prior +
    co_diab_any +
    co_ischaemic +
    co_afib +
    co_cardiomyop,
  
  family = binomial(),
  data = analysis_dataset2
)

# Coefficients 
summary(model_interaction)

# OR's 
or_table <- exp(cbind(
  OR = coef(model_interaction),
  confint(model_interaction)
))

round(or_table, 3)

# Interaction terms 
or_table[grep("diagnosis_year", rownames(or_table)), ]
