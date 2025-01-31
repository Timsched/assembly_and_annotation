#!/usr/bin/env bash

#SBATCH --cpus-per-task=20
#SBATCH --mem=64G
#SBATCH --time=1:00:00
#SBATCH --job-name=faigeneration
#SBATCH --output=/data/users/tschlatter/GenomeandTranscriptome/output_faigen_%j.o
#SBATCH --error=/data/users/tschlatter/GenomeandTranscriptome/error_faigen_%j.e
#SBATCH --partition=pibu_el8

WORKDIR=/data/users/tschlatter/GenomeandTranscriptome/Assemblies/flye

cd $WORKDIR
module load SAMtools/1.13-GCC-10.3.0

samtools faidx assembly.fasta