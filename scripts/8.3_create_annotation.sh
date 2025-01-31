#!/usr/bin/env bash

#SBATCH --cpus-per-task=20
#SBATCH --mem=64G
#SBATCH --time=1-00:00:00
#SBATCH --job-name=MAKER_final
#SBATCH --output=/data/users/tschlatter/GenomeandTranscriptome/output_FINAL_creation_%j.o
#SBATCH --error=/data/users/tschlatter/GenomeandTranscriptome/error_FINAL_creation_%j.e
#SBATCH --partition=pibu_el8


cd /data/users/tschlatter/GenomeandTranscriptome

mkdir -p final

COURSEDIR="/data/courses/assembly-annotation-course/CDS_annotation"

prefix="RABr1"
MAKERBIN="$COURSEDIR/softwares/Maker_v3.01.03/src/bin"
pgff="/data/users/tschlatter/GenomeandTranscriptome/Annotation/assembly.all.maker.noseq.gff"
pprotein="/data/users/tschlatter/GenomeandTranscriptome/Annotation/assembly.all.maker.proteins.fasta"
ptranscript="/data/users/tschlatter/GenomeandTranscriptome/Annotation/assembly.all.maker.transcripts.fasta"

protein="assembly.all.maker.proteins.fasta"
transcript="assembly.all.maker.transcripts.fasta"
gff="assembly.all.maker.noseq.gff"

cp $pgff final/${gff}.renamed.gff
cp $pprotein final/${protein}.renamed.fasta
cp $ptranscript final/${transcript}.renamed.fasta

cd final

 $MAKERBIN/maker_map_ids --prefix $prefix --justify 7 ${gff}.renamed.gff > id.map  
 $MAKERBIN/map_gff_ids id.map ${gff}.renamed.gff
 $MAKERBIN/map_fasta_ids id.map ${protein}.renamed.fasta
 $MAKERBIN/map_fasta_ids id.map ${transcript}.renamed.fasta
