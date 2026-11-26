# Dissertation analysis planning
analysis_dataset <- readRDS(
  "Hira_Sahi/analysis_dataset.rds"
)

# Exposures
# ethnicity
# imd10_pat
# Primary outcomes
# dr_ace_bin
# dr_beta_bin
# Secondary outcomes
# dr_sglt2i_bin
# dr_entresto_bin


# Demographic covariates
# age_at_HF
# gender

# Disease covariates
# HFrEF_anytime
# HFpEF_anytime

# Comorbidities
# co_diab_any
# co_ischaemic
# co_afib
# co_cardiomyop
# co_proteinuria
# co_pvd
# co_valvular

# Working findings
# ACE inhibitor receipt appears to vary across ethnic groups
# Beta blocker receipt appears to vary across ethnic groups
# ACE inhibitor receipt shows modest variation across IMD deciles
# Beta blocker receipt shows little variation across IMD deciles
# Further analyses required using adjusted regression models
# Adjusting for age, sex, HF subtype and comorbidities

# Planned regression models
# Outcome:
# dr_ace_bin

# Exposures:
# ethnicity
# imd10_pat

# Covariates:
# age_at_HF
# gender
# HFrEF_anytime
# HFpEF_anytime
# co_diab_any
# co_ischaemic
# co_afib
# co_cardiomyop
# co_proteinuria
# co_pvd
# co_valvular