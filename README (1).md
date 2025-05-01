# Bioinformatics Pipeline: Variant Analysis using FastQC and ANNOVAR

This repository contains a sample bioinformatics pipeline script that demonstrates basic analysis steps typically used in whole-exome or targeted sequencing projects. It reflects the kind of data processing I performed during my Master's research in Human Molecular Genetics.

## 🔧 Tools Used
- [FastQC](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/) for quality control of raw sequencing data
- [ANNOVAR](http://annovar.openbioinformatics.org/en/latest/) for functional annotation of genetic variants using reference gene databases and ClinVar

## 📂 Files
- `variant_pipeline.sh` – Bash script that runs FastQC on paired-end FASTQ files, converts VCF to ANNOVAR input format, performs variant annotation, and filters pathogenic variants from ClinVar.

## 🚀 How to Use

1. Make sure `fastqc`, `perl`, and `ANNOVAR` are installed and accessible in your environment.
2. Place your input files in the working directory:
    - `sample_R1.fastq.gz` and `sample_R2.fastq.gz` – your paired-end sequencing reads
    - `input.vcf` – your VCF file of called variants
    - ANNOVAR's `humandb/` directory with the required databases
3. Run the script:
```bash
bash variant_pipeline.sh
```

4. Output:
    - FastQC quality reports
    - `annotated_output.hg19_multianno.csv` – ANNOVAR-annotated variant file
    - `filtered_variants.csv` – contains variants marked as pathogenic or likely pathogenic in ClinVar

## 🧬 Author
**Ayesha Khush Bakht**  
Master's in Zoology (Human Molecular Genetics)  
Scientific Laboratory Assistant | Molecular Biology & Bioinformatics  
