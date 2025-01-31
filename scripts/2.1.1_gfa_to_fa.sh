#!/usr/bin/env bash

#SBATCH --cpus-per-task=16
#SBATCH --mem=64G
#SBATCH --time=1-00:00:00
#SBATCH --job-name=hificonversion_genome_assembly
#SBATCH --output=/data/users/tschlatter/GenomeandTranscriptome/output_hifi_%j.o
#SBATCH --error=/data/users/tschlatter/GenomeandTranscriptome/error_hifi_%j.e
#SBATCH --partition=pibu_el8

WORKDIR=/data/users/tschlatter/GenomeandTranscriptome/Assemblies/hifiasm
cd $WORKDIR

for file in *.gfa; do
    awk '/^S/{print ">"$2;print $3}' "$file" > "${file%.gfa}.fa"
done

