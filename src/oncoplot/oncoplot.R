"""
Drawing an oncoplot of the variants with evidence of pathogenicity in 19 GIST patients

2023/12/12
"""

# installing maftools
install.packages("BiocManager")
BiocManager::install("maftools")

# loading packages
library(maftools)

# defining maf file path
maf_file_path <- "C:/Users/Ana/Documents/GitHub/dissertation/src/oncoplot/oncoplot.maf"

# defining  clinical data file path
clinical_data_path <- "C:/Users/Ana/Documents/GitHub/dissertation/data/data_exome_and_clinical_MAF/clinical_data_for_oncoplot.csv"

# loading clinical data file into a dataframe
clinical_data <- read.csv(clinical_data_path, sep = ";")
head(clinical_data)

# renaming ID column to match MAF file
colnames(clinical_data)[colnames(clinical_data) == "ID"] <- "Tumor_Sample_Barcode"
head(clinical_data)

# reading maf file
maf <- read.maf(maf = maf_file_path, clinicalData = clinical_data)

# summary of my data
maf

# get sample summary
getSampleSummary(maf)

# get gene summary
getGeneSummary(maf)

# get clinical data
getClinicalData(maf)

# get all fieds
getFields(maf)

# plotting maf summary
plotmafSummary(maf, rmOutlier = TRUE, addStat = 'median', dashboard = TRUE, titvRaw = FALSE)

## drawing oncoplot
# default top = 20
# showing the top 16 mutated genes
oncoplot(maf, top = 16, draw_titv = TRUE)

# changing colours
# example using color palette from RColorBrewer package
vc_cols = RColorBrewer::brewer.pal(n = 8, name = 'Paired')
names(vc_cols) = c(
  'Frame_Shift_Del',
  'Missense_Mutation',
  'Nonsense_Mutation',
  'Multi_Hit',
  'Frame_Shift_Ins',
  'In_Frame_Ins',
  'Splice_Site',
  'In_Frame_Del'
)

vc_cols[c('Multi_Hit', 'Frame_Shift_Ins', 'In_Frame_Ins', 'Splice_Site',
          'In_Frame_Del')] <- c('#000000', '#E3211C', '#FDBF6F', '#984EA3', '#B2DF8A')

print(vc_cols)
oncoplot(maf = maf, colors = vc_cols, top = 16)

# plot to show transitions and transversions
maf.titv = titv(maf, plot = FALSE, useSyn = TRUE)
plotTiTv(res = maf.titv)

# lollipop plot for DNMT3A, which is one of the most frequent mutated gene in Leukemia. - o lollipop suposto não aparece
lollipopPlot(
  maf = maf,
  gene = 'KIT',
  AACol = 'Protein_Change',
  showMutationRate = TRUE,
  labelPos = 882
)

lollipopPlot(
  maf = maf,
  gene = 'PDGFRA',
  AACol = 'Protein_Change',
  showMutationRate = TRUE,
  labelPos = 882
)


## defining important genes for oncoplot
genes = c("KIT", "PDGFRA", "ACAD8", "ANK3", "ATM", "BCL9L", "COL1A1", "EGFR", "FAT3", "GRIN2A", "LEF1", "MGA", "PGR", "PIK3CA")

# converting VAF values "," to "." and to numeric values
maf@data$Allele_Frequency <- as.numeric(gsub(",", ".", maf@data$Allele_Frequency))

# VAF plot
vaf_plot <- aggregate(Allele_Frequency ~ Hugo_Symbol, data = maf@data, FUN = function(x) mean(as.numeric(x), na.rm = TRUE))
colnames(vaf_plot)[2] = "VAF"

vaf_plot

oncoplot(
  maf = maf,
  genes = genes,
  #colors = "blue", # isto torna o gráfico rosa lmao
  leftBarData = vaf_plot,
  leftBarLims = c(0, 100)#,
  #leftBarVlineCol = "red"
)

# DP plot
dp_plot <- aggregate(Read_Depth ~ Hugo_Symbol, data = maf@data, mean, na.rm = TRUE)
colnames(dp_plot)[2] = "DP"

