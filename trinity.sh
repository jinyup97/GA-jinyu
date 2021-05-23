#!/bin/bash -l

#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 20:00:00
#SBATCH -J trinity
#SBATCH --mail-type=ALL
#SBATCH --mail-user maggiepeng1997@outlook.com

module load bioinfo-tools
module load trinity

dir=/domus/h1/jinyup/galab/rawdata/transcriptome/trimmed
Trinity --seqType fq --max_memory 25G  \
         --left $dir/SRR6040092_scaffold_06.1.fastq.gz,$dir/SRR6040093_scaffold_06.1.fastq.gz,$dir/SRR6040094_scaffold_06.1.fastq.gz,$dir/SRR6040096_scaffold_06.1.fastq.gz,$dir/SRR6040097_scaffold_06.1.fastq.gz,$dir/SRR6156066_scaffold_06.1.fastq.gz,$dir/SRR6156067_scaffold_06.1.fastq.gz,$dir/SRR6156069_scaffold_06.1.fastq.gz \
         --right $dir/SRR6040092_scaffold_06.2.fastq.gz,$dir/SRR6040093_scaffold_06.2.fastq.gz,$dir/SRR6040094_scaffold_06.2.fastq.gz,$dir/SRR6040096_scaffold_06.2.fastq.gz,$dir/SRR6040097_scaffold_06.2.fastq.gz,$dir/SRR6156066_scaffold_06.2.fastq.gz,$dir/SRR6156067_scaffold_06.2.fastq.gz,$dir/SRR6156069_scaffold_06.2.fastq.gz \
         --CPU 4 