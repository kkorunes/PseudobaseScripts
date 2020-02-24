#!/bin/bash
#SBATCH --mem=10GB
#SBATCH -p noor
cd /datacommons/noor2/klk37/PseudobaseUpdates2019/genotype
#Create initial variant calls

FILES=*.bam
for BAM in $FILES
do
	ID="$(echo ${BAM} | awk -F'[.]' '{print $1}')"
	echo "calling variants for $ID"
	OUT="$ID".g.vcf.gz
	echo "$OUT"
	FILE=${ID}_runHaplotypeCaller.sh
	echo "#!/bin/bash" >> $FILE
	echo "#SBATCH --mem=40G" >> $FILE
	echo "cd /datacommons/noor2/klk37/PseudobaseUpdates2019/genotype" >> $FILE
	echo "PATH=/datacommons/noor/klk37/java/jdk1.8.0_144/bin:$PATH" >> $FILE
	echo "export PATH" >> $FILE
	echo "/datacommons/noor/klk37/gatk-4.1.1.0/gatk --java-options "-Xmx100G" HaplotypeCaller \\" >> $FILE
	echo "-R /datacommons/noor2/klk37/BackgroundSelection/dpse-all-chromosome-r3.04.fasta -I $BAM -O $OUT -ERC GVCF" >> $FILE
	sbatch $FILE;
done
