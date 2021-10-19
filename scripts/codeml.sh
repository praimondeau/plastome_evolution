#!/bin/bash
#SBATCH  -p unlimitq
#SBATCH --job-name=M2

module load bioinfo/paml4.9h

yes \n | codeml m2gene_codeml.ctl

