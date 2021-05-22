#!/bin/bash -l

#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 03:00:00
#SBATCH -J trimmomatic
#SBATCH --mail-type=ALL
#SBATCH --mail-user maggiepeng1997@outlook.com

module load bioinfo-tools
module load trimmomatic

trimmomatic PE \
		-threads 4 \
		-trimlog trim.log \
		/domus/h1/jinyup/galab/rawdata/transcriptome/untrimmed/SRR6040095_scaffold_06.1.fastq.gz /domus/h1/jinyup/galab/rawdata/transcriptome/untrimmed/SRR6040095_scaffold_06.2.fastq.gz \
		output_forward_paired_R1.fq.gz  output_forward_unpaired_R1.fq.gz output_reverse_paired_R2.fq.gz output_reverse_unpaired_R2.fq.gz \
		ILLUMINACLIP:TruSeq3-SE:2:30:10 \
		SLIDINGWINDOW:4:15 \
		LEADING:3 \
		TRAILING:3 