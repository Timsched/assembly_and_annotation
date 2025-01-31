#!/usr/bin/env bash

#SBATCH --cpus-per-task=16
#SBATCH --mem=64G
#SBATCH --time=1-00:00:00
#SBATCH --job-name=trinity_genome_assembly
#SBATCH --output=/data/users/tschlatter/GenomeandTranscriptome/output_trinity_%j.o
#SBATCH --error=/data/users/tschlatter/GenomeandTranscriptome/error_trinity_%j.e
#SBATCH --partition=pibu_el8

module load Trinity/2.15.1-foss-2021a

WORKDIR=/data/users/tschlatter/GenomeandTranscriptome/
cd $WORKDIR

mkdir -p Assemblies/Trinity
OUTPUTDIR=/data/users/tschlatter/GenomeandTranscriptome/Assemblies/Trinity

Trinity --seqType fq --max_memory 60G --left $WORKDIR/filtered/ERR754081_trimmed_1.fastq.gz --right $WORKDIR/filtered/ERR754081_trimmed_2.fastq.gz --output $OUTPUTDIR --CPU 16


