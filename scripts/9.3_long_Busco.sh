#!/usr/bin/env bash

#SBATCH --cpus-per-task=20
#SBATCH --mem=64G
#SBATCH --time=1-00:00:00
#SBATCH --job-name=BUSCO
#SBATCH --output=/data/users/tschlatter/GenomeandTranscriptome/output_BUSCO_%j.o
#SBATCH --error=/data/users/tschlatter/GenomeandTranscriptome/error_BUSCO_%j.e
#SBATCH --partition=pibu_el8

WORKDIR="/data/users/tschlatter/GenomeandTranscriptome/final"
cd $WORKDIR


module load BUSCO/5.4.2-foss-2021a
busco -i proteins.longest.fasta -l brassicales_odb10 -o busco_output_protein -m proteins
busco -i transcripts.longest.fasta -l brassicales_odb10 -o busco_output_trans -m transcriptome
