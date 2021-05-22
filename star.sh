#!/bin/bash -l

#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 20:00:00
#SBATCH -J star
#SBATCH --mail-type=ALL
#SBATCH --mail-user maggiepeng1997@outlook.com

module load bioinfo-tools
module load star

a=("SRR6040092" "SRR6040093" "SRR6040094" "SRR6040096" "SRR6040097" "SRR6156066" "SRR6156067" "SRR6156069")

STAR --runThreadN 8 \
     --runMode genomeGenerate \
     --genomeDir /domus/h1/jinyup/galab/star \
     --genomeFastaFiles /domus/h1/jinyup/galab/pilon/pilon_polished.fasta \
     --genomeSAindexNbases 12 

for i in ${a[@]}
do
    STAR --genomeDir /domus/h1/jinyup/galab/star \
         --runThreadN 8 \
         --readFilesIn /domus/h1/jinyup/galab/rawdata/transcriptome/trimmed/${i}_scaffold_06.1.fastq.gz /domus/h1/jinyup/galab/rawdata/transcriptome/trimmed/${i}_scaffold_06.2.fastq.gz \
         --readFilesCommand zcat \
         --outFileNamePrefix /domus/h1/jinyup/galab/star/${i} \
         --outSAMtype BAM SortedByCoordinate 
done

