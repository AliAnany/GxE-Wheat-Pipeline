###############################################################
# FULL GxE ANALYSIS PIPELINE
# ANOVA + GGE + AMMI + STABILITY
# Author: Plant Breeding Research Pipeline
###############################################################

############################
# 1. Install packages
############################

packages <- c(
  "metan",
  "tidyverse",
  "GGEBiplots",
  "openxlsx"
)

new_packages <- packages[
  !(packages %in% installed.packages()[,"Package"])
]

if(length(new_packages))
  install.packages(new_packages)

library(metan)
library(tidyverse)
library(GGEBiplots)
library(openxlsx)

############################
# 2. Create folders
############################

dirs <- c(
  "data",
  "results",
  "figures"
)

sapply(dirs, function(x){
  if(!dir.exists(x))
    dir.create(x)
})

############################
# 3. Example dataset
############################

set.seed(123)

Genotype <- rep(
  paste0("G",1:10),
  each=15
)

Environment <- rep(
  rep(
    paste0("E",1:5),
    each=3),
  10
)

Rep <- rep(
  1:3,
  50
)

Yield <- c(
  rnorm(15,6.5,0.5),
  rnorm(15,7.5,0.4),
  rnorm(15,5.8,0.5),
  rnorm(15,8.2,0.4),
  rnorm(15,6.9,0.4),
  rnorm(15,7.2,0.4),
  rnorm(15,6.4,0.4),
  rnorm(15,8.0,0.5),
  rnorm(15,6.7,0.4),
  rnorm(15,7.8,0.3)
)

data <- data.frame(
  Genotype,
  Environment,
  Rep,
  Yield
)

write.csv(
  data,
  "data/wheat_yield.csv",
  row.names=FALSE
)

############################
# 4. Import data
############################

data <- read.csv(
  "data/wheat_yield.csv"
)

str(data)

############################
# 5. Summary statistics
############################

summary_stats <- data %>%
  group_by(
    Genotype,
    Environment
  ) %>%
  summarise(
    Mean=mean(Yield),
    SD=sd(Yield),
    .groups="drop"
  )

write.csv(
  summary_stats,
  "results/summary.csv",
  row.names=FALSE
)

############################
# 6. ANOVA
############################

anova_model <- aov(
  Yield~
    Genotype+
    Environment+
    Genotype:Environment,
  data=data
)

anova_results <- anova(
  anova_model
)

print(anova_results)

capture.output(
  anova_results,
  file=
    "results/anova_results.txt"
)

############################
# 7. GGE analysis
############################

gge_model <- gge(
  data=data,
  ENV=Environment,
  GEN=Genotype,
  Y=Yield
)

summary(gge_model)

############################
# 8. Who won where
############################

png(
  "figures/GGE_who_won_where.png",
  width=2000,
  height=1600,
  res=300
)

plot(
  gge_model,
  type=1
)

dev.off()

############################
# 9. Mean vs Stability
############################

png(
  "figures/GGE_mean_stability.png",
  width=2000,
  height=1600,
  res=300
)

plot(
  gge_model,
  type=4
)

dev.off()

############################
# 10. Genotype ranking
############################

png(
  "figures/GGE_genotype_rank.png",
  width=2000,
  height=1600,
  res=300
)

plot(
  gge_model,
  type=8
)

dev.off()

############################
# 11. Environment ranking
############################

png(
  "figures/GGE_environment_rank.png",
  width=2000,
  height=1600,
  res=300
)

plot(
  gge_model,
  type=9
)

dev.off()

############################
# 12. Environment evaluation
############################

png(
  "figures/GGE_environment_eval.png",
  width=2000,
  height=1600,
  res=300
)

plot(
  gge_model,
  type=6
)

dev.off()

############################
# 13. Extract GGE scores
############################

gge_scores <- get_model_data(
  gge_model
)

write.csv(
  gge_scores,
  "results/GGE_scores.csv",
  row.names=FALSE
)

############################
# 14. AMMI analysis
############################

ammi_model <- performs_ammi(
  data=data,
  gen=Genotype,
  env=Environment,
  rep=Rep,
  resp=Yield
)

summary(ammi_model)

############################
# 15. AMMI biplot
############################

png(
  "figures/AMMI_biplot.png",
  width=2000,
  height=1600,
  res=300
)

plot(ammi_model)

dev.off()

############################
# 16. Stability statistics
############################

stab <- waasb(
  data=data,
  env=Environment,
  gen=Genotype,
  rep=Rep,
  resp=Yield
)

stability <- get_model_data(
  stab
)

write.csv(
  stability,
  "results/stability.csv",
  row.names=FALSE
)

############################
# 17. WAASB plot
############################

png(
  "figures/WAASB.png",
  width=2000,
  height=1600,
  res=300
)

plot(stab)

dev.off()

############################
# 18. Export Excel workbook
############################

wb <- createWorkbook()

addWorksheet(
  wb,
  "Summary"
)

addWorksheet(
  wb,
  "GGE"
)

addWorksheet(
  wb,
  "Stability"
)

writeData(
  wb,
  "Summary",
  summary_stats
)

writeData(
  wb,
  "GGE",
  gge_scores
)

writeData(
  wb,
  "Stability",
  stability
)

saveWorkbook(
  wb,
  "results/GxE_results.xlsx",
  overwrite=TRUE
)

############################
# 19. Session info
############################

writeLines(
  capture.output(
    sessionInfo()
  ),
  "results/sessionInfo.txt"
)

############################
# 20. Finished
############################

cat("\n")
cat("=================================\n")
cat("G×E ANALYSIS FINISHED\n")
cat("=================================\n")
cat("Results: ./results\n")
cat("Figures: ./figures\n")
cat("=================================\n")











