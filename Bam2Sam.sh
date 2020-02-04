#PBS -S /bin/bash
#PBS -q batch
#PBS -N bam
#PBS -l nodes=1:ppn=12
#PBS -l mem=10gb
#PBS -l walltime=24:00:00
#PBS -m ae

cd /scratch/des65576/maleATACnovember/LW_T2_M/
module load SAMtools/1.6-foss-2016b

samtools view -bh LwT2M.sam > LWT2M_unsort.bam
samtools sort -o LWT2_sort.bam -T samfile_s LWT@m_unsort.bam
mv LWT2_sort.bam LWT2M.bam
samtools index -b LWT2M.bam
