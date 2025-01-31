#!/usr/bin/env bash

#SBATCH --cpus-per-task=16
#SBATCH --mem=256G
#SBATCH --time=4-00:00:00
#SBATCH --job-name=lja_genome_assembly
#SBATCH --output=/data/users/tschlatter/GenomeandTranscriptome/output_lja_%j.o
#SBATCH --error=/data/users/tschlatter/GenomeandTranscriptome/error_lja_%j.e
#SBATCH --partition=pibu_el8

WORKDIR=/data/users/tschlatter/GenomeandTranscriptome/
cd $WORKDIR

mkdir -p Assemblies/LJA
OUTPUTDIR=/data/users/tschlatter/GenomeandTranscriptome/Assemblies/LJA

apptainer exec \
--bind $WORKDIR \
/containers/apptainer/lja-0.2.sif \
lja --reads $WORKDIR/filtered/Pac_ERR11437340.fastq.gz --output-dir $OUTPUTDIR --threads 16\
