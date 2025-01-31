#!/usr/bin/env bash

#SBATCH --cpus-per-task=16
#SBATCH --mem=64G
#SBATCH --time=1-00:00:00
#SBATCH --job-name=Busco_flye
#SBATCH --output=/data/users/tschlatter/GenomeandTranscriptome/output_buscoflye_%j.o
#SBATCH --error=/data/users/tschlatter/GenomeandTranscriptome/error_buscoflye_%j.e
#SBATCH --partition=pibu_el8



WORKDIR=/data/users/tschlatter/GenomeandTranscriptome/Assemblies/flye
cd $WORKDIR

module load BUSCO/5.4.2-foss-2021a

busco -i assembly.fasta --mode geno -l brassicales_odb10 --out BUSCOflye_results -c 16\