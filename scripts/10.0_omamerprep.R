library(tidyverse)
library(data.table)
library(tidyr)



setwd("C:\\Users\\Tim\\Documents\\School\\UBE_MSC_SEM3\\transcriptome_assembly\\Fribourg\\Rstuff\\7.7_Compare_TE_clade_abundance")
protein <- read.table("assembly.all.maker.proteins.fasta.renamed.filtered.fasta.fai")


base_ids <- sub("-.*", "", protein$V1)
base_ids
# Group by base ID and combine
grouped <- tapply(protein$V1, base_ids, paste, collapse = ";")


# Display the output
grouped


View(grouped)

protein<-separate(protein,V1, into=c("GENEID", "RA"),sep="-")
writeLines(grouped, "grouped_ids.txt")

