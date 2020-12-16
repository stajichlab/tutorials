#!/usr/bin/bash
RELEASE=49
SPECIES=AfumigatusAf293
URL=https://fungidb.org/common/downloads/release-${RELEASE}/$SPECIES/fasta/data/FungiDB-${RELEASE}_${SPECIES}_Genome.fasta
if [ ! -f $SPECIES.genome.fasta ]; then
	curl -o $SPECIES.genome.fasta $URL
fi

