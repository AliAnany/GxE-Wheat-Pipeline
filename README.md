# GxE-Wheat-Pipeline

[![R](https://img.shields.io/badge/R-4.5%2B-blue.svg)](https://cran.r-project.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Status](https://img.shields.io/badge/status-under%20development-orange.svg)]()

## Overview

**GxE-Wheat-Pipeline** is an open-source R pipeline for the analysis of **Multi-Environment Trials (MET)** in wheat and other crop species.

The pipeline integrates state-of-the-art statistical methods for:

- Mixed Linear Models (BLUPs and BLUEs)
- Variance Component Estimation
- Broad-Sense Heritability
- AMMI Analysis
- GGE Biplot Analysis
- WAASB Stability Analysis
- Genotype Stability Statistics
- Mega-Environment Identification
- Publication-Quality Figures
- Automated Reports

The project is designed for plant breeders, quantitative geneticists, agronomists, and researchers working with multi-environment trial data.

---

## Features

- Data quality control
- Exploratory data analysis
- Mixed linear models using **sommer**
- BLUP and BLUE estimation
- Variance component estimation
- Broad-sense heritability
- AMMI analysis
- GGE biplot visualization
- WAASB stability analysis
- Finlay–Wilkinson regression
- Lin & Binns superiority index
- Shukla stability variance
- Environmental clustering
- Mega-environment identification
- Automatic report generation
- Publication-quality figures (300–600 dpi)

---

## Repository Structure

```text
GxE-Wheat-Pipeline
│
├── data/
├── R/
├── scripts/
├── figures/
├── reports/
├── results/
├── tests/
├── README.md
├── LICENSE
└── run_all.R
```

---

## Installation

Clone the repository

```bash
git clone https://github.com/AliAnany/GxE-Wheat-Pipeline.git
```

Open the project in RStudio.

Install required packages

```r
install.packages(c(
  "tidyverse",
  "sommer",
  "metan",
  "GGEBiplots",
  "lme4",
  "lmerTest",
  "openxlsx",
  "patchwork",
  "ggplot2"
))
```

---

## Input Data

Input data should contain at least the following variables.

| Variable | Description |
|----------|-------------|
| Genotype | Genotype identifier |
| Environment | Trial location or environment |
| Rep | Replication |
| Yield | Response variable |

Example

| Genotype | Environment | Rep | Yield |
|----------|-------------|-----|------:|
| G1 | E1 | 1 | 6.42 |
| G1 | E1 | 2 | 6.55 |
| G2 | E1 | 1 | 5.91 |

---

## Workflow

```text
Raw Data
   │
   ▼
Quality Control
   │
   ▼
Exploratory Analysis
   │
   ▼
Mixed Linear Model
   │
   ▼
BLUPs / BLUEs
   │
   ▼
Variance Components
   │
   ▼
Heritability
   │
   ▼
AMMI
   │
   ▼
GGE Biplot
   │
   ▼
Stability Analysis
   │
   ▼
Mega-Environment Analysis
   │
   ▼
Publication Figures
```

---

## Main Analyses

- Mixed Linear Models
- BLUP Estimation
- BLUE Estimation
- Variance Components
- Broad-Sense Heritability
- AMMI
- GGE Biplots
- WAASB
- MTSI
- Finlay–Wilkinson
- Lin & Binns
- Shukla Stability
- Environmental Clustering

---

## Outputs

The pipeline automatically generates

- ANOVA tables
- Variance components
- BLUPs
- BLUEs
- Heritability estimates
- AMMI results
- GGE scores
- WAASB indices
- Stability rankings
- Publication-quality figures
- Excel reports
- HTML reports
- PDF reports

---

## Planned Modules

- [ ] Data import
- [ ] Quality control
- [ ] Mixed linear models
- [ ] BLUP estimation
- [ ] BLUE estimation
- [ ] Variance components
- [ ] Heritability
- [ ] AMMI
- [ ] GGE Biplots
- [ ] WAASB
- [ ] Stability statistics
- [ ] Genomic prediction
- [ ] Automatic report generation

---

## Citation

If you use this pipeline in your research, please cite the repository.

A formal citation file (`CITATION.cff`) will be added in a future release.

---

## Author

**Dr. Ali Hassan Ali Taha Anany**
Email: ali.anany@post.agr.cu.edu.eg
Mob:+201123108813
Assistant Researcher  
National Gene Bank (NGB)  
Agricultural Research Center (ARC)  
Egypt

Research interests

- Plant Genetics
- Quantitative Genetics
- Wheat Breeding
- Multi-Environment Trials
- GWAS
- Genomic Prediction
- Plant Bioinformatics

GitHub

https://github.com/AliAnany

---

## License

This project is released under the MIT License.

---

## Status

🚧 Under active development.

Contributions, suggestions, and collaborations are welcome.
