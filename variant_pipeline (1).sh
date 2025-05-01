#!/bin/bash

# Bioinformatics Pipeline: Quality Control + Variant Annotation
# Author: Ayesha Khush Bakht
# Description: Example pipeline for analyzing sequencing data using FastQC and ANNOVAR

# Step 1: Quality Check using FastQC
echo "Running FastQC on input FASTQ files..."
fastqc sample_R1.fastq.gz sample_R2.fastq.gz

# Step 2: Convert VCF to ANNOVAR input format
echo "Converting VCF to ANNOVAR input format..."
convert2annovar.pl -format vcf4 input.vcf > input.avinput

# Step 3: Annotate variants using ANNOVAR
echo "Annotating variants with ANNOVAR..."
table_annovar.pl input.avinput humandb/ -buildver hg19 -out annotated_output -remove -protocol refGene,clinvar_20220320 -operation g,f -nastring . -csvout -polish

# Step 4: Extract pathogenic or likely pathogenic variants from ClinVar
echo "Filtering ClinVar pathogenic variants..."
awk -F',' '$0 ~ /pathogenic/ || $0 ~ /likely pathogenic/' annotated_output.hg19_multianno.csv > filtered_variants.csv

echo "Pipeline complete. Output: filtered_variants.csv"
