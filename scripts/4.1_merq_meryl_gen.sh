#!/usr/bin/env bash

#SBATCH --cpus-per-task=16
#SBATCH --mem=32G
#SBATCH --time=1-00:00:00
#SBATCH --job-name=merqury_db
#SBATCH --output=/data/users/tschlatter/GenomeandTranscriptome/output_merqdb_%j.o
#SBATCH --error=/data/users/tschlatter/GenomeandTranscriptome/error_merqdb_%j.e
#SBATCH --partition=pibu_el8

WORKDIR=/data/users/tschlatter/GenomeandTranscriptome/
cd $WORKDIR

#mkdir -p merq

OUTPUTDIR=/data/users/tschlatter/GenomeandTranscriptome/merq

apptainer exec \
--bind $WORKDIR \
/containers/apptainer/merqury_1.3.sif \
bash -c "
meryl k=17 count /data/users/tschlatter/GenomeandTranscriptome/Assemblies/LJA/assembly.fasta output $OUTPUTDIR/LJA.meryl && \
meryl k=17 count /data/users/tschlatter/GenomeandTranscriptome/Assemblies/hifiasm/hifiasm.bp.p_ctg.fa  output $OUTPUTDIR/hifiasm.meryl && \
meryl k=17 count /data/users/tschlatter/GenomeandTranscriptome/filtered/Pac_ERR11437340.fastq.gz output $OUTPUTDIR/reads.meryl && \
meryl k=17 count /data/users/tschlatter/GenomeandTranscriptome/Assemblies/flye/assembly.fasta  output $OUTPUTDIR/flye.meryl"