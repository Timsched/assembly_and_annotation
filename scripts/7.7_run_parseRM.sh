#!/usr/bin/env bash

#SBATCH --cpus-per-task=20
#SBATCH --mem=64G
#SBATCH --time=1-00:00:00
#SBATCH --job-name=MAKER_Config
#SBATCH --output=/data/users/tschlatter/GenomeandTranscriptome/output_parseRM_%j.o
#SBATCH --error=/data/users/tschlatter/GenomeandTranscriptome/error_parseRM_%j.e
#SBATCH --partition=pibu_el8

WORKDIR=/data/users/tschlatter/GenomeandTranscriptome/Annotation/EDTA_results2/assembly.fasta.mod.EDTA.anno
cd $WORKDIR



module add BioPerl/1.7.8-GCCcore-10.3.0
perl /data/users/tschlatter/GenomeandTranscriptome/scripts/parseRM.pl -i assembly.fasta.mod.out -l 50,1 -v

