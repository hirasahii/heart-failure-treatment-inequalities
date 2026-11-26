# Create patient-level analysis dataset
# Load datasets
setwd("/mnt/bmh01-rds/Carr_CPRD_CHI_RENAL-HF/Data/MSc_Project")

cohort_analysis <- readRDS(
  "Hira_Sahi/cohort_analysis.rds"
)

patient_level_longitudinal <- readRDS(
  "Hira_Sahi/patient_level_longitudinal.rds"
)

# Merge datasets
analysis_dataset <- merge(
  cohort_analysis,
  patient_level_longitudinal,
  by = "patid"
)

# Explore analysis dataset
dim(analysis_dataset)

names(analysis_dataset)

head(analysis_dataset)

# Ethnicity
table(
  analysis_dataset$ethnicity,
  useNA = "ifany"
)

# Deprivation 
table(
  analysis_dataset$imd10_pat,
  useNA = "ifany"
)

# HF subtype
table(
  analysis_dataset$HFrEF_anytime,
  useNA = "ifany"
)

table(
  analysis_dataset$HFpEF_anytime,
  useNA = "ifany"
)

# Treatment variables
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

# Save analysis dataset
saveRDS(
  analysis_dataset,
  "Hira_Sahi/analysis_dataset.rds"
)

# Create age at HF diagnosis
analysis_dataset$age_at_HF <- 
  as.numeric(
    substr(analysis_dataset$indexdate, 6, 9)) - 
  analysis_dataset$yob


# Restrict to adult patients (age 18 years and older)
analysis_dataset_adults <- analysis_dataset[
  analysis_dataset$age_at_HF >= 18,
]

dim(analysis_dataset_adults)