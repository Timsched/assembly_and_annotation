#!/usr/bin/env bash

#SBATCH --cpus-per-task=16
#SBATCH --mem=64G
#SBATCH --time=1-00:00:00
#SBATCH --job-name=hifiasm_genome_assembly
#SBATCH --output=/data/users/tschlatter/GenomeandTranscriptome/output_fastqc_%j.o
#SBATCH --error=/data/users/tschlatter/GenomeandTranscriptome/error_fastqc_%j.e
#SBATCH --partition=pibu_el8

WORKDIR=/data/users/tschlatter/GenomeandTranscriptome/
cd $WORKDIR

mkdir -p Assemblies/hifiasm

OUTPUTDIR=/data/users/tschlatter/GenomeandTranscriptome/Assemblies/hifiasm

apptainer exec \
--bind $WORKDIR \
/containers/apptainer/hifiasm_0.19.8.sif \
hifiasm -o $OUTPUTDIR/hifiasm -t 16 $WORKDIR/filtered/Pac_ERR11437340.fastq.gz

