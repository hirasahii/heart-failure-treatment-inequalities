# Load saved datasets
setwd("/mnt/bmh01-rds/Carr_CPRD_CHI_RENAL-HF/Data/MSc_Project")

cohort_small <- readRDS("Hira_Sahi/cohort_small.rds")
part1_small <- readRDS("Hira_Sahi/part1_small.rds")
part3_small <- readRDS("Hira_Sahi/part3_small.rds")
part5_small <- readRDS("Hira_Sahi/part5_small.rds")

# Check variables
names(cohort_small)
names(part1_small)
names(part3_small)
names(part5_small)

# Check dataset structure
dim(part3_small)
head(part3_small)

dim(part5_small)
head(part5_small)

# Dataset checks
length(unique(cohort_small$patid))
length(unique(part1_small$patid))
length(unique(part3_small$patid))
length(unique(part5_small$patid))

all(part1_small$patid == part3_small$patid)
all(part1_small$patid == part5_small$patid)

nrow(part1_small)
nrow(part3_small)
nrow(part5_small)

all(part1_small$patid == part5_small$patid &
      part1_small$patid == part3_small$patid)

# Findings from dataset checks
# cohort_small
# 231,708 unique patients
# One row per patient

# part1_small
# 224,623 unique patients

# part3_small
# 224,623 unique patients

# part5_small
# 224,623 unique patients

# part1_small, part3_small and part5_small
# have identical row counts (5,084,919)

# all(part1_small$patid == part3_small$patid) = TRUE

# all(part1_small$patid == part5_small$patid) = TRUE

# Conclusion:
# part1_small, part3_small and part5_small
# appear to be aligned row-for-row

# Create longitudinal dataset
longitudinal_dataset <- cbind(
  part1_small,
  part3_small[, -1],
  part5_small[, -1]
)

# Save longitudinal dataset
saveRDS(
  longitudinal_dataset,
  "Hira_Sahi/longitudinal_dataset.rds"
)

# Explore longitudinal dataset
dim(longitudinal_dataset)

length(unique(longitudinal_dataset$patid))

head(longitudinal_dataset[, c(
  "patid",
  "obsdate",
  "serum_creatinine",
  "e_gfr"
)])

# Findings from longitudinal dataset
# longitudinal_dataset contains:
# 5,084,919 observations
# 35 variables
# 224,623 unique patients

# One patient can have multiple observations
# Example patient:
# Multiple obsdates with different
# creatinine and eGFR values
# One row appears to represent an
# observation/measurement for a patient
# on a specific date

# Investigating X_time_since_HF
# Documentation identifies X_time_since_HF
# as a longitudinal panel structure variable

# Example patient:
# indexdate = 25sep2011

# Observations before indexdate had
# X_time_since_HF = NA

# Observations after indexdate had
# positive X_time_since_HF values

# This suggests X_time_since_HF may represent
# follow-up time relative to HF diagnosis
# Interpretation not yet confirmed and
# should be verified before formal analysis
# FALSE = 2,144,295 observations
# TRUE = 2,940,624 observations
# Observations before HF diagnosis may have
# X_time_since_HF = NA
# Observations after HF diagnosis may have
# positive X_time_since_HF values

# Create analysis patient IDs
analysis_patids <- intersect(
  cohort_small$patid,
  longitudinal_dataset$patid
)

length(analysis_patids)

# Create patient-level cohort
cohort_analysis <- cohort_small[
  cohort_small$patid %in% analysis_patids,
]

dim(cohort_analysis)
head(cohort_analysis)

# Findings from cohort_analysis
# Patients present in both
# cohort_small and longitudinal_dataset:
# 180,092
# cohort_analysis:
# 180,092 patients
# 9 variables
# cohort_analysis contains:
# patid
# pracid
# indexdate
# gender
# yob
# registration date
# follow-up 