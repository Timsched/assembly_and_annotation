#!/usr/bin/env bash

#SBATCH --cpus-per-task=16
#SBATCH --mem=64G
#SBATCH --time=1-00:00:00
#SBATCH --job-name=mummer
#SBATCH --output=/data/users/tschlatter/GenomeandTranscriptome/output_mummer_%j.o
#SBATCH --error=/data/users/tschlatter/GenomeandTranscriptome/error_mummer_%j.e
#SBATCH --partition=pibu_el8

WORKDIR=/data/users/tschlatter/GenomeandTranscriptome/
cd $WORKDIR

mkdir -p mummer_results

OUTPUTDIR=/data/users/tschlatter/GenomeandTranscriptome/mummer_results
ref=/data/courses/assembly-annotation-course/references/Arabidopsis_thaliana.TAIR10.dna.toplevel.fa
hifi=/data/users/tschlatter/GenomeandTranscriptome/Assemblies/hifiasm/hifiasm.bp.p_ctg.fa
lja=/data/users/tschlatter/GenomeandTranscriptome/Assemblies/LJA/assembly.fasta
flye=/data/users/tschlatter/GenomeandTranscriptome/Assemblies/flye/assembly.fasta

apptainer exec \
--bind $WORKDIR \
/containers/apptainer/mummer4_gnuplot.sif \
bash -c "
mummerplot --png -R $ref --layout --large -p $OUTPUTDIR/fvr2 -Q $flye --filter --fat $WORKDIR/nuncmer_results/fvr.delta && \
mummerplot --png -R $ref --layout --large -p $OUTPUTDIR/hvr2 -Q $hifi --filter --fat $WORKDIR/nuncmer_results/hvr.delta && \
mummerplot --png -R $ref --layout --large -p $OUTPUTDIR/lvr2 -Q $lja --filter --fat $WORKDIR/nuncmer_results/lvr.delta" 
#mummerplot --png --layout --large -p $OUTPUTDIR/hvl $WORKDIR/nuncmer_results/hvl.delta && \
#mummerplot --png --layout --large -p $OUTPUTDIR/hvf $WORKDIR/nuncmer_results/hvf.delta && \
#mummerplot --png --layout --large -p $OUTPUTDIR/fvl $WORKDIR/nuncmer_results/fvl.delta"


