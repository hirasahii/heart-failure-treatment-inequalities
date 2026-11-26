# Ethnic and Socioeconomic Inequalities in Heart Failure Treatment

This repository contains the R code and selected non-disclosive outputs developed for my MSc Health Data Science dissertation at the University of Manchester.

The dissertation investigated whether the initiation of NICE-recommended pharmacological treatment following a diagnosis of heart failure differed according to ethnicity and socioeconomic deprivation in English primary care. The study used routinely collected electronic health record data from the Clinical Practice Research Datalink (CPRD) Aurum.

The project combined epidemiological study design, longitudinal electronic health record data curation, statistical modelling, sensitivity analyses and exploratory time-to-event analyses to examine inequalities across the heart failure care pathway.

---

## Research Question

Although inequalities in heart failure incidence, diagnosis and clinical outcomes are well documented, considerably less is known about whether inequalities persist after diagnosis and affect the receipt of recommended pharmacological treatment.

The primary research question was:

**Does initiation of NICE-recommended heart failure pharmacological treatment following diagnosis vary according to ethnicity and socioeconomic deprivation in English primary care?**

The dissertation also examined:

- whether treatment initiation differed between ethnic groups;
- whether treatment initiation was associated with socioeconomic deprivation;
- whether these inequalities changed between 2005 and 2022;
- whether associations differed according to recorded heart failure subtype;
- whether the findings were robust to alternative analytical definitions and assumptions; and
- whether inequalities might extend beyond prescribing into subsequent renal function monitoring.

---

## Study Design

A retrospective cohort study was conducted using routinely collected primary care data from CPRD Aurum.

The study population consisted of adults aged 18 years or older with a first recorded diagnosis of heart failure between 2005 and 2022.

Patients were required to have at least 12 months of registration before the recorded heart failure diagnosis to allow ascertainment of baseline demographic and clinical characteristics and to reduce the risk of misclassifying prevalent heart failure as newly diagnosed disease.

### Cohort construction

The analytical cohort was developed in several stages:

- **231,708 patients** with a recorded diagnosis of heart failure were initially identified.
- Following linkage with the longitudinal data, **224,623 patients** remained.
- Application of the study eligibility criteria produced a final analytical cohort of **180,092 adults**.
- Complete information for variables included in the primary fully adjusted model was available for **179,934 patients (99.9%)**.

Patients were followed from their recorded heart failure diagnosis until the relevant outcome or censoring event, where applicable.

---

## Exposures and Outcome

### Primary exposures

The two primary exposures were:

- **Ethnicity**, categorised as White, Asian, Black, Mixed, Other or Unknown.
- **Socioeconomic deprivation**, measured using the Index of Multiple Deprivation (IMD) decile score.

Lower IMD deciles represented greater socioeconomic deprivation, while higher deciles represented lower deprivation.

### Primary outcome

The primary outcome was:

**Initiation of at least one NICE-recommended heart failure medication within six months of the recorded heart failure diagnosis.**

Prescribing records were used to identify relevant heart failure therapies, including:

- ACE inhibitors / angiotensin receptor blockers;
- beta-blockers;
- mineralocorticoid receptor antagonists; and
- SGLT2 inhibitors.

The six-month outcome was intended as a pragmatic measure of early treatment initiation following diagnosis rather than a measure of complete adherence to NICE heart failure guidance.

A twelve-month treatment-initiation definition was additionally examined as part of sensitivity analysis.

---

## Covariates

The statistical analyses incorporated demographic and clinical characteristics that could influence treatment initiation.

These included:

- Age at heart failure diagnosis
- Sex
- Body mass index
- Diabetes
- Acute kidney injury
- Ischaemic heart disease
- Atrial fibrillation
- Cardiomyopathy
- Other relevant cardiovascular characteristics
- Calendar year of diagnosis

Recorded heart failure subtype was also examined in additional analyses, distinguishing between heart failure with reduced ejection fraction (HFrEF) and heart failure with preserved ejection fraction (HFpEF) where subtype information was available.

