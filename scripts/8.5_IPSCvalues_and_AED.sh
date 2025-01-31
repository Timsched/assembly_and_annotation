#!/usr/bin/env bash

#SBATCH --cpus-per-task=20
#SBATCH --mem=64G
#SBATCH --time=1-00:00:00
#SBATCH --job-name=IPSreplacementandAED
#SBATCH --output=/data/users/tschlatter/GenomeandTranscriptome/output_IPSreplacementandAED_%j.o
#SBATCH --error=/data/users/tschlatter/GenomeandTranscriptome/error_IPSreplacementandAED_%j.e
#SBATCH --partition=pibu_el8



WORKDIR="/data/users/tschlatter/GenomeandTranscriptome/final"
COURSEDIR="/data/courses/assembly-annotation-course/CDS_annotation"
MAKERBIN="$COURSEDIR/softwares/Maker_v3.01.03/src/bin"
cd $WORKDIR
gff="assembly.all.maker.noseq.gff"

 $MAKERBIN/ipr_update_gff ${gff}.renamed.gff output.iprscan >${gff}.renamed.iprscan.gff #incoporate ipr values

echo "iprdone"

perl $MAKERBIN/AED_cdf_generator.pl -b 0.025 ${gff}.renamed.gff >assembly.all.maker.renamed.gff.AED.txt
