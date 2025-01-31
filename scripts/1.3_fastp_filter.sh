#!/usr/bin/env bash

#SBATCH --cpus-per-task=1
#SBATCH --mem=40G
#SBATCH --time=01:00:00
#SBATCH --job-name=fastp
#SBATCH --output=/data/users/tschlatter/GenomeandTranscriptome/output_fastp_%j.o
#SBATCH --error=/data/users/tschlatter/GenomeandTranscriptome/error_fastp_%j.e
#SBATCH --partition=pibu_el8

WORKDIR=/data/users/tschlatter/GenomeandTranscriptome
cd $WORKDIR
mkdir -p filtered

OUTPUTDIR=/data/users/tschlatter/GenomeandTranscriptome/filtered

module load fastp/0.23.4-GCC-10.3.0

#filter rna seq data, with 20 mean quality sliding window and min length 50
fastp -i $WORKDIR/RNAseq_Sha/ERR754081_1.fastq.gz -I $WORKDIR/RNAseq_Sha/ERR754081_2.fastq.gz \
    -o $OUTPUTDIR/ERR754081_trimmed_1.fastq.gz -O $OUTPUTDIR/ERR754081_trimmed_2.fastq.gz \
    --cut_mean_quality 20 --length_required 50\
    -h fastp_report.html

#no filter for long reads, just want the report
fastp -i $WORKDIR/Rab-R1/ERR11437340.fastq.gz -o $OUTPUTDIR/Pac_ERR11437340.fastq.gz -h fastp_report_pac.html