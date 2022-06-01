#!/bin/sh
#SBATCH --partition=batch
#SBATCH --ntasks-per-node=24
#SBATCH --nodes=1
#SBATCH --mem=6gb
#SBATCH --time=72:00:00


cd /scratch/des65576/blastninespine/ACR_ext/
ml snp-sites/2.5.1-conda
for file in *coreprom*

do
  export iden=${file%%.fasta}
  export output=${iden}.vcf

snp-sites -v ${file} > ${output}

done

vcfloop.sh (END)