---

## Statistical Analysis

### Descriptive analysis

Baseline demographic and clinical characteristics were summarised for the overall cohort.

Treatment initiation within six months was then examined overall and according to ethnicity and socioeconomic deprivation.

### Logistic regression

Multivariable logistic regression was used for the primary analysis because the main outcome was a binary indicator of whether treatment was initiated within six months of diagnosis.

Models progressed from simpler specifications to fully adjusted analyses incorporating demographic and clinical characteristics.

The primary fully adjusted model examined the independent associations of ethnicity and socioeconomic deprivation with treatment initiation while adjusting for relevant potential confounders.

Results were reported as odds ratios (ORs) with 95% confidence intervals.

### Practice-level clustering

Because patients were clustered within general practices, robust standard errors clustered at practice level were used as a robustness analysis to account for non-independence of observations within practices.

### Temporal analyses

Calendar time was examined to determine whether treatment patterns and inequalities changed over the study period.

Interaction terms were fitted between:

- ethnicity and calendar year; and
- IMD and calendar year.

These analyses assessed whether inequalities appeared to widen, narrow or remain relatively stable between 2005 and 2022.

### Heart failure subtype analyses

Additional analyses were performed among patients with recorded HFrEF and HFpEF.

The analyses examined whether associations between ethnicity and prescribing differed according to heart failure subtype.

Because multiple ethnicity comparisons were undertaken, Benjamini-Hochberg adjusted p-values were used to assess the robustness of the subtype-specific findings.

### Time-to-event analyses

The timing of treatment initiation was additionally explored using:

- Kaplan-Meier methods; and
- Cox proportional hazards models.

These analyses complemented the primary fixed six-month outcome by examining differences in time to treatment following heart failure diagnosis.

### Sensitivity and robustness analyses

A series of additional analyses assessed the robustness of the primary results, including:

- restriction to patients with complete ethnicity information;
- treatment initiation within twelve months rather than six months;
- practice-clustered robust standard errors;
- alternative model comparisons;
- missing-data assessment;
- complete-case auditing;
- outcome validation and reconstruction;
- assessment of follow-up and censoring; and
- additional model and outcome robustness checks.

### Exploratory renal monitoring analysis

The dissertation also explored renal function monitoring following treatment initiation.

Among patients with the necessary treatment and monitoring information, the analysis examined whether renal function monitoring following ACE inhibitor initiation differed between ethnic groups.

This analysis was exploratory and was intended to investigate whether inequalities might extend beyond treatment initiation into subsequent follow-up care.

---

# Results

## Study Population

The final cohort contained **180,092 patients** with a first recorded heart failure diagnosis between 2005 and 2022.

The mean age at diagnosis was **75.3 years**, with a median age of **77 years**, and **55.5%** of the study population was male.

The cohort was predominantly White:

- White: **165,896 (92.1%)**
- Asian: **6,403 (3.6%)**
- Black: **3,914 (2.2%)**
- Other: **1,469 (0.8%)**
- Mixed: **561 (0.3%)**
- Unknown ethnicity: **1,849 (1.0%)**

Heart failure subtype was unavailable for a substantial proportion of the cohort. Recorded HFrEF was available for 66,338 patients and HFpEF for 15,361 patients, while subtype information was missing for approximately 55% of the cohort.

---

## Treatment Initiation

Overall, **33,955 patients (18.9%)** initiated at least one NICE-recommended heart failure medication within six months of diagnosis.

Crude treatment-initiation rates differed across ethnic groups:

- Asian: **13.9%**
- Black: **14.5%**
- Mixed: **17.6%**
- Other: **17.8%**
- White: **19.1%**
- Unknown ethnicity: **22.5%**

These differences remained evident after adjustment for demographic and clinical characteristics.

---

## Ethnic Inequalities

In the fully adjusted model, substantial differences in treatment initiation remained between ethnic groups.

Compared with White patients:

- **Asian patients had 34% lower odds of treatment initiation**  
  OR **0.66**, 95% CI **0.62–0.71**

