# Variable Investigation 
# Load data
analysis_dataset <- readRDS(
  "Hira_Sahi/analysis_dataset.rds"
)

patient_level_longitudinal <- readRDS(
  "Hira_Sahi/patient_level_longitudinal.rds"
)

part5_small <- readRDS(
  "Hira_Sahi/part5_small.rds"
)

# View treatment variables
names(part5_small)

# View longitudinal variables
names(patient_level_longitudinal)

# Set WD 
setwd("/mnt/bmh01-rds/Carr_CPRD_CHI_RENAL-HF/Data/MSc_Project")

part5_full <- read.csv(
  "data_Longit_v2/long_training_part5.txt"
)

# Add additional variables to part 5
part5_small <- part5_full[
  ,
  c(
    "patid",
    
    "dr_ace_bin",
    "dr_ace_prior",
    "dr_ace_recent",
    "dr_ace_cat",
    "dr_ace_currdur",
    "dr_ace_totaldur",
    "dr_ace_statusdur",
    "dr_ace_recent_1",
    
    "dr_beta_bin",
    "dr_beta_prior",
    "dr_beta_recent",
    "dr_beta_cat",
    "dr_beta_currdur",
    "dr_beta_totaldur",
    "dr_beta_statusdur",
    "dr_beta_recent_1",
    
    "dr_sglt2i_bin",
    "dr_sglt2i_prior",
    "dr_sglt2i_recent",
    "dr_sglt2i_cat",
    "dr_sglt2i_currdur",
    "dr_sglt2i_totaldur",
    "dr_sglt2i_statusdur",
    "dr_sglt2i_recent_1",
    
    "dr_entresto_bin",
    "dr_entresto_prior",
    "dr_entresto_recent",
    "dr_entresto_cat",
    "dr_entresto_currdur",
    "dr_entresto_totaldur",
    "dr_entresto_statusdur",
    "dr_entresto_recent_1"
  )
]

#Save modified part 5 
saveRDS(
  part5_small,
  "Hira_Sahi/part5_small.rds"
)

# Load existing datasets
part1_small <- readRDS(
  "Hira_Sahi/part1_small.rds"
)

part3_small <- readRDS(
  "Hira_Sahi/part3_small.rds"
)

# Update longitudinal dataset
longitudinal_dataset <- cbind(
  part1_small,
  part3_small[, -1],
  part5_small[, -1]
)

# Save over old version
saveRDS(
  longitudinal_dataset,
  "Hira_Sahi/longitudinal_dataset.rds"
)

# Update patient-level dataset
library(dplyr)
patient_level_longitudinal <- longitudinal_dataset %>%
  dplyr::group_by(patid) %>%
  dplyr::slice_tail(n = 1) %>%
  dplyr::ungroup()

# Save over old version
saveRDS(
  patient_level_longitudinal,
  "Hira_Sahi/patient_level_longitudinal.rds"
)

# Load cohort
cohort_analysis <- readRDS(
  "Hira_Sahi/cohort_analysis.rds"
)

# Update analysis dataset
analysis_dataset <- merge(
  cohort_analysis,
  patient_level_longitudinal,
  by = "patid"
)

# Save over old version
saveRDS(
  analysis_dataset,
  "Hira_Sahi/analysis_dataset.rds"
)
