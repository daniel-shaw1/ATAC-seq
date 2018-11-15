#!/bin/bash
#PBS -q batch
#PBS -N macs
#PBS -l nodes=1:ppn=12:AMD
#PBS -l mem=20gb
#PBS -l walltime=48:00:00
#PBS -M daniel.shaw@uga.edu
#PBS -m ae

cd /lustre1/des65576/workDir/bamatac/bedfiles/


module load macs2/2.1.1

macs2 callpeak -t LiverATAC-1.bed -g hs --keep-dup all -n Liver-1macs
macs2 callpeak -t LiverATAC-2.bed -g hs --keep-dup all -n Liver-2macs
macs2 callpeak -t TestisATAC-1.bed -g hs --keep-dup all -n Testis-1macs
macs2 callpeak -t TestisATAC-2.bed -g hs --keep-dup all -n Testis-2macs
