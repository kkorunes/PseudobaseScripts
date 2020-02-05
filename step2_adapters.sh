#!/bin/bash
#SBATCH --mem=60GB
cd /datacommons/noor2/klk37/PseudobaseUpdates2019/

BAMs=*pairs.bam
for BAM in $BAMs
do
	name="$(echo ${BAM} | grep -oP '.*(?=_unaligned_read_pairs.bam)')"
	echo "working on $name"
	MET="$name"_mark_adapters_metrics.txt
	OUT="$name"_markadapters.bam
	/datacommons/noor/klk37/java/jdk1.8.0_144/bin/java -Xmx8G -jar /datacommons/noor/klk37/picard.jar MarkIlluminaAdapters \
		INPUT=$BAM \
		OUTPUT=$OUT \
		METRICS=$MET \
		TMP_DIR=`pwd`/tmp
done
