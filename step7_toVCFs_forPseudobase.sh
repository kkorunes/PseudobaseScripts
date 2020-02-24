#!/bin/bash
#SBATCH --mem=80GB

cd /datacommons/noor2/klk37/BackgroundSelection/gvcfs
PATH=/datacommons/noor/klk37/java/jdk1.8.0_144/bin:$PATH
export PATH

#Repeat this step for each chromosome (2,3,4,XL,XR)
c=2

#jointly genotype the haplotype caller gvcfs
/datacommons/noor/klk37/gatk-4.1.1.0/gatk --java-options "-Xmx80g" GenotypeGVCFs \
	-R /datacommons/noor2/klk37/BackgroundSelection/dpse-all-chromosome-r3.04.fasta \
	-V gendb://chr2_genotyped_ForPseudobase_genomicsDB \
	-L ${c} \
	-O chr2_forPseudobase_genotyped.vcf.gz
