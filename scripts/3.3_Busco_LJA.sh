#!/usr/bin/env bash

#SBATCH --cpus-per-task=16
#SBATCH --mem=64G
#SBATCH --time=1-00:00:00
#SBATCH --job-name=Busco_LJA
#SBATCH --output=/data/users/tschlatter/GenomeandTranscriptome/output_buscoLJA_%j.o
#SBATCH --error=/data/users/tschlatter/GenomeandTranscriptome/error_buscoLJA_%j.e
#SBATCH --partition=pibu_el8



WORKDIR=/data/users/tschlatter/GenomeandTranscriptome/Assemblies/LJA
cd $WORKDIR

module load BUSCO/5.4.2-foss-2021a

busco -i assembly.fasta --mode geno -l brassicales_odb10 --out BUSCOLJA_results -c 16\