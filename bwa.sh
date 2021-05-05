#!/bin/bash -l

#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 03:00:00
#SBATCH -J bwa
#SBATCH --mail-type=ALL
#SBATCH --mail-user maggiepeng1997@outlook.com

module load bioinfo-tools
module load bwa
module load samtools


bwa index /domus/h1/jinyup/galab/canu/durian-pacbio/pacbio.contigs.fasta
bwa mem /domus/h1/jinyup/galab/canu/durian-pacbio/pacbio.contigs.fasta /home/jinyup/galab/rawdata/illumina_data/SRR6058604_scaffold_06.1P.fastq.gz /home/jinyup/galab/rawdata/illumina_data/SRR6058604_scaffold_06.2P.fastq.gz > bwa-mem-pe.sam
samtools sort bwa-mem-pe.sam -o bwa-mem-pe.bam
samtools index bwa-mem-pe.bam bwa-mem-pe.bai
