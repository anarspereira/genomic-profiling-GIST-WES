"""
Drawing Kaplan-Meier curves for the overall survival analysis of the cohort.

2024/01/24
"""

# loading packages
library(openxlsx)
library(survival)
library(survminer)

# defining data file path
data_path <- "C:/Users/Ana/Documents/GitHub/dissertation/data/data_survival/overall_survival.xlsx"

# reading data file
data <- read.xlsx(data_path)
head(data)


### drawing survival curves
## overall survival
png("OS_survival.png", width = 110, height = 140, res = 400, units = "mm")
fit_k <- survfit(Surv(Survival.months, Status) ~ 1, data = data)
ggsurvplot(fit_k, data = data, censor.shape = "|", censor.size = 3,
           xlim = c(0,250),
           pval = FALSE,
           risk.table = TRUE,
           legend.title = "",
           xlab = "Time (months)",
           #palette = c("red","darkblue"),
           legend.labs = 'GIST Overall Survival',
           #pval.coord = c(25,0.92),
           risk.table.y.text = FALSE
           #title = "Overall Suvival"
)
dev.off()

stats <- summary(fit_k)$table
write.xlsx(as.data.frame(stats), "OS_survival_stats.xlsx", rowNames=TRUE)


## overall survival Fletcher
png("OS_survival_fletcher.png", width = 130, height = 160, res = 400, units = "mm")
fit_k <- survfit(Surv(Survival.months, Status) ~ Fletcher, data = data)
ggsurvplot(fit_k, data = data, censor.shape = "|", censor.size = 3,
           xlim = c(0,250),
           pval = TRUE,
           risk.table = TRUE,
           legend.title = "",
           xlab = "Time (months)",
           #palette = c("red","darkblue"),
           #legend.labs = c("High", "Low","Moderate","Very low"),
           pval.coord = c(10,0.1),
           risk.table.y.text = FALSE
           #title = "Overall Suvival"
)
dev.off()

stats <- summary(fit_k)$table
write.xlsx(as.data.frame(stats), "OS_survival_stats_fletcher.xlsx", rowNames=TRUE)




## overall survival alterations
png("OS_survival_alterations.png", width = 130, height = 160, res = 400, units = "mm")
fit_k <- survfit(Surv(Survival.months, Status) ~ Alteration, data = data)
ggsurvplot(fit_k, data = data, censor.shape = "|", censor.size = 3,
           xlim = c(0,250),
           pval = TRUE,
           risk.table = TRUE,
           legend.title = "",
           xlab = "Time (months)",
           #palette = c( "darkblue", "black", "red"),
           #legend.labs = c("KIT", "KIT/PDGFRA WT","PDGFRA"),
           pval.coord = c(10,0.1),
           risk.table.y.text = FALSE
           #title = "Overall Suvival"
)
dev.off()

stats <- summary(fit_k)$table
write.xlsx(as.data.frame(stats), "OS_survival_stats_alterations.xlsx", rowNames=TRUE)
