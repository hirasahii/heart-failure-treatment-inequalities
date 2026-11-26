# Compare models 
comparison <- data.frame(
  Variable = c(
    "Asian",
    "Black",
    "Mixed",
    "Other",
    "Unknown",
    "IMD",
    "Age",
    "Diabetes",
    "IHD",
    "AF",
    "Cardiomyopathy"
  ),
  
  WhiteRef_OR = c(
    exp(coef(model_full_white)["ethnicity_white_refAsian"]),
    exp(coef(model_full_white)["ethnicity_white_refBlack"]),
    exp(coef(model_full_white)["ethnicity_white_refMixed"]),
    exp(coef(model_full_white)["ethnicity_white_refOther"]),
    exp(coef(model_full_white)["ethnicity_white_refUnknown"]),
    exp(coef(model_full_white)["imd10_pat"]),
    exp(coef(model_full_white)["X_age_at_HF"]),
    exp(coef(model_full_white)["co_diab_any"]),
    exp(coef(model_full_white)["co_ischaemic"]),
    exp(coef(model_full_white)["co_afib"]),
    exp(coef(model_full_white)["co_cardiomyop"])
  )
)

print(comparison)