- **Black patients had 37% lower odds of treatment initiation**  
  OR **0.63**, 95% CI **0.57–0.69**

- Mixed ethnicity patients had lower odds of treatment initiation  
  OR **0.73**, 95% CI **0.58–0.91**

- Patients classified within the Other ethnicity group also had lower odds  
  OR **0.81**, 95% CI **0.70–0.93**

There was comparatively little evidence of a difference between patients with unknown ethnicity and White patients after full adjustment.

These findings indicate that the observed ethnic differences were not explained entirely by the demographic and clinical characteristics incorporated into the statistical model.

---

## Socioeconomic Inequalities

Treatment initiation also varied according to socioeconomic deprivation, although the magnitude of the association was smaller than the differences observed across ethnic groups.

When IMD was modelled continuously, each one-unit increase in IMD decile was associated with slightly lower adjusted odds of treatment initiation:

**OR 0.99, 95% CI 0.98–0.99**

Because ethnicity and IMD were modelled using different scales, the magnitudes of the ethnicity and deprivation estimates should not be directly compared.

---

## Temporal Trends

Overall treatment initiation remained relatively stable across the study period:

- 2005–2009: **18.3%**
- 2010–2014: **18.9%**
- 2015–2018: **18.9%**
- 2019–2022: **19.3%**

Individual prescribing patterns changed over time. For example, ACE inhibitor and beta-blocker prescribing declined in relative terms as heart failure pharmacotherapy evolved and newer treatments became available.

However, there was little statistical evidence that the ethnic or socioeconomic inequalities in treatment initiation changed substantially over time.

No ethnicity-by-calendar-year interaction reached conventional levels of statistical significance.

---

## Heart Failure Subtype

Subtype-specific analyses were undertaken among patients with recorded HFrEF and HFpEF.

Some differences were observed in individual models. For example, among patients with HFrEF, Asian ethnicity was associated with lower odds of beta-blocker prescribing compared with White ethnicity.

However, after adjustment for multiple comparisons using the Benjamini-Hochberg procedure, the ethnicity-specific subtype associations were no longer statistically significant.

These results require cautious interpretation because heart failure subtype information was missing for approximately **55% of the overall cohort**.

---

## Sensitivity and Robustness Analyses

The principal results remained broadly consistent across sensitivity and robustness analyses.

Restricting the analysis to patients with complete ethnicity information produced estimates very similar to the primary analysis.

For example:

- Asian vs White: **OR 0.66 (95% CI 0.62–0.71)**
- Black vs White: **OR 0.63 (95% CI 0.57–0.69)**

A twelve-month sensitivity analysis also continued to show lower treatment initiation among Asian and Black patients:

- Asian vs White: **OR 0.62 (95% CI 0.54–0.71)**
- Black vs White: **OR 0.73 (95% CI 0.61–0.88)**

Practice-clustered robust standard errors likewise did not materially alter the primary findings.

Together, these analyses indicated that the principal findings were not dependent on a single model specification or analytical decision.

---

## Time to Treatment

Kaplan-Meier analyses provided additional evidence of differences in the timing of treatment initiation between ethnic groups.

Asian patients showed the highest probability of remaining untreated during follow-up, while patients with unknown ethnicity had the lowest probability of remaining untreated.

The time-to-event analyses therefore complemented the primary six-month binary analysis by demonstrating differences in the timing of treatment initiation.

---

## Renal Function Monitoring

The exploratory analysis examined renal function monitoring following ACE inhibitor initiation.

Among **31,681 patients** with available treatment and monitoring information, **77.9%** received renal function monitoring within six months.

Monitoring rates differed across ethnic groups:

- White: **78.3%**
- Asian: **72.3%**
- Black: **68.3%**
- Mixed: **74.7%**
- Other: **67.3%**
- Unknown: **79.6%**

Although exploratory, these findings suggested that inequalities may extend beyond the initial prescribing decision into subsequent aspects of heart failure management.

---

## Follow-up and Censoring