dp_plot

oncoplot(
  maf = maf,
  genes = genes,
  leftBarData = dp_plot,
  leftBarLims = c(0, 800)
)

# joining both - funciona mas a coluna da direita fica labeled como "No. of samples" em vez de "DP", como eu queria
vaf_dp_plot <- oncoplot(
  maf = maf,
  genes = genes,
  leftBarData = vaf_plot,
  leftBarLims = c(0, 100),
  rightBarData = dp_plot,
  rightBarLims = c(0, 800)
)


## including annotations
getClinicalData(maf)

#clinical_features <- c('CGI_Classification', 'AMP_Classification', 'ClinGen_Classification')#, 'Origin', 'Age', 'Sex', 'Location', 'Tumour_Size_cm', 'Status')
clinical_features <- c('Primary_Tumour_Location', 'Fletcher_Malignancy_Risk',
                       'Metastasis_Location', 'Status')

clinical_features_all <- c('Age', 'Sex', 'Origin', 'Primary_Tumour_Location', 'Histological_Subtype',
                           'Tumour_Size_cm', 'Fletcher_Malignancy_Risk', 'First_Chemotherapy_Cycle',
                           'Second_Chemotherapy_Cycle', 'Third_Chemotherapy_Cycle', 'Local_Recidive',
                           'Metastasis_Recidive', 'Metastasis_Location', 'Status')

clinical_features_pop <- c('Age', 'Sex', 'Status')

clinical_features_tumour <- c('Origin', 'Primary_Tumour_Location', 'Tumour_Size_cm',
                              'Fletcher_Malignancy_Risk', 'First_Chemotherapy_Cycle',
                              'Second_Chemotherapy_Cycle', 'Third_Chemotherapy_Cycle',
                              'Local_Recidive', 'Metastasis_Location')

# changing annotation colours
#anno_cols <- list(
#  Primary_Tumour_Location = c("Oesophagus" = "#1F78B4", "Small intestine" = "#6A3D9A", "Stomach" = "#E3211C", "Rectum" = "#A6CEE3"),
#  Fletcher_Malignancy_Risk = c("High" = "#1F78B4", "Moderate" = "#6A3D9A", "Low" = "#E3211C", "Low/Moderate" = "#A6CEE3", "Very low" = "#B2DF8A"),
#  Metastasis_Location = c("Liver" = "#1F78B4", "Peritonium" = "#B2DF8A", "NA" = "#F8F8F8"),
#  Status = c("Alive" = "#1F78B4", "Dead" = "#E3211C")
#)

anno_cols <- list(
  Primary_Tumour_Location = c("Oesophagus" = "#1F78B4", "Small_Intestine" = "#6A3D9A", "Stomach" = "#E3211C", "Rectum" = "#A6CEE3"),
  Fletcher_Malignancy_Risk = c("High" = "#1F78B4", "Moderate" = "#6A3D9A", "Low" = "#E3211C", "Very_Low" = "#B2DF8A"),
  Metastasis_Location = c("Liver" = "#1F78B4", "Peritonium" = "#B2DF8A", "NA" = "#F8F8F8"),
  Status = c("Alive" = "#1F78B4", "Dead" = "#E3211C")
)

# drawing oncoplot
oncoplot(maf = maf,
         genes = genes,
         clinicalFeatures = clinical_features,
         colors = vc_cols,
         annotationColor = anno_cols,
         showTumorSampleBarcodes = TRUE,
         barcode_mar = 5,
         barcodeSrt = 90,
         gene_mar = 6,
         anno_height = 2.5,
         legend_height = 5,
         sortByAnnotation = FALSE,
         sortByMutation = TRUE,
         #leftBarData = vaf_plot,
         #leftBarLims = c(0, 100),
         #rightBarData = dp_plot,
         #rightBarLims = c(0, 800),
         #annoBorderCol = "gray",
         fontSize = 0.75,
         legendFontSize = 1.2,
         annotationFontSize = 1.2,
         #titleText = NA
         titleText = "Oncoplot analysis of the genomic alterations of 19 GIST patients"
)
