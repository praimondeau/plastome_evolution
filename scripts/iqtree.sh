#!/bin/bash
#SBATCH -p workq
#SBATCH -t 04:00:00 #Acceptable time formats include "minutes", "minutes:seconds", "hours:minutes:seconds", "days-hours", "days-hours:minutes" and "days-hours:minutes:seconds". 

#module load bioinfo/iqtree-2.0.6 ; iqtree -s 119_80_concat -p partitions -st DNA -bb 1000 -pre 119_80
