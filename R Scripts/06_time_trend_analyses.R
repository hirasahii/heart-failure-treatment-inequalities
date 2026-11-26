# Time trend analyses
analysis_dataset <- readRDS(
  "Hira_Sahi/analysis_dataset.rds"
)

# Check indexdate format
class(analysis_dataset$indexdate)

head(analysis_dataset$indexdate)

# Convert indexdate to Date format
analysis_dataset$indexdate_date <- as.Date(
  analysis_dataset$indexdate,
  format = "%d%b%Y"
)

# Extract calendar year
analysis_dataset$year_HF <- format(
  analysis_dataset$indexdate_date,
  "%Y"
)

# Check result
head(analysis_dataset$year_HF)

table(analysis_dataset$year_HF)

# ACE inhibitor receipt by year
ace_by_year <- aggregate(
  dr_ace_bin ~ year_HF,
  data = analysis_dataset,
  mean
)

ace_by_year

# Beta-blocker receipt by year
beta_by_year <- aggregate(
  dr_beta_bin ~ year_HF,
  data = analysis_dataset,
  mean
)

beta_by_year

# Convert to percentages
ace_by_year$percent <- ace_by_year$dr_ace_bin * 100

beta_by_year$percent <- beta_by_year$dr_beta_bin * 100

ace_by_year

beta_by_year

# ACE inhibitor trend
plot(
  as.numeric(ace_by_year$year_HF),
  ace_by_year$percent,
  type = "b",
  pch = 19,
  col = "blue",
  lwd = 2,
  xlab = "Year",
  ylab = "ACE inhibitor receipt (%)",
  main = "ACE inhibitor receipt over time"
)

lines(
  as.numeric(ace_by_year$year_HF),
  ace_by_year$percent,
  col = "red",
  lwd = 2
)

# Beta-blocker trend
plot(
  as.numeric(beta_by_year$year_HF),
  beta_by_year$percent,
  type = "b",
  pch = 19,
  col = "blue",
  lwd = 2,
  xlab = "Year",
  ylab = "Beta-blocker receipt (%)",
  main = "Beta-blocker receipt over time"
)

lines(
  as.numeric(beta_by_year$year_HF),
  beta_by_year$percent,
  col = "red",
  lwd = 2
)

# Time trend model analysis  
analysis_dataset$year_HF_num <- as.numeric(
  analysis_dataset$year_HF
)

ace_time_model <- glm(
  dr_ace_bin ~
    ethnicity +
    year_HF_num,
  data = analysis_dataset,
  family = binomial()
)

summary(ace_time_model)

# ACE ethnicity-by-time interaction model
ace_interaction_model <- glm(
  dr_ace_bin ~
    ethnicity *
    year_HF_num,
  data = analysis_dataset,
  family = binomial()
)

summary(ace_interaction_model)

# Beta-blocker ethnicity-by-time interaction model
beta_interaction_model <- glm(
  dr_beta_bin ~
    ethnicity *
    year_HF_num,
  data = analysis_dataset,
  family = binomial()
)

summary(beta_interaction_model)

# Odds ratios and confidence intervals 
exp(coef(beta_interaction_model))
exp(confint(beta_interaction_model))

# Findings
# Study period:
# 2005 to 2021

# ACE inhibitor receipt declined over time
# approximately 35.6% in 2005
# to 22.3% in 2021

# Beta-blocker receipt declined over time
# approximately 35.8% in 2005
# to 28.0% in 2021

# Calendar year remained significantly associated
# with ACE inhibitor receipt
# Limited evidence that ACE inhibitor inequalities
# changed over time
# No strong evidence that beta-blocker inequalities
# changed over time
# Objective 3 completed