The project also investigated whether incomplete follow-up could influence classification of the six-month treatment outcome.

A total of **22,978 patients (12.8%)** had less than six months of available follow-up after heart failure diagnosis.

Among these patients:

- **71.8%** were censored because of death;
- **26.0%** because of deregistration from the practice; and
- **2.2%** because the practice ceased contributing data to CPRD.

This was an important consideration because patients with less than six months of follow-up may not have had the full opportunity to initiate treatment during the primary outcome window.

---

# Interpretation

The dissertation provides evidence that inequalities in heart failure care may persist **after diagnosis**, rather than being restricted to differences in disease incidence, diagnosis or clinical outcomes.

The most substantial differences were observed according to ethnicity. Asian and Black patients had markedly lower adjusted odds of initiating recommended pharmacological treatment within six months than White patients.

Socioeconomic differences were also observed, although these were more modest.

Importantly, the inequalities did not appear to disappear across the long study period. Despite substantial changes in heart failure pharmacotherapy between 2005 and 2022, including the introduction of newer therapies, overall treatment initiation and the relative inequalities between groups remained broadly stable.

The exploratory monitoring analysis additionally suggested that inequalities may not be confined to prescribing. Differences may continue into subsequent monitoring and management, although further research is required to investigate this directly.

---

# Key Strengths

Important strengths of the project included:

- A large cohort of **180,092 patients**
- Use of routinely collected CPRD Aurum primary care data
- An 18-year study period from **2005 to 2022**
- Examination of ethnicity and socioeconomic deprivation within the same analytical framework
- Adjustment for a range of demographic and clinical characteristics
- Assessment of temporal changes in inequalities
- Subtype-specific analyses
- Time-to-treatment analyses
- Multiple sensitivity and robustness analyses
- Explicit investigation of missing data and incomplete follow-up
- An exploratory extension from treatment initiation to renal function monitoring

---

# Important Limitations

Several limitations are important when interpreting the findings.

First, treatment initiation within six months is a pragmatic measure of early treatment receipt rather than complete adherence to NICE heart failure guidance. The analysis could not fully reconstruct treatment sequencing, dose titration, treatment optimisation or achievement of combination therapy.

Second, many patients had already been prescribed medications that are also used in heart failure before the recorded diagnosis. For example, **62.6% had prior ACE inhibitor exposure and 59.9% had prior beta-blocker exposure**. The 18.9% treatment-initiation estimate should therefore not be interpreted as meaning that the remaining patients were untreated.

Third, approximately **55% of patients lacked recorded heart failure subtype information**, substantially limiting interpretation of the subtype-specific analyses.

Fourth, CPRD Aurum primarily captures prescribing recorded within primary care. Treatment initiated exclusively within secondary care may therefore not have been fully captured.

Finally, residual confounding remains possible because some potentially important characteristics, including aspects of disease severity, frailty, health literacy and social support, were not available within the study dataset.

---

# Conclusion

This dissertation found evidence of inequalities in the initiation of NICE-recommended pharmacological treatment following heart failure diagnosis in English primary care.

The clearest inequalities were observed according to ethnicity. After adjustment for demographic and clinical characteristics, Asian and Black patients had substantially lower odds of initiating treatment within six months than White patients.

Socioeconomic differences were also identified, although these were more modest.

These inequalities remained relatively stable across an 18-year study period despite major developments in heart failure pharmacotherapy. Sensitivity and robustness analyses produced broadly consistent findings, strengthening confidence that the principal results were not solely attributable to one analytical decision.

The exploratory renal monitoring analysis additionally suggested that inequalities may extend beyond treatment initiation into subsequent management.

Overall, the findings indicate that inequalities in heart failure care may persist beyond diagnosis and into the delivery and monitoring of recommended treatment. Further research linking primary care prescribing with specialist care, hospital treatment and referral pathways is needed to understand the mechanisms underlying these differences and identify opportunities to improve equity in heart failure management.

---

## Repository Structure

The repository contains the R scripts used to construct, validate and analyse the study datasets, together with a curated selection of non-disclosive figures representing key analytical outputs.

