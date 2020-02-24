#!/bin/bash
#SBATCH --mem=60GB

cd /datacommons/noor2/klk37/BackgroundSelection/gvcfs
PATH=/datacommons/noor/klk37/java/jdk1.8.0_144/bin:$PATH
export PATH
#jointly genotype the haplotype caller gvcfs

#Repeat this step for each chromosome (2,3,4,XL,XR):
c=2

/datacommons/noor/klk37/gatk-4.1.1.0/gatk --java-options "-Xmx80g -Xms40g" GenomicsDBImport \
	-V Dmir_MA28_dedup_reads.g.vcf.gz \
	-V Dmir_MAO101-4_dedup_reads.g.vcf.gz \
	-V Dmir_MAO3-3_dedup_reads.g.vcf.gz \
	-V Dmir_MAO3-4_dedup_reads.g.vcf.gz \
	-V Dmir_MAO3-5_dedup_reads.g.vcf.gz \
	-V Dmir_MAO3-6_dedup_reads.g.vcf.gz \
	-V Dmir_ML14_dedup_reads.g.vcf.gz \
	-V Dmir_ML16_dedup_reads.g.vcf.gz \
	-V Dmir_ML6f_dedup_reads.g.vcf.gz \
	-V Dmir_SP138_dedup_reads.g.vcf.gz \
	-V Dmir_SP235_dedup_reads.g.vcf.gz \
	-V Dpse_PP1134_dedup_reads.g.vcf.gz \
	-V Dpse_PP1137_dedup_reads.g.vcf.gz \
	-V Dpse_AFC12_dedup_reads.g.vcf.gz \
	-V Dpse_FS18_dedup_reads.g.vcf.gz \
	-V Dpse_MAT32_dedup_reads.g.vcf.gz \
	-V Dpse_MATTL_dedup_reads.g.vcf.gz \
	-V Dpse_MSH24_dedup_reads.g.vcf.gz \
	-V Dpse_MSH9_dedup_reads.g.vcf.gz \
	-V Dpse_S10-A47_dedup_reads.g.vcf.gz \
	-V Dpse_S11-A14_dedup_reads.g.vcf.gz \
	-V Dpse_S12-M27_dedup_reads.g.vcf.gz \
	-V Dpse_S13-A48_dedup_reads.g.vcf.gz \
	-V Dpse_S14-A49_dedup_reads.g.vcf.gz \
	-V Dpse_S15-A57_dedup_reads.g.vcf.gz \
	-V Dpse_S16-A30_dedup_reads.g.vcf.gz \
	-V Dpse_S17-M20_dedup_reads.g.vcf.gz \
	-V Dpse_S18-M15_dedup_reads.g.vcf.gz \
	-V Dpse_S19-A24_dedup_reads.g.vcf.gz \
	-V Dpse_S1-A56_dedup_reads.g.vcf.gz \
	-V Dpse_S20-M13_dedup_reads.g.vcf.gz \
	-V Dpse_S21-M6_dedup_reads.g.vcf.gz \
	-V Dpse_S22-A6_dedup_reads.g.vcf.gz \
	-V Dpse_S2-MV225_dedup_reads.g.vcf.gz \
	-V Dpse_S3-M14_dedup_reads.g.vcf.gz \
	-V Dpse_S4-A60_dedup_reads.g.vcf.gz \
	-V Dpse_S5-M17_dedup_reads.g.vcf.gz \
	-V Dpse_S6-A19_dedup_reads.g.vcf.gz \
	-V Dpse_S7-Flag14_dedup_reads.g.vcf.gz \
	-V Dpse_S9-A12_dedup_reads.g.vcf.gz \
	-V lowei_renamedRG_dedup.g.vcf.gz \
	-V Bogotana-SCinv_piped.g.vcf.gz \
	-V Suta3_piped.g.vcf.gz \
	-V Toro4_piped.g.vcf.gz \
	-V WhiteER_piped.g.vcf.gz \
	-V MSH1993_dedup_reads.g.vcf.gz \
	-V MSH39_dedup_reads.g.vcf.gz \
	-V SC04_dedup_reads.g.vcf.gz \
	-V Toro1_dedup_reads.g.vcf.gz \
	-V DperSR_dedup_reads.g.vcf.gz \
	-V DperST_dedup_reads.g.vcf.gz \
	-V DpseSR_dedup_reads.g.vcf.gz \
	-V DpseST_dedup_reads.g.vcf.gz \
	--genomicsdb-workspace-path chr2_genotyped_ForPseudobase_genomicsDB \
	-L ${c}
