# Load updated analysis dataset
analysis_dataset <- readRDS(
  "Hira_Sahi/analysis_dataset.rds"
)

# ACE variables
table(
  analysis_dataset$dr_ace_cat,
  useNA = "ifany"
)

summary(
  analysis_dataset$dr_ace_currdur
)

summary(
  analysis_dataset$dr_ace_statusdur
)

table(
  analysis_dataset$dr_ace_recent_1,
  useNA = "ifany"
)

# Beta blocker variables
table(
  analysis_dataset$dr_beta_cat,
  useNA = "ifany"
)

summary(
  analysis_dataset$dr_beta_currdur
)

summary(
  analysis_dataset$dr_beta_statusdur
)

table(
  analysis_dataset$dr_beta_recent_1,
  useNA = "ifany"
)