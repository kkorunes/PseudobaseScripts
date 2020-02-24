#!/bin/bash
#SBATCH --mem=100GB
#SBATCH -p noor
cd /datacommons/noor2/klk37/BackgroundSelection/gvcfs
PATH=/datacommons/noor/klk37/java/jdk1.8.0_144/bin:$PATH
export PATH

#Filter SNPs and INDELS separately, then merge both sets of filtered variants

#Repeat for each chromosome (2,3,4,XL,XR)
c=2

#SNPS:
/datacommons/noor/klk37/gatk-4.1.1.0/gatk SelectVariants \
	-R /datacommons/noor2/klk37/BackgroundSelection/dpse-all-chromosome-r3.04.fasta \
	-V chr${c}_forPseudobase_genotyped.vcf.gz \
	--select-type-to-include SNP \
	-O chr${c}_forPseudobase_SNPS.vcf.gz

/datacommons/noor/klk37/gatk-4.1.1.0/gatk VariantFiltration \
	-R /datacommons/noor2/klk37/BackgroundSelection/dpse-all-chromosome-r3.04.fasta \
	-V chr${c}_forPseudobase_SNPS.vcf.gz \
	-O chr${c}_forPseudobase_filteredSNPS.vcf.gz \
	--filter-expression "QD < 2.0 || FS > 60.0 || SOR > 3.0 || MQ < 40.0 || MQRankSum < -12.5 || ReadPosRankSum < -8.0" \
	--filter-name "SNPhardfilter"

#INDELS:
/datacommons/noor/klk37/gatk-4.1.1.0/gatk SelectVariants \
	-R /datacommons/noor2/klk37/BackgroundSelection/dpse-all-chromosome-r3.04.fasta \
	-V chr${c}_forPseudobase_genotyped.vcf.gz \
	--select-type-to-include INDEL \
	-O chr${c}_forPseudobase_INDELS.vcf.gz

/datacommons/noor/klk37/gatk-4.1.1.0/gatk VariantFiltration \
	-R /datacommons/noor2/klk37/BackgroundSelection/dpse-all-chromosome-r3.04.fasta \
	-V chr${c}_forPseudobase_INDELS.vcf.gz \
	-O chr${c}_forPseudobase_filteredINDELS.vcf.gz \
	--filter-expression "QD < 2.0 || FS > 200.0 || SOR > 10.0 || ReadPosRankSum < 20.0" \
	--filter-name "INDELhardfilter"

#Merge:
java -jar /datacommons/noor/klk37/picard.jar MergeVcfs \
	I=chr${c}_forPseudobase_filteredINDELS.vcf.gz \
	I=chr${c}_forPseudobase_filteredSNPS.vcf.gz \
	O=chr${c}_forPseudobase_mergedSNPS-INDELS.vcf.gz
