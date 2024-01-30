"""
Data quality control - values of DP and VAF

Ana Rafaela Pereira

2023/07/09
"""

# imports
library(ggplot2)
library(tidyverse)

### VAF
# VAF data
df_VAF <- data.frame(ID = c(1, 2, 6, 7, 10, 11, 13, 15, 18, 19, 22, 24, 28, 30, 32, 33, 35, 36, 39),
                 VAF_before = c(11, 5, 6, 6, 5, 5, 5, 5, 5, 6, 7, 6, 6, 6, 4, 10, 17, 9, 11),
                 VAF_after = c(17, 19.9, 19.1, 18.5, 13.2, 23.3, 22.2, 36.3, 29.3, 40.1, 18.1, 15.8, 35.5, 16, 30.5, 33.5, 31.1, 14.3, 28.7))

# convert ID to a factor variable
df_VAF$ID <- factor(df_VAF$ID, levels = unique(df_VAF$ID))

# create the curve graph using ggplot2
ggplot(df_VAF) +
  geom_line(aes(x = ID, y = VAF_before, color = "Before"), size = 1.0) +
  geom_line(aes(x = ID, y = VAF_after, color = "After"), size = 1.0) +
  labs(x = "ID", y = "VAF mean (%)", color = "VAF") +
  scale_color_manual(values = c("blue", "red")) +
  theme_minimal()



### DP
# DP data
df_DP <- data.frame(ID = c(1, 2, 6, 7, 10, 11, 13, 15, 18, 19, 22, 24, 28, 30, 32, 33, 35, 36, 39),
                    DP_before = c(183.4, 246.7, 224.2, 221.6, 237.8, 216.1, 272, 318.2, 247.3, 224.9, 190.2, 213.2, 605.8, 222.3, 268.1, 226.5, 163.9, 167.6, 163.4),
                    DP_after = c(355, 341.7, 200.8, 133, 219.6, 110.3, 264.3, 207.8, 169.4, 296.5, 138.6, 142.2, 245.5, 205, 174.4, 461.5, 190.4, 117.4, 178.5))

# convert ID to factor with original order
# df_DP$ID <- factor(df_DP$ID, levels = unique(df_DP$ID))

# create the curve graph using ggplot2
ggplot(df_DP) +
  geom_line(aes(x = ID, y = DP_before, color = "Before"), size = 1.0) +
  geom_line(aes(x = ID, y = DP_after, color = "After"), size = 1.0) +
  labs(x = "ID", y = "DP mean (x)", color = "DP") +
  scale_color_manual(values = c("blue", "red")) +
  theme_minimal()
