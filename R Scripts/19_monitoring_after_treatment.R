# Load data
analysis_dataset2 <- readRDS(
  "Hira_Sahi/analysis_dataset2.rds"
)

longitudinal_dataset <- readRDS(
  "Hira_Sahi/longitudinal_dataset.rds"
)

# Check data
dim(
  longitudinal_dataset
)

names(
  longitudinal_dataset
)

# ACE initiation observations
library(dplyr)

ace_start <- longitudinal_dataset %>%
  filter(
    dr_ace_recent_1 == 1
  ) %>%
  group_by(
    patid
  ) %>%
  slice_min(
    X_time_since_HF,
    with_ties = FALSE
  ) %>%
  ungroup()

# Check dataset
dim(
  ace_start
)

summary(
  ace_start$X_time_since_HF
)

# Keep variables needed for monitoring
ace_start_small <- ace_start %>%
  select(
    patid,
    ace_start_time = X_time_since_HF
  )

# Remove missing start times
ace_start_small <- ace_start_small %>%
  filter(
    !is.na(
      ace_start_time
    )
  )

# Check result
dim(
  ace_start_small
)

summary(
  ace_start_small$ace_start_time
)

# Join initiation times back to longitudinal data
ace_monitoring <- longitudinal_dataset %>%
  inner_join(
    ace_start_small,
    by = "patid"
  )

# Keep observations after treatment initiation
ace_monitoring_after <- ace_monitoring %>%
  filter(
    X_time_since_HF >
      ace_start_time
  )

# Check
dim(
  ace_monitoring_after
)

summary(
  ace_monitoring_after$X_time_since_HF
)

# First monitoring observation after treatment
ace_first_monitor <- ace_monitoring_after %>%
  group_by(
    patid
  ) %>%
  slice_min(
    X_time_since_HF,
    with_ties = FALSE
  ) %>%
  ungroup()

# Monitoring delay
ace_first_monitor$monitor_delay_years <-
  ace_first_monitor$X_time_since_HF -
  ace_first_monitor$ace_start_time

# Check monitoring delay
summary(
  ace_first_monitor$monitor_delay_years
)

dim(
  ace_first_monitor
)

# Monitoring within 6 months
ace_first_monitor$monitored_within_6m <- ifelse(
  ace_first_monitor$monitor_delay_years <= 0.5,
  1,
  0
)

# Check monitoring adherence
table(
  ace_first_monitor$monitored_within_6m
)

prop.table(
  table(
    ace_first_monitor$monitored_within_6m
  )
) * 100

# Monitoring by ethnicity
table(
  ace_first_monitor$ethnicity,
  ace_first_monitor$monitored_within_6m
)

prop.table(
  table(
    ace_first_monitor$ethnicity,
    ace_first_monitor$monitored_within_6m
  ),
  1
)

# Monitoring model
model_monitor_ethnicity <- glm(
  monitored_within_6m ~
    ethnicity,
  family = binomial(),
  data = ace_first_monitor
)

summary(
  model_monitor_ethnicity
)

exp(
  coef(
    model_monitor_ethnicity
  )
)

exp(
  confint(
    model_monitor_ethnicity
  )
)

# Summary
# Monitoring after treatment initiation assessed
# First ACE initiation observations identified
# First post-treatment monitoring observation identified
# Monitoring delay calculated
# Monitoring within 6 months calculated
# 31,681 patients had an identifiable initiation anD
# subsequent monitoring observation
# Median monitoring delay = 0.145 years
# 77.9% were monitored within 6 months
# Monitoring patterns differed across ethnic groups
# Exploratory ethnicity model fitted