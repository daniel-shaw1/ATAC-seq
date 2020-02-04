#PBS -S /bin/bash
#PBS -q batch
#PBS -N MarkDups
#PBS -l nodes=1:ppn=24
#PBS -l mem=50gb
#PBS -l walltime=100:00:00
#PBS -m ae


cd /scratch/des65576/maleATACnovember/LW_T2_M/
ml picard/2.4.1-Java-1.8.0_144
ml SAMtools/1.9-foss-2016b

for file in *MapQ20*
do
        export iden=${file%%_.*}
        export output=${iden}_mdup.bam
        export met=${iden}metrics.txt
        java -Xmx20g -classpath "/usr/local/apps/eb/picard/2.16.0-Java-1.8.0_144/" -jar /usr/local/apps/eb/picard/2.16.0-Java-1.8.0_144/picard.jar MarkDuplicates REMOVE_DUPLICATES=true I=${file} O=${output} M=${met}
        samtools index -b ${output}
done


