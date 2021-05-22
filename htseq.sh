#!/bin/bash -l

#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 03:00:00
#SBATCH -J htseq
#SBATCH --mail-type=ALL
#SBATCH --mail-user maggiepeng1997@outlook.com

module load bioinfo-tools
module load htseq


a=("SRR6040092" "SRR6040093" "SRR6040094" "SRR6040096" "SRR6040097" "SRR6156066" "SRR6156067" "SRR6156069")

for i in ${a[@]}
do
htseq-count -f bam -s no /domus/h1/jinyup/galab/star/${i}Aligned.sortedByCoord.out.bam /domus/h1/jinyup/galab/sequence.gff3 > ${i}.count
done