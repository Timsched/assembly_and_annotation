#!/usr/bin/env bash

#SBATCH --cpus-per-task=1
#SBATCH --mem=40G
#SBATCH --time=06:00:00
#SBATCH --job-name=OMARKk
#SBATCH --output=/data/users/tschlatter/GenomeandTranscriptome/output_OMARKk_%j.o
#SBATCH --error=/data/users/tschlatter/GenomeandTranscriptome/error_OMARKk_%j.e
#SBATCH --partition=pibu_el8

WORKDIR=/data/users/tschlatter/GenomeandTranscriptome/final
cd $WORKDIR
protein=assembly.all.maker.proteins.fasta

module add Anaconda3/2022.05
#conda init bash
#conda activate OMArk

omark -f ${protein}.renamed.fasta.omamer -of ${protein}.renamed.fasta -i grouped_ids.txt -d LUCA.h5 -o omark_output


