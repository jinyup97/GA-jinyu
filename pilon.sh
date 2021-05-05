#!/bin/bash -l

#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 03:00:00
#SBATCH -J pilon
#SBATCH --mail-type=ALL
#SBATCH --mail-user maggiepeng1997@outlook.com


module load bioinfo-tools
module load Pilon

java -Xmx16G -jar $PILON_HOME/pilon.jar  --genome /domus/h1/jinyup/galab/canu/durian-pacbio/pacbio.contigs.fasta --frags /domus/h1/jinyup/galab/bwa/bwa-mem-pe.bam \
    --fix all \
    --output pilon_polished --vcf &> pilon.log