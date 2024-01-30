"""
Ana Rafaela Pereira
2023.05.02
"""

# set the working directory to the cleaned data folder
setwd("~/GitHub/dissertation/data/data_clinical")

# imports
library(readr)

# reading the file
clinical_data <- read_delim("clinical_19_GIST.csv", delim = ";", escape_double = FALSE, trim_ws = TRUE)

# clinical data statistics
# age range
clinical_data$Dt_nasc <- as.Date(clinical_data$Dt_nasc, format = "%d/%m/%Y")
clinical_data$Dt_nasc <- as.integer(difftime(Sys.Date(), clinical_data$Dt_nasc)/365.25)
age_range <- paste0(min(clinical_data$Dt_nasc), " - ", max(clinical_data$Dt_nasc))
cat("Age range:", age_range)

# calculate age in years
mean_age <- mean(clinical_data$Dt_nasc)
cat("Mean age:", mean_age, "years")

# counts and percentage of patients above and below 65 years
above_65_count <- sum(clinical_data$Dt_nasc > 65)
below_65_count <- sum(clinical_data$Dt_nasc <= 65)
total_count <- nrow(clinical_data)
above_65_percentage <- (above_65_count / total_count) * 100
below_65_percentage <- (below_65_count / total_count) * 100
cat("Patients above 65 years: ", above_65_count, " (", above_65_percentage, "%)\n")
cat("Patients below or equal to 65 years: ", below_65_count, " (", below_65_percentage, "%)\n")

# sex
sex_counts <- table(clinical_data$Sexo)
print(sex_counts)
sex_percentages <- round(prop.table(sex_counts) * 100, 2)
print(sex_percentages)

# race
race_counts <- table(clinical_data$Raça)
print(race_counts)
race_percentages <- round(prop.table(race_counts) * 100, 2)
print(race_percentages)

# surgery
surgery_counts <- table(clinical_data$Cirurgia)
print(surgery_counts)
surgery_percentages <- round(prop.table(surgery_counts) * 100, 2)
print(surgery_percentages)

# location of primary tumour
primary_tumour_counts <- table(clinical_data$Local_tumor_prima)
print(primary_tumour_counts)
primary_tumour_percentages <- round(prop.table(primary_tumour_counts) * 100, 2)
print(primary_tumour_percentages)

# surgery type (elective/urgent)
surgery_type_counts <- table(clinical_data$Tipo_cirurgia)
print(surgery_type_counts)
surgery_type_percentages <- round(prop.table(surgery_type_counts) * 100, 2)
print(surgery_type_percentages)

# post-operative death
post_op_death_count <- table(clinical_data$Obito_pos_operatorio)
print(post_op_death_count)
post_op_death_percentage <- round(prop.table(post_op_death_count) * 100, 2)
print(post_op_death_percentage)

# fletcher malignancy risk
fletcher_risk_count <- table(clinical_data$Risco_malignidade_Fletcher)
print(fletcher_risk_count)
fletcher_risk_percentage <- round(prop.table(fletcher_risk_count) * 100, 2)
print(fletcher_risk_percentage)

# histological subtype
hist_subtype_count <- table(clinical_data$Subtipo_histologico)
print(hist_subtype_count)
hist_subtype_percentage <- round(prop.table(hist_subtype_count) * 100, 2)
print(hist_subtype_percentage)

# recidiva metástica
recid_metast_count <- table(clinical_data$recidiva_meta)
print(recid_metast_count)
recid_metast_percentage <- round(prop.table(recid_metast_count) * 100, 2)
print(recid_metast_percentage)

# first metastasis type
first_metast_type_count <- table(clinical_data$Tipo_1_meta)
print(first_metast_type_count)
first_metast_type_percentage <- round(prop.table(first_metast_type_count) * 100, 2)
print(first_metast_type_percentage)

# status
status_count <- table(clinical_data$Status_atual)
print(status_count)
status_percentage <- round(prop.table(status_count) * 100, 2)
print(status_percentage)

# mutation summary
mutation_summary_count <- table(clinical_data$Mutaçao_resumo)
print(mutation_summary_count)
mutation_summary_percentage <- round(prop.table(mutation_summary_count) * 100, 2)
print(mutation_summary_percentage)


# select patients' status and RH value
status_RH <- clinical_data %>% select(ID_exome, ID_clinical, Status_atual, RH)
status_RH <- status_RH
