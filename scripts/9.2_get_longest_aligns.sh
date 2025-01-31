#!/usr/bin/env bash

#SBATCH --cpus-per-task=20
#SBATCH --mem=64G
#SBATCH --time=1-00:00:00
#SBATCH --job-name=longestfilter
#SBATCH --output=/data/users/tschlatter/GenomeandTranscriptome/output_longestfilter_%j.o
#SBATCH --error=/data/users/tschlatter/GenomeandTranscriptome/error_longestfilter_%j.e
#SBATCH --partition=pibu_el8

WORKDIR="/data/users/tschlatter/GenomeandTranscriptome/final"
cd $WORKDIR


module load SeqKit/2.6.1

seqkit grep -f longtrans.txt /data/users/tschlatter/GenomeandTranscriptome/final/assembly.all.maker.transcripts.fasta.renamed.filtered.fasta -o transcripts.longest.fasta

seqkit grep -f longproteins.txt /data/users/tschlatter/GenomeandTranscriptome/final/assembly.all.maker.proteins.fasta.renamed.filtered.fasta -o proteins.longest.fasta