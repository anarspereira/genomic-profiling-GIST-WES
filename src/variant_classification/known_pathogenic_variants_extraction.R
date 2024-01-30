"""
Ana Rafaela Pereira
2023.04.17
"""

# set the working directory to the cleaned data folder
setwd("~/GitHub/dissertation/data/data_exome/4.cleaned_data")

# imports
library(readr)
library(dplyr)
library(ggplot2)

# reading the file
cleaned_data <- read_delim("cleaned_data.csv", delim = ";", escape_double = FALSE, trim_ws = TRUE)

# filtering variants based on ClinVar and InterVar classification
clinvar_classes <- c("Pathogenic", "Likely_pathogenic", "Pathogenic/Likely_pathogenic")
intervar_classes <- c("Pathogenic", "Likely pathogenic")

filtered_variants <- cleaned_data %>%
  filter(CLNSIG %in% clinvar_classes
         | InterVar_automated %in% c("Pathogenic", "Likely pathogenic"))


# extracting relevant information from the filtered variants
pathogenic_variants <- filtered_variants %>%
  select(ID, Chr, Start, End, Ref, Alt, Func.refGene, ExonicFunc.refGene, Gene.refGene, Gene.ensGene, CLNSIG, InterVar_automated)

# storing the processed data (already known pathogenic variants) in a new data frame or table for further processing
pathogenic_variants <- pathogenic_variants

## plotting the pathogenic variants
# grouping by gene and count occurrences
gene_counts <- pathogenic_variants %>%
  group_by(Gene.refGene) %>%
  summarise(Count = n()) %>%
  arrange(desc(Count))

# grouping by chromosome and count occurrences
chromosome_counts <- pathogenic_variants %>%
  group_by(Chr) %>%
  summarise(Count = n()) %>%
  arrange(desc(Count))

# plotting bar chart for most mutated genes
ggplot(gene_counts, aes(x = reorder(Gene.refGene, -Count), y = Count)) +
  geom_col(fill = "firebrick", width = 0.5) +
  ggtitle("Most mutated genes based on ClinVar and InterVar classification") +
  xlab("Gene") +
  ylab("Count") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# plotting bar chart for most mutated chromosomes
ggplot(chromosome_counts, aes(x = reorder(Chr, -Count), y = Count)) +
  geom_col(fill = "red4", width = 0.5) +
  ggtitle("Most mutated chromosomes based on ClinVar and InterVar
classification") +
  xlab("Chromosome") +
  ylab("Count") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
