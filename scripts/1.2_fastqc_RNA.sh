#!/usr/bin/env bash

#SBATCH --cpus-per-task=1
#SBATCH --mem=40G
#SBATCH --time=01:00:00
#SBATCH --job-name=fastqc
#SBATCH --output=/data/users/tschlatter/GenomeandTranscriptome/output_fastqc_%j.o
#SBATCH --error=/data/users/tschlatter/GenomeandTranscriptome/error_fastqc_%j.e
#SBATCH --partition=pibu_el8


mkdir -p /data/users/tschlatter/GenomeandTranscriptome/fastqc

WORKDIR=/data/users/tschlatter/GenomeandTranscriptome
OUTPUTDIR=/data/users/tschlatter/GenomeandTranscriptome/fastqc

cd $WORKDIR


apptainer exec \
--bind $WORKDIR \
/containers/apptainer/fastqc-0.12.1.sif \
fastqc -o $OUTPUTDIR/ $WORKDIR/RNAseq_Sha/* \
