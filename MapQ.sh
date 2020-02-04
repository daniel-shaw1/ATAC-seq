#PBS -S /bin/bash
#PBS -q batch
#PBS -N Map
#PBS -l nodes=1:ppn=20
#PBS -l mem=15gb
#PBS -l walltime=12:00:00
#PBS -m ae

cd /scratch/des65576/maleATACnovember/LW_T2_M/

module load SAMtools/1.6-foss-2016b

for file in *.bam
do
        export iden=${file%%.*}
        samtools view -bq 20 ${file} > ${iden}_MapQ20.bam

done

