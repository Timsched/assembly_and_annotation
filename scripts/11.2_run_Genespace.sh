#!/bin/bash
#SBATCH --time=1-0
#SBATCH --mem=64G
#SBATCH -p pibu_el8
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=20
#SBATCH --job-name=Genespace
#SBATCH --output=/data/users/tschlatter/GenomeandTranscriptome/output_GENSPACE_%j.o
#SBATCH --error=/data/users/tschlatter/GenomeandTranscriptome/error_GENESPACE_%j.e

COURSEDIR="/data/courses/assembly-annotation-course/CDS_annotation"
WORKDIR="/data/users/tschlatter/GenomeandTranscriptome/final"
cd $WORKDIR

apptainer exec \
    --bind $COURSEDIR \
    --bind $WORKDIR \
    --bind $SCRATCH:/temp \
    $COURSEDIR/containers/genespace_latest.sif Rscript /data/users/tschlatter/GenomeandTranscriptome/scripts/11.1_Genespace.R genespace

# apptainer shell \
#     --bind $COURSEDIR \
#     --bind $WORKDIR \
#     --bind $SCRATCH:/temp \
#     $COURSEDIR/containers/genespace_latest.sif