#PBS -S /bin/bash
#PBS -q batch
#PBS -N trim
#PBS -l nodes=1:ppn=12
#PBS -l mem=10gb
#PBS -l walltime=24:00:00
#PBS -M daniel.shaw@uga.edu
#PBS -m ae


cd /lustre1/des65576/Adult_Liver3-46373394/

module load Trimmomatic/0.36-Java-1.8.0_144


for file in *_R1_*

do
  export iden=${file%%.fastq.gz}
  export log=${iden}.log
  export output=${iden}_trim.fastq.gz
java -jar /usr/local/apps/eb/Trimmomatic/0.36-Java-1.8.0_144/trimmomatic-0.36.jar PE -threads 16 -phred64 -trimlog ${bam}.log -basein ${file} -baseout ${output}_trim.fastq.gz ILLUMINACLIP:/usr/local/apps/eb/Trimmomatic/0.36-Java-1.8.0_144/adapters/NexteraPE-PE.fa:2:30:10 LEADING:0 TRAILING:0 MINLEN:30
done


