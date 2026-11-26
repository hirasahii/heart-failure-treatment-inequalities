# Load data
analysis_dataset2 <- readRDS(
  "Hira_Sahi/analysis_dataset2.rds"
)

# Convert index date
analysis_dataset2$indexdate_date <- as.Date(
  analysis_dataset2$indexdate,
  format = "%d%b%Y"
)

# Create calendar year
analysis_dataset2$year_HF <- format(
  analysis_dataset2$indexdate_date,
  "%Y"
)

analysis_dataset2$year_HF_num <- as.numeric(
  analysis_dataset2$year_HF
)

# Check years
table(
  analysis_dataset2$year_HF
)

# IMD time trend model
model_imd_time <- glm(
  treated_within_6m ~
    imd10_pat +
    year_HF_num,
  family = binomial(),
  data = analysis_dataset2
)

summary(
  model_imd_time
)

exp(
  coef(model_imd_time)
)

# IMD x year interaction model
model_imd_interaction <- glm(
  treated_within_6m ~
    imd10_pat *
    year_HF_num,
  family = binomial(),
  data = analysis_dataset2
)

summary(
  model_imd_interaction
)

exp(
  coef(model_imd_interaction)
)

# Summary
# IMD time trend analysis completed
# Calendar year variable created
# IMD main effect assessed
# IMD x year interaction assessed
# No strong evidence that deprivation inequalities
# changed over time
# Interaction term was not statistically significant
# (p = 0.229)