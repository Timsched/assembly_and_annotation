#!/usr/bin/env bash

#SBATCH --cpus-per-task=1
#SBATCH --mem=40G
#SBATCH --time=04:00:00
#SBATCH --job-name=jellyfish_kmercount
#SBATCH --output=/data/users/tschlatter/GenomeandTranscriptome/output_jelly_%j.o
#SBATCH --error=/data/users/tschlatter/GenomeandTranscriptome/error_jelly_%j.e
#SBATCH --partition=pibu_el8

WORKDIR=/data/users/tschlatter/GenomeandTranscriptome/filtered
cd $WORKDIR

module load Jellyfish/2.3.0-GCC-10.3.0

jellyfish count \
    -C -m 21 -s 5G -t 4 -o reads.jf\
    <(zcat /data/users/tschlatter/GenomeandTranscriptome/filtered/Pac_ERR11437340.fastq.gz)

jellyfish histo -t 4 reads.jf > reads.histo