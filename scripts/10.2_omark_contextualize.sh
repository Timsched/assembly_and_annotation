#!/usr/bin/env bash

#SBATCH --cpus-per-task=20
#SBATCH --mem=64G
#SBATCH --time=1-00:00:00
#SBATCH --job-name=minip
#SBATCH --output=/data/users/tschlatter/GenomeandTranscriptome/output_minip_%j.o
#SBATCH --error=/data/users/tschlatter/GenomeandTranscriptome/error_minip_%j.e
#SBATCH --partition=pibu_el8

module load SeqKit/2.6.1

WORKDIR=/data/users/tschlatter/GenomeandTranscriptome/final
cd $WORKDIR
COURSEDIR=/data/courses/assembly-annotation-course/CDS_annotation
CONTEXTUALIZE=/data/courses/assembly-annotation-course/CDS_annotation/softwares/OMArk-0.3.0/utils/omark_contextualize.py
OMAMER_PROT=/data/users/tschlatter/GenomeandTranscriptome/final/assembly.all.maker.proteins.fasta.renamed.fasta.omamer
OMARK_OUT=/data/users/tschlatter/GenomeandTranscriptome/final/omark_output

python3 $CONTEXTUALIZE fragment -m $OMAMER_PROT -o $OMARK_OUT -f fragment_HOGs
python3 $CONTEXTUALIZE missing -m $OMAMER_PROT -o $OMARK_OUT -f missing_HOGs

cd $WORKDIR/miniprot

GENOME="/data/users/tschlatter/GenomeandTranscriptome/Assemblies/flye/assembly.fasta"
SEQ_FASTA="/data/users/tschlatter/GenomeandTranscriptome/final/fragment_HOGs"
MINIPROT_OUTPUT="miniprot_out.gff"

$WORKDIR/miniprot/miniprot/miniprot -I --gff --outs=0.95 $GENOME $SEQ_FASTA > $MINIPROT_OUTPUT