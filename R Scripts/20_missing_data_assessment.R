# Missing data assessment
analysis_dataset2 <- readRDS(
  "Hira_Sahi/analysis_dataset2.rds"
)

# Percentage missing
missing_summary <- sapply(
  analysis_dataset2,
  function(x)
    sum(is.na(x))
)

missing_percent <- (
  missing_summary /
    nrow(analysis_dataset2)
) * 100

sort(
  missing_percent,
  decreasing = TRUE
)

# Complete case indicator for fully adjusted model
analysis_dataset2$complete_case <- complete.cases(
  analysis_dataset2[
    ,
    c(
      "treated_within_6m",
      "ethnicity",
      "imd10_pat",
      "X_age_at_HF",
      "gender",
      "co_diab_any",
      "co_ischaemic",
      "co_afib",
      "co_cardiomyop",
      "co_proteinuria",
      "co_pvd",
      "co_valvular",
      "aki_prior",
      "bmi_prior"
    )
  ]
)

# Check numbers
table(
  analysis_dataset2$complete_case
)

# Age comparison
tapply(
  analysis_dataset2$X_age_at_HF,
  analysis_dataset2$complete_case,
  summary
)

# Sex comparison
prop.table(
  table(
    analysis_dataset2$complete_case,
    analysis_dataset2$gender
  ),
  1
)

# Ethnicity comparison
prop.table(
  table(
    analysis_dataset2$complete_case,
    analysis_dataset2$ethnicity
  ),
  1
)

# IMD comparison
tapply(
  analysis_dataset2$imd10_pat,
  analysis_dataset2$complete_case,
  summary
)

# Summary
# Missing data assessed across analysis_dataset2
# Large missingness was observed for AKI and HF subtype variables
# Complete-case analyses resulted in substantial reductions
# in sample size
# Complete-case participants were slightly older than
# excluded participants
# Sex, ethnicity and deprivation distributions were broadly
# similar between included and excluded patients
# Missingness is therefore likely to have had a greater
# impact on precision and sample size than on overall
# cohort composition