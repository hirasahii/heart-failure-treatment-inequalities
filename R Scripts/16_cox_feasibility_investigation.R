# Load data
analysis_dataset2 <- readRDS(
  "Hira_Sahi/analysis_dataset2.rds"
)

# Check time-to-treatment variable
summary(
  analysis_dataset2$first_hf_treatment_time
)

# Check missing values
table(
  is.na(
    analysis_dataset2$first_hf_treatment_time
  )
)

# Check treatment outcome
table(
  analysis_dataset2$treated_within_6m
)

# Create event indicator
analysis_dataset2$treatment_event <- ifelse(
  is.na(
    analysis_dataset2$first_hf_treatment_time
  ),
  0,
  1
)

# Check event variable
table(
  analysis_dataset2$treatment_event
)

# Compare against 6-month outcome
table(
  analysis_dataset2$treatment_event,
  analysis_dataset2$treated_within_6m
)

# Load survival package
library(
  survival
)

# Cox model
cox_ethnicity <- coxph(
  Surv(
    first_hf_treatment_time,
    treatment_event
  ) ~ ethnicity,
  data = analysis_dataset2
)

summary(
  cox_ethnicity
)

exp(
  coef(
    cox_ethnicity
  )
)

# Check whether censoring is possible
summary(
  analysis_dataset2$first_hf_treatment_time
)

table(
  analysis_dataset2$treatment_event,
  useNA = "ifany"
)

# Check available follow-up variables
names(
  analysis_dataset2
)

# Check censoring variables
summary(
  analysis_dataset2$regenddate
)

summary(
  analysis_dataset2$ons_ddate
)

summary(
  analysis_dataset2$lcd
)

summary(
  analysis_dataset2$indexdate
)

summary(
  analysis_dataset2$obsdate
)

# Inspect dates
head(
  analysis_dataset2$regenddate
)

head(
  analysis_dataset2$ons_ddate
)

head(
  analysis_dataset2$lcd
)

head(
  analysis_dataset2$obsdate
)

head(
  analysis_dataset2$indexdate
)

# Convert dates
analysis_dataset2$indexdate_date <- as.Date(
  analysis_dataset2$indexdate,
  format = "%d%b%Y"
)

analysis_dataset2$obsdate_date <- as.Date(
  analysis_dataset2$obsdate,
  format = "%d%b%Y"
)

analysis_dataset2$lcd_date <- as.Date(
  analysis_dataset2$lcd,
  format = "%d%b%Y"
)

# Check conversion
summary(
  analysis_dataset2$indexdate_date
)

summary(
  analysis_dataset2$obsdate_date
)

summary(
  analysis_dataset2$lcd_date
)

# Calculate available follow-up
analysis_dataset2$follow_up_years <- as.numeric(
  analysis_dataset2$lcd_date -
    analysis_dataset2$indexdate_date
) / 365.25

summary(
  analysis_dataset2$follow_up_years
)

# Compare treatment time with follow-up
summary(
  analysis_dataset2$first_hf_treatment_time
)

table(
  analysis_dataset2$follow_up_years <
    analysis_dataset2$first_hf_treatment_time,
  useNA = "ifany"
)

# Exploratory Kaplan-Meier plot
km_fit <- survfit(
  Surv(
    first_hf_treatment_time,
    treatment_event
  ) ~ ethnicity,
  data = analysis_dataset2
)

plot(
  km_fit,
  xlab = "Years since HF diagnosis",
  ylab = "Probability of remaining untreated",
  col = 1:6,
  lwd = 2
)

legend(
  "topright",
  legend = levels(
    as.factor(
      analysis_dataset2$ethnicity
    )
  ),
  col = 1:6,
  lwd = 2,
  cex = 0.8
)

summary(km_fit)

# Summary
# Cox regression feasibility investigated
# Treatment event variable created
# First treatment times available for 42,643 patients
# Follow-up time successfully derived from LCD and HF diagnosis dates
# Treatment times occurred within observed follow-up
# Initial Cox model successfully fitted
# Further work would be required to incorporate censoring fully