"""
Ana Rafaela Pereira
2023.03.13
"""

# imports
library(dplyr)


# set the working directory to the data folder
setwd("~/GitHub/dissertation/dissertation/data")


# reading files
data_1 <- read.table(file = 'GIST-1.filtered.vcf.hg19_multianno_filtered.txt', header = TRUE, sep = '\t')
data_2 <- read.table(file = 'GIST-2.filtered.vcf.hg19_multianno_filtered.txt', header = TRUE, sep = '\t')
data_6 <- read.table(file = 'GIST-6.filtered.vcf.hg19_multianno_filtered.txt', header = TRUE, sep = '\t')
data_7 <- read.table(file = 'GIST-7.filtered.vcf.hg19_multianno_filtered.txt', header = TRUE, sep = '\t')
data_10 <- read.table(file = 'GIST-10.filtered.vcf.hg19_multianno_filtered.txt', header = TRUE, sep = '\t')
data_11 <- read.table(file = 'GIST-11.filtered.vcf.hg19_multianno_filtered.txt', header = TRUE, sep = '\t')
data_13 <- read.table(file = 'GIST-13.filtered.vcf.hg19_multianno_filtered.txt', header = TRUE, sep = '\t')
data_15 <- read.table(file = 'GIST-15.filtered.vcf.hg19_multianno_filtered.txt', header = TRUE, sep = '\t')
data_18 <- read.table(file = 'GIST-18.filtered.vcf.hg19_multianno_filtered.txt', header = TRUE, sep = '\t')
data_19 <- read.table(file = 'GIST-19.filtered.vcf.hg19_multianno_filtered.txt', header = TRUE, sep = '\t')
data_22 <- read.table(file = 'GIST-22.filtered.vcf.hg19_multianno_filtered.txt', header = TRUE, sep = '\t')
data_24 <- read.table(file = 'GIST-24.filtered.vcf.hg19_multianno_filtered.txt', header = TRUE, sep = '\t')
data_28 <- read.table(file = 'GIST-28.filtered.vcf.hg19_multianno_filtered.txt', header = TRUE, sep = '\t')
data_30 <- read.table(file = 'GIST-30.filtered.vcf.hg19_multianno_filtered.txt', header = TRUE, sep = '\t')
data_32 <- read.table(file = 'GIST-32.filtered.vcf.hg19_multianno_filtered.txt', header = TRUE, sep = '\t')
data_33 <- read.table(file = 'GIST-33.filtered.vcf.hg19_multianno_filtered.txt', header = TRUE, sep = '\t')
data_35 <- read.table(file = 'GIST-35.filtered.vcf.hg19_multianno_filtered.txt', header = TRUE, sep = '\t')
data_36 <- read.table(file = 'GIST-36.filtered.vcf.hg19_multianno_filtered.txt', header = TRUE, sep = '\t')
data_39 <- read.table(file = 'GIST-39.filtered.vcf.hg19_multianno_filtered.txt', header = TRUE, sep = '\t')


