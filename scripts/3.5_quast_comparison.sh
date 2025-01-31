#!/usr/bin/env bash

#SBATCH --cpus-per-task=16
#SBATCH --mem=64G
#SBATCH --time=1-00:00:00
#SBATCH --job-name=quast_genomes
#SBATCH --output=/data/users/tschlatter/GenomeandTranscriptome/output_quast_%j.o
#SBATCH --error=/data/users/tschlatter/GenomeandTranscriptome/error_quast_%j.e
#SBATCH --partition=pibu_el8

WORKDIR=/data/users/tschlatter/GenomeandTranscriptome/Assemblies
cd $WORKDIR

mkdir -p quast

OUTPUTDIR=/data/users/tschlatter/GenomeandTranscriptome/Assemblies/quast

apptainer exec \
--bind $WORKDIR \
/containers/apptainer/quast_5.2.0.sif\
 python /usr/local/bin/quast.py -o quast -r /data/courses/assembly-annotation-course/references/Arabidopsis_thaliana.TAIR10.dna.toplevel.fa.gz\
 -g /data/courses/assembly-annotation-course/references/TAIR10_GFF3_genes.gff -t 16 -e --est-ref-size 135000000 hifiasm/hifiasm.bp.p_ctg.fa flye/assembly.fasta LJA/assembly.fasta\