```text
heart-failure-treatment-inequalities/
│
├── R Scripts/
│   ├── 01_build_analysis_dataset.R
│   ├── 02_create_patient_analysis_dataset.R
│   ├── 03_analysis_planning.R
│   ├── 04_logistic_regression_models.R
│   ├── 05_subtype_analyses.R
│   ├── 06_time_trend_analyses.R
│   ├── 07_figures.R
│   ├── 08_rebuild_datasets.R
│   ├── 09_treatment_timing_investigation.R
│   ├── 10_treatment_variable_validation.R
│   ├── 11_treatment_initiation_reconstruction.R
│   ├── 12_build_treatment_initiation_dataset.R
│   ├── 13_treatment_initiation_models.R
│   ├── 14_twelve_month_sensitivity_analysis.R
│   ├── 15_complete_ethnicity_sensitivity_analysis.R
│   ├── 16_cox_feasibility_investigation.R
│   ├── 17_robust_standard_errors.R
│   ├── 18_imd_time_interaction.R
│   ├── 19_monitoring_after_treatment.R
│   ├── 20_missing_data_assessment.R
│   ├── 21_complete_case_audit.R
│   ├── 22_compare_models.R
│   ├── 23_outcome_audit.R
│   ├── 24_further_analysis.R
│   ├── 25_additional_robustness_analyses.R
│   └── 26_censoring_death.R
│
├── Figures/
│   ├── ACE_receipt_by_ethnicity.png
│   ├── ACE_receipt_by_IMD.png
│   ├── ACE_receipt_over_time.png
│   ├── Beta_blocker_receipt_by_ethnicity.png
│   ├── Beta_blocker_receipt_by_IMD.png
│   ├── Beta_blocker_receipt_over_time.png
│   ├── Exploratory_kaplan_meier.png
│   ├── ForestPlot.png
│   └── HF_subtype_prevalence.png
│
└── README.md
```

The numbered R scripts reflect the development of the analytical workflow, from cohort construction and outcome validation through to the primary statistical models, sensitivity analyses, robustness checks and exploratory analyses.

Only selected figures and analytical outputs are included in the public repository. Intermediate, diagnostic and redundant outputs generated during development were intentionally excluded so that the repository focuses on the principal results and remains concise and interpretable.

---

## R Scripts

The `R Scripts/` directory contains the code underpinning the analytical workflow. The scripts are numbered broadly in the order in which the analysis developed.

### Data Construction and Initial Analysis

- **`01_build_analysis_dataset.R`**  
  Constructs the initial analysis dataset and prepares variables required for the statistical analyses.

- **`02_create_patient_analysis_dataset.R`**  
  Creates the patient-level analytical dataset used for subsequent descriptive and regression analyses.

- **`03_analysis_planning.R`**  
  Supports initial exploration and analytical planning, including examination of study variables, outcomes and proposed comparisons.

- **`04_logistic_regression_models.R`**  
  Fits the initial logistic regression models examining associations between patient characteristics and treatment outcomes.

- **`05_subtype_analyses.R`**  
  Examines treatment patterns according to recorded heart failure subtype.

- **`06_time_trend_analyses.R`**  
  Investigates changes in treatment receipt across calendar time.

- **`07_figures.R`**  
  Produces visualisations used to summarise and communicate the principal analytical findings.

---

### Dataset Reconstruction and Outcome Validation

During development, additional investigation of the prescribing data was undertaken to ensure that the primary treatment-initiation outcome was being defined and reconstructed appropriately.

- **`08_rebuild_datasets.R`**  
  Rebuilds analytical datasets following refinements to study definitions and the analysis workflow.

- **`09_treatment_timing_investigation.R`**  
  Investigates the timing of prescribing records relative to the recorded heart failure diagnosis.

- **`10_treatment_variable_validation.R`**  
  Validates the treatment variables used to identify relevant heart failure pharmacotherapy.

