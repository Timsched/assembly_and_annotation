#!/usr/bin/env bash

#SBATCH --cpus-per-task=16
#SBATCH --mem=64G
#SBATCH --time=1-00:00:00
#SBATCH --job-name=nuncmer
#SBATCH --output=/data/users/tschlatter/GenomeandTranscriptome/output_nuncmer_%j.o
#SBATCH --error=/data/users/tschlatter/GenomeandTranscriptome/error_nuncmer_%j.e
#SBATCH --partition=pibu_el8

WORKDIR=/data/users/tschlatter/GenomeandTranscriptome/
cd $WORKDIR

mkdir -p nuncmer_results

OUTPUTDIR=/data/users/tschlatter/GenomeandTranscriptome/nuncmer_results

ref=/data/courses/assembly-annotation-course/references/Arabidopsis_thaliana.TAIR10.dna.toplevel.fa
hifi=/data/users/tschlatter/GenomeandTranscriptome/Assemblies/hifiasm/hifiasm.bp.p_ctg.fa
lja=/data/users/tschlatter/GenomeandTranscriptome/Assemblies/LJA/assembly.fasta
flye=/data/users/tschlatter/GenomeandTranscriptome/Assemblies/flye/assembly.fasta


apptainer exec \
--bind $WORKDIR \
/containers/apptainer/mummer4_gnuplot.sif \
bash -c "
echo Start && \
nucmer --prefix=$OUTPUTDIR/fvr --breaklen 1000 --mincluster 1000 $ref $flye && \
nucmer --prefix=$OUTPUTDIR/hvr --breaklen 1000 --mincluster 1000 $ref $hifi && \
nucmer --prefix=$OUTPUTDIR/lvr --breaklen 1000 --mincluster 1000 $ref $lja && \
nucmer --prefix=$OUTPUTDIR/hvl --breaklen 1000 --mincluster 1000 $hifi $lja && \
nucmer --prefix=$OUTPUTDIR/hvf --breaklen 1000 --mincluster 1000 $hifi $flye && \
nucmer --prefix=$OUTPUTDIR/fvl --breaklen 1000 --mincluster 1000 $flye $lja"
