#!/usr/bin/env bash

#SBATCH --cpus-per-task=16
#SBATCH --mem=64G
#SBATCH --time=1-00:00:00
#SBATCH --job-name=flye_genome_assembly
#SBATCH --output=/data/users/tschlatter/GenomeandTranscriptome/output_flye_%j.o
#SBATCH --error=/data/users/tschlatter/GenomeandTranscriptome/error_flye_%j.e
#SBATCH --partition=pibu_el8
 


WORKDIR=/data/users/tschlatter/GenomeandTranscriptome/
cd $WORKDIR

mkdir -p Assemblies
mkdir -p Assemblies/flye

OUTPUTDIR=/data/users/tschlatter/GenomeandTranscriptome/Assemblies/flye

#use flye container to assemble genome
apptainer exec \
--bind $WORKDIR \
/containers/apptainer/flye_2.9.5.sif \
flye --pacbio-hifi $WORKDIR/filtered/Pac_ERR11437340.fastq.gz --out-dir $OUTPUTDIR --threads 16\

 

