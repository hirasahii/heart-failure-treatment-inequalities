# Dissertation figures
analysis_dataset <- readRDS(
  "Hira_Sahi/analysis_dataset.rds"
)

# ACE inhibitor receipt by ethnicity
# Objective 2
ethnicity_names <- c(
  "Asian",
  "Black",
  "Other",
  "Mixed",
  "White",
  "Unknown"
)

ace_percent <- c(
  30.6,
  29.7,
  27.4,
  26.7,
  26.4,
  23.4
)

barplot(
  ace_percent,
  names.arg = ethnicity_names,
  col = "steelblue",
  ylab = "ACE inhibitor receipt (%)",
  main = "ACE inhibitor receipt by ethnicity"
)

# Beta-blocker receipt by ethnicity
# Objective 2
ethnicity_names_beta <- c(
  "White",
  "Asian",
  "Other",
  "Mixed",
  "Black",
  "Unknown"
)

beta_percent <- c(
  31.8,
  29.8,
  28.7,
  27.1,
  27.0,
  25.7
)

barplot(
  beta_percent,
  names.arg = ethnicity_names_beta,
  col = "steelblue",
  ylab = "Beta-blocker receipt (%)",
  main = "Beta-blocker receipt by ethnicity"
)

# Heart failure subtype prevalence
# Objective 4
subtype_names <- c(
  "HFrEF",
  "HFpEF",
  "Missing"
)

subtype_counts <- c(
  66338,
  15361,
  99625
)

barplot(
  subtype_counts,
  names.arg = subtype_names,
  col = "steelblue",
  ylab = "Number of patients",
  main = "Heart failure subtype prevalence"
)

# ACE inhibitor receipt by deprivation
# Objective 2
imd_names <- c(
  "1","2","3","4","5",
  "6","7","8","9","10"
)

ace_imd <- c(
  25.4,
  25.8,
  26.0,
  26.2,
  26.4,
  26.5,
  26.7,
  26.8,
  27.0,
  27.1
)

barplot(
  ace_imd,
  names.arg = imd_names,
  col = "steelblue",
  ylab = "ACE inhibitor receipt (%)",
  xlab = "IMD decile",
  main = "ACE inhibitor receipt by deprivation"
)

# Beta-blocker receipt by deprivation
# Objective 2
imd_names_beta <- c(
  "1","2","3","4","5",
  "6","7","8","9","10"
)

beta_imd <- c(
  31.5,
  31.7,
  31.9,
  32.0,
  32.1,
  32.2,
  32.4,
  32.6,
  32.8,
  31.1
)

barplot(
  beta_imd,
  names.arg = imd_names_beta,
  col = "steelblue",
  ylab = "Beta-blocker receipt (%)",
  xlab = "IMD decile",
  main = "Beta-blocker receipt by deprivation"
)