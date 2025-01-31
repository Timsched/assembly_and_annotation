library(reshape2)
library(hrbrthemes)
library(tidyverse)
library(data.table)


# get data from parameter
setwd("C:\\Users\\Tim\\Documents\\School\\UBE_MSC_SEM3\\transcriptome_assembly\\Fribourg\\Rstuff\\7.7_Compare_TE_clade_abundance")
data <- "assembly.all.maker.renamed.gff.AED.txt"

rep_table <- fread(data, header = TRUE, sep = "\t")
colnames(rep_table)<-c("AED","Cum")
rep_table$AED
ggplot(rep_table, aes(y = AED, x = Cum)) +
  geom_point(color = "blue") +
  labs(title = "AED values(the lower the better)",
       y = "AED value",
       x = "Percentage of genes") +
  theme_minimal()

