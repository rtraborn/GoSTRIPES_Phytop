#!/bin/bash

#SBATCH -n 1
#SBATCH -t 0-8:00
#SBATCH -A rraborn
#SBATCH -p cmecpu1
#SBATCH -q cmeqos
#SBATCH -o slurm.%j.out
#SBATCH -e slurm.%j.err

myDir=/scratch/rraborn/GoSTRIPES_Phytop/STRIPES/
sampleFolder=Pt132

module load singularity/3.6.3

source /home/rraborn/genome_analysis/GoSTRIPES/bin/xworkStripes -b /scratch/rraborn/GoSTRIPES_Phytop/STRIPES -i /scratch/rraborn/GoSTRIPES_Phytop/STRIPES/gostripes.simg


echo "Launching job"

cd $myDir/$sampleFolder

$rws make -n

$rws make

echo "Job complete"
