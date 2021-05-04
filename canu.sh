#!/bin/bash -l

#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 20:00:00
#SBATCH -J canu_durian
#SBATCH --mail-type=ALL
#SBATCH --mail-user maggiepeng1997@outlook.com

module load bioinfo-tools
module load canu



canu \
 -p pacbio -d durian-pacbio \
 genomeSize=26.5m \
 -pacbio /home/jinyup/galab/rawdata/pacbio_data/SRR6037732_scaffold_06.fq.gz