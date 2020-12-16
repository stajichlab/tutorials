#!/usr/bin/bash
SPECIES=AfumigatusAf293
GENOME=$SPECIES.genome.fasta

CPU=$SLURM_CPUS_ON_NODE # set the CPUS dynamicall for the job
if [ -z $CPU ]; then # unless this is not really a slurm job
 CPU=2 # set the number of CPUs to 2
fi
module load RepeatMasker  # note current version at time of this writing was 4-1-1 to load that specific version:
ODIR=Run1

if [ ! -f $ODIR/$SPECIES.RM.log ]; then
	RepeatMasker -pa $CPU -e rmblast -species fungi -dir $ODIR $GENOME > $ODIR/$SPECIES.RM.log
fi
