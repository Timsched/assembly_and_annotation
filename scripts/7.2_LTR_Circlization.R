library(devtools)
#devtools::install_github("jokergoo/circlize")
library(circlize)

library(tidyverse)
library(data.table)
setwd("C:\\Users\\Tim\\Documents\\School\\UBE_MSC_SEM3\\transcriptome_assembly\\Fribourg\\Rstuff")
anno_data=read.table("assembly.fasta.mod.EDTA.TEanno.gff3",header=F,sep="\t")
anno_data
value_counts <- table(anno_data[3])
value_counts

Copia<-anno_data[anno_data$V3=="Copia_LTR_retrotransposon"]
View(anno_data)
