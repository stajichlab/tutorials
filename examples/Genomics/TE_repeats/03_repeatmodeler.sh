#!/usr/bin/bash
#SBATCH -N 1 -n 16 --out RepeatModeler.%A.log -J RepMdl

CPU=$SLURM_CPUS_ON_NODE # set the CPUS dynamicall for the job
if [ -z $CPU ]; then # unless this is not really a slurm job
 CPU=2 # set the number of CPUs to 2
fi
module load RepeatModeler/2.0.1
SPECIES=AfumigatusAf293
if [ ! -f $SPECIES.translation ]; then # assumes using rmblast as default
  BuildDatabase -name $SPECIES $SPECIES.genome.fasta
fi

RepeatModeler -database $SPECIES -LTRStruct -pa $CPU

