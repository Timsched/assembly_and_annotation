#!/usr/bin/env bash

#SBATCH --cpus-per-task=1
#SBATCH --mem=40G
#SBATCH --time=06:00:00
#SBATCH --job-name=OMARK
#SBATCH --output=/data/users/tschlatter/GenomeandTranscriptome/output_OMARK_%j.o
#SBATCH --error=/data/users/tschlatter/GenomeandTranscriptome/error_OMARK_%j.e
#SBATCH --partition=pibu_el8

WORKDIR=/data/users/tschlatter/GenomeandTranscriptome/final
cd $WORKDIR
protein=assembly.all.maker.proteins.fasta

module add Anaconda3/2022.05
conda activate OMArk

wget https://omabrowser.org/All/LUCA.h5
omamer search --db LUCA.h5 --query ${protein}.renamed.fasta --out ${protein}.renamed.fasta.omamer
