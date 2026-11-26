# Load data
analysis_dataset <- readRDS(
  "Hira_Sahi/analysis_dataset.rds"
)

# Check HF timing variable
summary(
  analysis_dataset$X_time_since_HF
)

# ACE initiation
summary(
  analysis_dataset$X_time_since_HF[
    analysis_dataset$dr_ace_recent_1 == 1
  ]
)

# Beta blocker initiation
summary(
  analysis_dataset$X_time_since_HF[
    analysis_dataset$dr_beta_recent_1 == 1
  ]
)

# SGLT2 initiation
summary(
  analysis_dataset$X_time_since_HF[
    analysis_dataset$dr_sglt2i_recent_1 == 1
  ]
)

# Entresto initiation
summary(
  analysis_dataset$X_time_since_HF[
    analysis_dataset$dr_entresto_recent_1 == 1
  ]
)

# Investigate X_time_since_HF units
summary(
  analysis_dataset$X_time_since_HF
)

quantile(
  analysis_dataset$X_time_since_HF,
  probs = c(
    0,
    0.01,
    0.05,
    0.10,
    0.25,
    0.50,
    0.75,
    0.90,
    0.95,
    0.99,
    1
  ),
  na.rm = TRUE
)

# Check observation date
summary(
  analysis_dataset$obsdate
)

# ACE initiation within potential time windows
table(
  analysis_dataset$dr_ace_recent_1,
  analysis_dataset$X_time_since_HF <= 0.5,
  useNA = "ifany"
)

table(
  analysis_dataset$dr_ace_recent_1,
  analysis_dataset$X_time_since_HF <= 1,
  useNA = "ifany"
)

# Beta initiation within potential time windows
table(
  analysis_dataset$dr_beta_recent_1,
  analysis_dataset$X_time_since_HF <= 0.5,
  useNA = "ifany"
)

table(
  analysis_dataset$dr_beta_recent_1,
  analysis_dataset$X_time_since_HF <= 1,
  useNA = "ifany"
)

# SGLT2 initiation within potential time windows
table(
  analysis_dataset$dr_sglt2i_recent_1,
  analysis_dataset$X_time_since_HF <= 0.5,
  useNA = "ifany"
)

table(
  analysis_dataset$dr_sglt2i_recent_1,
  analysis_dataset$X_time_since_HF <= 1,
  useNA = "ifany"
)

# Entresto initiation within potential time windows
table(
  analysis_dataset$dr_entresto_recent_1,
  analysis_dataset$X_time_since_HF <= 0.5,
  useNA = "ifany"
)

table(
  analysis_dataset$dr_entresto_recent_1,
  analysis_dataset$X_time_since_HF <= 1,
  useNA = "ifany"
)

# Create treatment within 6 months variable
analysis_dataset$treated_within_6m <- ifelse(
  (
    analysis_dataset$dr_ace_recent_1 == 1 |
      analysis_dataset$dr_beta_recent_1 == 1 |
      analysis_dataset$dr_sglt2i_recent_1 == 1 |
      analysis_dataset$dr_entresto_recent_1 == 1
  ) &
    analysis_dataset$X_time_since_HF <= 0.5,
  1,
  0
)

# Check frequency
table(
  analysis_dataset$treated_within_6m,
  useNA = "ifany"
)

# Percentage treated within 6 months
prop.table(
  table(
    analysis_dataset$treated_within_6m,
    useNA = "ifany"
  )
) * 100

# Compare treatment variables
table(
  analysis_dataset$dr_ace_bin,
  useNA = "ifany"
)

table(
  analysis_dataset$dr_beta_bin,
  useNA = "ifany"
)

table(
  analysis_dataset$dr_sglt2i_bin,
  useNA = "ifany"
)

table(
  analysis_dataset$dr_entresto_bin,
  useNA = "ifany"
)

# Compare with initiation variable
table(
  analysis_dataset$dr_ace_bin,
  analysis_dataset$dr_ace_recent_1,
  useNA = "ifany"
)

table(
  analysis_dataset$dr_beta_bin,
  analysis_dataset$dr_beta_recent_1,
  useNA = "ifany"
)

# Check ACE initiation rows in longitudinal data
table(
  longitudinal_dataset$dr_ace_recent_1,
  useNA = "ifany"
)

# Number of ACE initiation rows per patient
library(dplyr)

ace_initiation_check <- longitudinal_dataset %>%
  filter(dr_ace_recent_1 == 1) %>%
  group_by(patid) %>%
  summarise(
    n_rows = n()
  )

summary(
  ace_initiation_check$n_rows
)

table(
  ace_initiation_check$n_rows,
  useNA = "ifany"
)

# Examine ACE initiation observations
ace_rows <- longitudinal_dataset %>%
  filter(dr_ace_recent_1 == 1)

summary(
  ace_rows$X_time_since_HF
)

summary(
  ace_rows$dr_ace_statusdur
)

summary(
  ace_rows$dr_ace_currdur
)

# First ACE initiation observation per patient
ace_first <- longitudinal_dataset %>%
  filter(dr_ace_recent_1 == 1) %>%
  group_by(patid) %>%
  slice_min(
    X_time_since_HF,
    with_ties = FALSE
  ) %>%
  ungroup()

summary(
  ace_first$X_time_since_HF
)

nrow(
  ace_first
)