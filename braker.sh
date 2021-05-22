#!/bin/bash -l

#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 03:00:00
#SBATCH -J braker
#SBATCH --mail-type=ALL
#SBATCH --mail-user maggiepeng1997@outlook.com



cp -vf /sw/bioinfo/GeneMark/4.33-es/snowy/gm_key $HOME/.gm_key

module load bioinfo-tools
module load braker/2.1.1_Perl5.24.1 
module load augustus/3.2.3_Perl5.24.1 
module load bamtools/2.5.1
module load blast/2.9.0+
module load GenomeThreader/1.7.0 
module load samtools/1.8
module load GeneMark/4.33-es_Perl5.24.1

dir=/domus/h1/jinyup/galab/star
source $AUGUSTUS_CONFIG_COPY
braker.pl \
    --cores 4 --species=durian --genome=/domus/h1/jinyup/galab/pilon/pilon_polished.fasta \
    --bam=$dir/SRR6040092Aligned.sortedByCoord.out.bam,$dir/SRR6040093Aligned.sortedByCoord.out.bam,$dir/SRR6040094Aligned.sortedByCoord.out.bam,$dir/SRR6040096Aligned.sortedByCoord.out.bam,$dir/SRR6040097Aligned.sortedByCoord.out.bam,$dir/SRR6156066Aligned.sortedByCoord.out.bam,$dir/SRR6156067Aligned.sortedByCoord.out.bam,$dir/SRR6156069Aligned.sortedByCoord.out.bam \
    --AUGUSTUS_BIN_PATH=/sw/bioinfo/augustus/3.4.0/snowy/bin \
    --AUGUSTUS_SCRIPTS_PATH=/sw/bioinfo/augustus/3.4.0/snowy/scripts \
    --GENEMARK_PATH=/sw/bioinfo/GeneMark/4.33-es/snowy
