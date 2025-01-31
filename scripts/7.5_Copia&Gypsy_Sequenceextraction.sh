#!/usr/bin/env bash

#SBATCH --cpus-per-task=20
#SBATCH --mem=64G
#SBATCH --time=1-00:00:00
#SBATCH --job-name=MAKER_Config
#SBATCH --output=/data/users/tschlatter/GenomeandTranscriptome/output_tesort_seq_%j.o
#SBATCH --error=/data/users/tschlatter/GenomeandTranscriptome/error_tesort_seq_%j.e
#SBATCH --partition=pibu_el8

module load SeqKit/2.6.1
WORKDIR=/data/users/tschlatter/GenomeandTranscriptome/Annotation/EDTA_results2
cd $WORKDIR

# Extract Copia sequences
seqkit grep -r -p "Copia" assembly.fasta.mod.EDTA.TElib.fa > Copia_sequences.fa
# Extract Gypsy sequences
seqkit grep -r -p "Gypsy" assembly.fasta.mod.EDTA.TElib.fa > Gypsy_sequences.fa