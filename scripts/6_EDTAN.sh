#!/usr/bin/env bash
#SBATCH --job-name=edta_annotation
#SBATCH --output=/data/users/tschlatter/GenomeandTranscriptome/output_EDTAN_%j.o
#SBATCH --error=/data/users/tschlatter/GenomeandTranscriptome/error_EDTAN_%j.e
#SBATCH --ntasks=1
#SBATCH --partition=pibu_el8
#SBATCH --cpus-per-task=20   # Adjust based on available resources
#SBATCH --mem=64G           # Adjust memory requirements
#SBATCH --time=36:00:00     # Adjust time as needed

WORKDIR=/data/users/tschlatter/GenomeandTranscriptome/Annotation/EDTA_results2
cd $WORKDIR
flye_assembly=/data/users/tschlatter/GenomeandTranscriptome/Assemblies/flye/assembly.fasta
CONTAINER_PATH=/data/courses/assembly-annotation-course/containers2/EDTA_v1.9.6.sif

apptainer exec -C -H $(pwd):/work \
 --writable-tmpfs $CONTAINER_PATH \
 EDTA.pl \
 --genome $flye_assembly \
 --species others \
 --step all \
 --cds "/data/courses/assembly-annotation-course/CDS_annotation/data/TAIR10_cds_20110103_representative_gene_model_updated" \
 --anno 1 \
 --threads 20