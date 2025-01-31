#!/usr/bin/env bash

#SBATCH --cpus-per-task=16
#SBATCH --mem=32G
#SBATCH --time=1-00:00:00
#SBATCH --job-name=Busco_hifiasm
#SBATCH --output=/data/users/tschlatter/GenomeandTranscriptome/output_buscohifi_%j.o
#SBATCH --error=/data/users/tschlatter/GenomeandTranscriptome/error_buscohifi_%j.e
#SBATCH --partition=pibu_el8



WORKDIR=/data/users/tschlatter/GenomeandTranscriptome/Assemblies
cd $WORKDIR

module load BUSCO/5.4.2-foss-2021a

#apptainer exec \
#--bind $WORKDIR \
#/containers/apptainer/busco_5.7.1.sif \
busco -i hifiasm/hifiasm.bp.p_ctg.fa --mode geno -l brassicales_odb10 --out BUSCOHIFI_results -c 16\