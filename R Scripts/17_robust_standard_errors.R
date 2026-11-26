# Load data
analysis_dataset2 <- readRDS(
  "Hira_Sahi/analysis_dataset2.rds"
)

# Check practice variable
summary(
  analysis_dataset2$pracid
)

length(
  unique(
    analysis_dataset2$pracid
  )
)

table(
  is.na(
    analysis_dataset2$pracid
  )
)

# Load required packages
install.packages(
  "sandwich"
)

install.packages(
  "lmtest"
)

library(sandwich)
library(lmtest)

# Refit main model
model_robust <- glm(
  treated_within_6m ~
    ethnicity +
    imd10_pat +
    X_age_at_HF +
    gender,
  family = binomial(),
  data = analysis_dataset2
)

# Standard model summary
summary(
  model_robust
)

# Robust standard errors clustered by practice
coeftest(
  model_robust,
  vcov = vcovCL(
    model_robust,
    cluster = ~ pracid
  )
)

# Summary
# Robust standard errors clustered by practice were assessed
# Clustering variable = pracid
# 944 practices identified
# Robust standard errors were similar to standard errors
# Main conclusions remained unchanged after accounting
# for clustering within general practices