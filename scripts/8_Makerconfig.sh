#!/usr/bin/env bash

#SBATCH --cpus-per-task=20
#SBATCH --mem=64G
#SBATCH --time=1-00:00:00
#SBATCH --job-name=MAKER_Config
#SBATCH --output=/data/users/tschlatter/GenomeandTranscriptome/output_MAKERconfig_%j.o
#SBATCH --error=/data/users/tschlatter/GenomeandTranscriptome/error_MAKERconfig_%j.e
#SBATCH --partition=pibu_el8

WORKDIR=/data/users/tschlatter/GenomeandTranscriptome/Annotation
cd $WORKDIR
mkdir -p gene_annotation
cd $WORKDIR/gene_annotaion

apptainer exec --bind $WORKDIR \
/data/courses/assembly-annotation-course/containers2/MAKER_3.01.03.sif maker -CTL \
