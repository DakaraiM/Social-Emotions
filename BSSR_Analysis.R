library(bssr)
# load the data
wave_1 <- load_bss_data(type = "tbm",
                        subjdir = "/Volumes/SocialDevelopmentProject/fMRI/BrainSuite/HandEdited/wave1",
                        csv =   "/Volumes/SocialDevelopmentProject/fMRI/BrainSuite/Stats/Common_subjects.csv",
                        smooth = 0,
                        atlas = "/Applications/BrainSuite19b/svreg/BCI-DNI_brain_atlas/BCI-DNI_brain")

wave_2 <- load_bss_data(type = "tbm",
                        subjdir = "/Volumes/SocialDevelopmentProject/fMRI/BrainSuite/HandEdited/BrainSuite_Wave2_Processed",
                        csv = "/Volumes/SocialDevelopmentProject/fMRI/BrainSuite/Stats/Common_subjects.csv",
                        smooth = 0,
                        atlas = "/Applications/BrainSuite19b/svreg/BCI-DNI_brain_atlas/BCI-DNI_brain")