## adding the ID column and moving it to the first position of the table
# GIST-1
d1 <- data_1 %>% mutate(ID = 'GIST-1')
d1 <- d1 %>% select(ID, everything())
write.table(d1, "d1.txt", sep = '\t', row.names = FALSE)
# GIST-2
d2 <- data_2 %>% mutate(ID = 'GIST-2')
d2 <- d2 %>% select(ID, everything())
write.table(d2, "d2.txt", sep = '\t', row.names = FALSE)
# GIST-6
d6 <- data_6 %>% mutate(ID = 'GIST-6')
d6 <- d6 %>% select(ID, everything())
write.table(d6, "d6.txt", sep = '\t', row.names = FALSE)
# GIST-7
d7 <- data_7 %>% mutate(ID = 'GIST-7')
d7 <- d7 %>% select(ID, everything())
write.table(d7, "d7.txt", sep = '\t', row.names = FALSE)
# GIST-10
d10 <- data_10 %>% mutate(ID = 'GIST-10')
d10 <- d10 %>% select(ID, everything())
write.table(d10, "d10.txt", sep = '\t', row.names = FALSE)
# GIST-11
d11 <- data_11 %>% mutate(ID = 'GIST-11')
d11 <- d11 %>% select(ID, everything())
write.table(d11, "d11.txt", sep = '\t', row.names = FALSE)
# GIST-13
d13 <- data_13 %>% mutate(ID = 'GIST-13')
d13 <- d13 %>% select(ID, everything())
write.table(d13, "d13.txt", sep = '\t', row.names = FALSE)
# GIST-15
d15 <- data_15 %>% mutate(ID = 'GIST-15')
d15 <- d15 %>% select(ID, everything())
write.table(d15, "d15.txt", sep = '\t', row.names = FALSE)
# GIST-18
d18 <- data_18 %>% mutate(ID = 'GIST-18')
d18 <- d18 %>% select(ID, everything())
write.table(d18, "d18.txt", sep = '\t', row.names = FALSE)
# GIST-19
d19 <- data_19 %>% mutate(ID = 'GIST-19')
d19 <- d19 %>% select(ID, everything())
write.table(d19, "d19.txt", sep = '\t', row.names = FALSE)
# GIST-22
d22 <- data_22 %>% mutate(ID = 'GIST-22')
d22 <- d22 %>% select(ID, everything())
write.table(d22, "d22.txt", sep = '\t', row.names = FALSE)
# GIST-24
d24 <- data_24 %>% mutate(ID = 'GIST-24')
d24 <- d24 %>% select(ID, everything())
write.table(d24, "d24.txt", sep = '\t', row.names = FALSE)
# GIST-28
d28 <- data_28 %>% mutate(ID = 'GIST-28')
d28 <- d28 %>% select(ID, everything())
write.table(d28, "d28.txt", sep = '\t', row.names = FALSE)
# GIST-30
d30 <- data_30 %>% mutate(ID = 'GIST-30')
d30 <- d30 %>% select(ID, everything())
write.table(d30, "d30.txt", sep = '\t', row.names = FALSE)
# GIST-32
d32 <- data_32 %>% mutate(ID = 'GIST-32')
d32 <- d32 %>% select(ID, everything())
write.table(d32, "d32.txt", sep = '\t', row.names = FALSE)
# GIST-33
d33 <- data_33 %>% mutate(ID = 'GIST-33')
d33 <- d33 %>% select(ID, everything())
write.table(d33, "d33.txt", sep = '\t', row.names = FALSE)
# GIST-35
d35 <- data_35 %>% mutate(ID = 'GIST-35')
d35 <- d35 %>% select(ID, everything())
write.table(d35, "d35.txt", sep = '\t', row.names = FALSE)
# GIST-36
d36 <- data_36 %>% mutate(ID = 'GIST-36')
d36 <- d36 %>% select(ID, everything())
write.table(d36, "d36.txt", sep = '\t', row.names = FALSE)
# GIST-39
d39 <- data_39 %>% mutate(ID = 'GIST-39')
d39 <- d39 %>% select(ID, everything())
write.table(d39, "d39.txt", sep = '\t', row.names = FALSE)


# merge all patients' data to a new .txt data file
files <- c('d1.txt', 'd2.txt', 'd6.txt', 'd7.txt', 'd10.txt', 'd11.txt', 'd13.txt', 'd15.txt', 'd18.txt', 'd19.txt', 'd22.txt', 'd24.txt', 'd28.txt', 'd30.txt', 'd32.txt', 'd33.txt', 'd35.txt', 'd36.txt', 'd39.txt')
df <- file('final_data.txt', 'w')

for (file in files) {
  file_contents <- readLines(file)
  writeLines(file_contents, df)
}

close(df)


## create a .csv file from the .txt file
# create an empty data frame to store the data
final_data_csv <- data.frame()

# loop over the text files
for (file in files) {
  # read the text file
  txt_file <- readLines(paste0(file))
  # convert the text to a data frame
  my_data_file <- data.frame(text = txt_file)
  # add the data to the main data frame
  final_data_csv <- rbind(final_data_csv, my_data_file)
}

# write the data to a CSV file
write.csv(final_data_csv, "final_data.csv", row.names = FALSE)


# i made the .csv readable in excel

# importing the final .csv
final_data <- read_delim("final_data.csv", 
                         +     delim = ";", escape_double = FALSE, trim_ws = TRUE)