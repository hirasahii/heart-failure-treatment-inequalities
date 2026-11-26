# Censoring 
censor_check <- analysis_dataset

# Convert dates 
censor_check$indexdate  <- as.Date(censor_check$indexdate, format = "%d%b%Y")

censor_check$regenddate <- as.Date(censor_check$regenddate, format = "%d%b%Y")

censor_check$ons_ddate  <- as.Date(censor_check$ons_ddate, format = "%d%b%Y")

censor_check$lcd        <- as.Date(censor_check$lcd, format = "%d%b%Y")

# Check conversion 
summary(censor_check[, c(
  "indexdate",
  "regenddate",
  "ons_ddate",
  "lcd"
)])

# Exit date 
censor_check$exit_date <- pmin(
  censor_check$regenddate,
  censor_check$ons_ddate,
  censor_check$lcd,
  na.rm = TRUE
)
summary(censor_check$exit_date)

# Date
censor_check$followup_days <- as.numeric(
  censor_check$exit_date - censor_check$indexdate
)

summary(censor_check$followup_days)
sum(censor_check$followup_days < 183, na.rm = TRUE)
mean(censor_check$followup_days < 183, na.rm = TRUE) * 100

# Censoring Reason 
censor_check$exit_reason <- ifelse(
  !is.na(censor_check$ons_ddate) &
    censor_check$ons_ddate <= censor_check$regenddate &
    censor_check$ons_ddate <= censor_check$lcd,
  "Death",
  ifelse(
    !is.na(censor_check$regenddate) &
      censor_check$regenddate <= censor_check$lcd,
    "Registration end",
    "Practice end"
  )
)

table(censor_check$exit_reason)

# Early censored 
early_fu <- subset(censor_check, followup_days < 183)

table(early_fu$exit_reason)

