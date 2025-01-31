#!/usr/bin/env bash

#SBATCH --cpus-per-task=16
#SBATCH --mem=128G
#SBATCH --time=1-00:00:00
#SBATCH --job-name=merqury_full
#SBATCH --output=/data/users/tschlatter/GenomeandTranscriptome/output_merqfull_%j.o
#SBATCH --error=/data/users/tschlatter/GenomeandTranscriptome/error_merqfull_%j.e
#SBATCH --partition=pibu_el8

WORKDIR=/data/users/tschlatter/GenomeandTranscriptome/
cd $WORKDIR

export MERQURY="/usr/local/share/merqury"
READS_MERYL=/data/users/tschlatter/GenomeandTranscriptome/merq/reads.meryl

hifi=/data/users/tschlatter/GenomeandTranscriptome/Assemblies/hifiasm/hifiasm.bp.p_ctg.fa
lja=/data/users/tschlatter/GenomeandTranscriptome/Assemblies/LJA/assemblylja.fasta
flye=/data/users/tschlatter/GenomeandTranscriptome/Assemblies/flye/assembly.fasta

#apptainer exec \
#--bind $WORKDIR \
#/containers/apptainer/merqury_1.3.sif \
#bash /data/users/tschlatter/GenomeandTranscriptome/scripts/merqury.sh $READS_MERYL $hifi hifi

#apptainer exec \
#--bind $WORKDIR \
#/containers/apptainer/merqury_1.3.sif \
#bash /data/users/tschlatter/GenomeandTranscriptome/scripts/merqury.sh $READS_MERYL $flye flye

apptainer exec \
--bind $WORKDIR \
/containers/apptainer/merqury_1.3.sif \
bash /data/users/tschlatter/GenomeandTranscriptome/scripts/merqury.sh $READS_MERYL $lja lja