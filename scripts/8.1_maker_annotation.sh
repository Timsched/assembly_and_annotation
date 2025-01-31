#!/bin/bash
#SBATCH --time=4-0
#SBATCH --mem=64G
#SBATCH -p pibu_el8
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=50
#SBATCH --job-name=Maker
#Sbatch --output=logs/Maker_gene_annotation_%j.out
#Sbatch --error=logs/Maker_gene_annotation_%j.err

COURSEDIR="/data/courses/assembly-annotation-course/CDS_annotation"
WORKDIR="/data/users/tschlatter/GenomeandTranscriptome/Annotation"
REPEATMASKER_DIR="/data/courses/assembly-annotation-course/CDS_annotation/softwares/RepeatMasker"
cd $WORKDIR
export PATH=$PATH:"/data/courses/assembly-annotation-course/CDS_annotation/softwares/RepeatMasker"
module load OpenMPI/4.1.1-GCC-10.3.0
module load AUGUSTUS/3.4.0-foss-2021a
mpiexec --oversubscribe -n 50 apptainer exec \
 --bind $SCRATCH:/TMP --bind $COURSEDIR --bind $AUGUSTUS_CONFIG_PATH --bind $REPEATMASKER_DIR \
 ${COURSEDIR}/containers/MAKER_3.01.03.sif \
 maker -mpi --ignore_nfs_tmp -TMP /TMP maker_opts.ctl maker_bopts.ctl maker_evm.ctl maker_exe.ctl