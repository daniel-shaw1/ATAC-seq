#PBS -S /bin/bash
#PBS -q batch
#PBS -N Ref
#PBS -l nodes=1:ppn=1:mwnode
#PBS -l mem=15gb
#PBS -l walltime=12:00:00
#PBS -M daniel.shaw@uga.edu
#PBS -m ae

cd /home/des65576/rex/

export ref=" /home/des65576/rex/G"

module load bedtools/2.25.0

for file in *.bam
do
        export iden=${file%%.*}
        bedtools genomecov -ibam ${file} -g ${ref} > ${iden}.log
done