- **`11_treatment_initiation_reconstruction.R`**  
  Reconstructs the treatment-initiation outcome using prescription timing relative to heart failure diagnosis.

- **`12_build_treatment_initiation_dataset.R`**  
  Produces the treatment-initiation dataset used in the subsequent primary analyses.

This stage of the workflow was particularly important because many medications recommended for heart failure also have other clinical indications and could have been prescribed before the recorded heart failure diagnosis.

---

### Primary Treatment-Initiation Analysis

- **`13_treatment_initiation_models.R`**  
  Fits the principal treatment-initiation models examining ethnicity and socioeconomic deprivation while adjusting for relevant demographic and clinical characteristics.

This represents the main inferential analysis underpinning the study conclusions.

---

### Sensitivity Analysis

- **`14_twelve_month_sensitivity_analysis.R`**  
  Repeats the treatment-initiation analysis using a twelve-month rather than six-month outcome window to assess sensitivity to the definition of treatment initiation.

- **`15_complete_ethnicity_sensitivity_analysis.R`**  
  Repeats the principal analyses after restricting the cohort to patients with recorded ethnicity information.

These analyses assess whether the primary findings are sensitive to alternative outcome definitions or the handling of missing ethnicity information.

---

### Time-to-Event and Robustness Analysis

- **`16_cox_feasibility_investigation.R`**  
  Investigates the feasibility of modelling time to treatment initiation using Cox proportional hazards methods.

- **`17_robust_standard_errors.R`**  
  Applies practice-clustered robust standard errors to account for clustering of patients within general practices.

- **`18_imd_time_interaction.R`**  
  Examines whether the relationship between socioeconomic deprivation and treatment initiation changed over calendar time.

These analyses extend the primary logistic regression framework by examining treatment timing, potential within-practice correlation and temporal variation in inequalities.

---

### Exploratory Follow-up Care Analysis

- **`19_monitoring_after_treatment.R`**  
  Examines renal function monitoring following treatment initiation as an exploratory extension of the primary analysis.

This analysis investigates whether inequalities could extend beyond the initial treatment decision into subsequent monitoring and management.

---

### Missing Data and Analytical Sample Assessment

- **`20_missing_data_assessment.R`**  
  Examines the extent and distribution of missing information across variables used in the analytical workflow.

- **`21_complete_case_audit.R`**  
  Audits the complete-case sample used for adjusted modelling and identifies the effect of missing covariate information on inclusion in the final analyses.

Explicit assessment of missing data was used to distinguish missingness in individual variables from changes in the effective analytical sample.

---

### Model and Outcome Auditing

- **`22_compare_models.R`**  
  Compares model specifications and evaluates the consistency of estimates across analytical approaches.

- **`23_outcome_audit.R`**  
  Performs additional checks of the primary treatment-initiation outcome and its classification.

These scripts provide additional validation that the principal findings are not simply artefacts of a particular model specification or outcome-construction decision.

---

### Additional Robustness Analyses

- **`24_further_analysis.R`**  
  Contains additional analyses undertaken to further investigate and contextualise the main findings.

- **`25_additional_robustness_analyses.R`**  
  Conducts further robustness checks designed to assess the stability of the primary results under alternative analytical decisions.

- **`26_censoring_death.R`**  
  Investigates incomplete follow-up within the treatment-assessment window, including the contribution of death, deregistration and other censoring mechanisms.

Together, the later scripts document the checks undertaken to understand the robustness, interpretation and limitations of the primary analysis.

---

## Figures

The `Figures/` directory contains a **curated selection of final, non-disclosive analytical figures**. Not every figure generated during development has been retained. Exploratory, intermediate and redundant figures were excluded where they did not add substantially to the interpretation of the final project.

The retained figures represent the main descriptive, adjusted and time-to-event components of the analysis.

### Treatment Receipt by Ethnicity

- **`ACE_receipt_by_ethnicity.png`**  
  Displays ACE inhibitor receipt across ethnic groups.

- **`Beta_blocker_receipt_by_ethnicity.png`**  
  Displays beta-blocker receipt across ethnic groups.

