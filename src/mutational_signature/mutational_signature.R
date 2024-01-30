"""
Mutational signatures

2023/12/13
"""


### assinaturas mutacionais

BiocManager::install("GenomeInfoDbData")

BiocManager::install("BSgenome.Hsapiens.UCSC.hg19", dependencies = TRUE)

library("BSgenome.Hsapiens.UCSC.hg19", quietly = TRUE)


maf.tnm = trinucleotideMatrix(maf = maf, prefix = 'chr', add = TRUE, ref_genome = "BSgenome.Hsapiens.UCSC.hg19")

plotApobecDiff(tnm = maf.tnm, maf = maf, pVal = 0.5) # seria 0.2 mas mudei para aparecer plot


# signature analysis - não consigo correr a partir daqui

BiocManager::install("NMF")

library("NMF")

maf.sign = estimateSignatures(mat = maf.tnm, nTry = 6)

plotCophenetic(res = maf.sign)

maf.sig = extractSignatures(mat = maf.tnm, n = 3)

#Compare against original 30 signatures
maf.og30.cosm = compareSignatures(nmfRes = maf.sig, sig_db = "legacy")

#Compare against updated version3 60 signatures 
maf.v3.cosm = compareSignatures(nmfRes = maf.sig, sig_db = "SBS")


# plot signatures
BiocManager::install("pheatmap")

library('pheatmap')

pheatmap::pheatmap(mat = maf.og30.cosm$cosine_similarities, cluster_rows = FALSE, main = "cosine similarity against validated signatures")

maftools::plotSignatures(nmfRes = maf.sig, title_size = 1.2, sig_db = "SBS")

#3D plot
library("barplot3d")
#Visualize first signature
sig1 = maf.sig$signatures[,1]
barplot3d::legoplot3d(contextdata = sig1, labels = FALSE, scalexy = 0.01, sixcolors = "sanger", alpha = 0.5)