## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
# make sure BSSR is installed
#install.packages('devtools')
library(bssr)
bssr::setup("/home/dakaraim/BrainSuite19b")

## ----load data-----------------------------------------------------------
long <- load_bss_data(type = "tbm",
                      subjdir = "/home/dakaraim/Data/MH_adolescent_waves/StructuralPipeline/subject_session",
                      csv = "/home/dakaraim/Data/MH_adolescent_waves/StructuralPipeline/subject_session/Common_subject_paired_edited.csv",
                      smooth = 3.0,
                      atlas = "/home/dakaraim/BrainSuite19b/svreg/BCI-DNI_brain_atlas/BCI-DNI_brain")


## ----ttest---------------------------------------------------------------
# Run model and call it q
q <- bss_ttest(group_var = "session", long, paired = TRUE)
# Save model and review output
save_bss_out(long, q, outdir = "/home/dakaraim/Data/MH_adolescent_waves/StructuralPipeline/subject_session/PairedTtest_8-3-20")

## ----load deformation difference-----------------------------------------
difference <- load_bss_data(type = "tbm",
                      subjdir = "/home/dakaraim/Data/MH_adolescent_waves/StructuralPipeline/subject_session",
                      csv = "/home/dakaraim/Data/MH_adolescent_waves/StructuralPipeline/subject_session/Common_subjects_paired.csv",
                      smooth = 3.1,
                      atlas = "/home/dakaraim/BrainSuite19b/svreg/BCI-DNI_brain_atlas/BCI-DNI_brain")


## ----bss_lm with sex-----------------------------------------------------
# 1 = males and 
# q models intercept and the effect of sex whicBCMh tells us the mean deformation across all voxels and how much male or females vary about this average. 
q <- bss_lm(main_effect = "sex", bss_data = difference, covariates = "1")
# Save model and review output
 save_bss_out(difference, q, outdir = "/home/dakaraim/Data/MH_adolescent_waves/StructuralPipeline/subject_session/sex_08-03-2020")


## ----bss_lm with sex + ageDiff-------------------------------------------
# q models the amount of variance ageDifference inn the change in deformation map. 
q <- bss_lm(main_effect = "sex", bss_data = difference, covariates = "ageDiff")
# Save model and review 
 save_bss_out(difference, q, outdir =  "/home/dakaraim/Data/MH_adolescent_waves/StructuralPipeline/subject_session/sex_ageDiff")

## ----bss_lm with sex + age1----------------------------------------------
# q models the amount of variance ageDifference inn the change in deformation map. 
q <- bss_lm(main_effect = "sex", bss_data = difference, covariates = "age1")
# Save model and review output
 save_bss_out(difference, q, outdir = "/home/dakaraim/Data/MH_adolescent_waves/StructuralPipeline/subject_session/sex_age1")


## ----bss_lm with sex + ageDiff + age1------------------------------------
#q models the main effect of age when controlling for ageDiff and age at wave 1 of the change in deformation map. 
q <- bss_lm(main_effect = "sex", bss_data = difference, covariates = "ageDiff + age1")
# Save model and review output
 save_bss_out(difference, q, outdir = "/home/dakaraim/Data/MH_adolescent_waves/StructuralPipeline/subject_session/sex_ageDiff_age1")


## ----bss_lm sex + age1 + sex interaction---------------------------------
# q models the main effect of sex and the interaction between age and sex 

#q <- bss_lm(main_effect = "sex", bss_data = long_cov, covariates = "ageDiff*sex" )

q <- bss_lm(main_effect = "sex", bss_data = difference, covariates = "ageDiff*sex" )




## ----bss_lm age1 + sex---------------------------------------------------

q <- bss_lm(main_effect = "age1", bss_data = difference, covariates = "sex")
# Save model and review output
 save_bss_out(difference, q, outdir = "/home/dakaraim/Data/MH_adolescent_waves/StructuralPipeline/subject_session/age1_sex")