These figures provide descriptive visualisation of differences in receipt of two important classes of heart failure pharmacotherapy.

### Treatment Receipt by Socioeconomic Deprivation

- **`ACE_receipt_by_IMD.png`**  
  Displays ACE inhibitor receipt according to socioeconomic deprivation.

- **`Beta_blocker_receipt_by_IMD.png`**  
  Displays beta-blocker receipt according to socioeconomic deprivation.

These figures complement the regression analyses by showing how treatment receipt varies across the socioeconomic distribution.

### Treatment Patterns Over Time

- **`ACE_receipt_over_time.png`**  
  Shows changes in ACE inhibitor receipt across calendar time.

- **`Beta_blocker_receipt_over_time.png`**  
  Shows changes in beta-blocker receipt across calendar time.

These visualisations place the inequality analyses within the wider context of changing heart failure prescribing patterns between 2005 and 2022.

### Adjusted Associations

- **`ForestPlot.png`**  
  Presents adjusted effect estimates from the regression analysis, allowing the magnitude and uncertainty of associations with treatment initiation to be compared visually.

### Heart Failure Subtype

- **`HF_subtype_prevalence.png`**  
  Summarises the distribution of recorded heart failure subtype within the study population and provides context for the subtype-specific analyses.

### Time to Treatment

- **`Exploratory_kaplan_meier.png`**  
  Presents the exploratory Kaplan-Meier analysis of time to treatment initiation.

The Kaplan-Meier analysis complements the primary six-month binary outcome by considering when treatment initiation occurred during follow-up.

Overall, the figures were selected to represent the main stages of the analysis without reproducing every diagnostic or exploratory plot generated during development.

---

## Code, Software and Data Availability

### Software

All analyses were conducted in **R 4.4.2**.

Key packages used across the analytical workflow included:

- `dplyr` for data manipulation and preparation;
- `ggplot2` for data visualisation;
- `lmtest` and `sandwich` for regression inference and robust variance estimation; and
- `survival` for Kaplan-Meier and Cox proportional hazards analyses.

Additional R functionality was used throughout the workflow for data validation, model checking, summary statistics and production of analytical outputs.

### Reproducibility

The numbered scripts preserve the development and progression of the analytical workflow and provide a transparent record of the principal data-management and statistical-analysis steps.

The scripts cover:

- analytical cohort construction;
- patient-level dataset creation;
- treatment-variable validation;
- treatment-outcome reconstruction;
- descriptive analyses;
- multivariable regression modelling;
- heart failure subtype analyses;
- temporal analyses;
- sensitivity analyses;
- robust variance estimation;
- time-to-event analyses;
- assessment of missing data;
- outcome and model auditing;
- exploratory monitoring analyses; and
- investigation of incomplete follow-up and censoring.

The repository is intended to document the analytical methods and provide a transparent and reproducible record of the code used in the study.

Full execution of the workflow requires authorised access to the underlying CPRD Aurum data and the associated study datasets.

### Data Availability

The underlying patient-level data are **not included in this repository**.

The study used de-identified CPRD Aurum electronic health record data obtained through an approved research project. These data are subject to controlled-access and governance requirements and therefore cannot be redistributed publicly through GitHub.

Analyses were conducted within the secure University of Manchester research environment in accordance with the applicable data-governance requirements.

Consequently, this repository contains:

- analytical R code;
- documentation of the analytical workflow; and
- selected non-disclosive study outputs.

It does **not** contain individual-level CPRD Aurum records or other restricted patient-level datasets.

---

## Project Context

This project was conducted as part of the **MSc Health Data Science programme at the University of Manchester**.

The study brought together routinely collected electronic health record data, epidemiological study design, statistical modelling and reproducible analysis to investigate inequalities in heart failure treatment within English primary care.

**Project title:**  
*Ethnic and socioeconomic inequalities in the receipt of NICE-recommended pharmacological therapies among patients with heart failure in English primary care: A cohort study using CPRD Aurum.*

---

## Author

**Hira Sahi**
