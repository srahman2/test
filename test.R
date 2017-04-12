
setwd("C:/Users/SyedAshiqur/Dropbox/PhD/Research/SBSI_Extended/NHANES/1999-2000/Laboratory/")

library(rio)

# Blood Pressure
# BPXSY1, BPXPLS, BPXDI1
DataBPX.XPT <- import("BPX.XPT")

# AGE
age <- read.csv("SeqnAge.csv")

total <- merge(DataBPX.XPT, Data10.XPT, by="SEQN")
total <- merge(total, Data11.XPT, by="SEQN")

total <- merge(total, age, by="SEQN")

Body.Selected = total[, c("SEQN", "BPXSY1", "BPXPLS", "BPXDI1", "LBXGH", "LBXCRP",	"LBXTC",	"URXUMA",	"URXUCR",	"LBXSAL",	"LBXSAPSI",	"SSCMVOD", "LBXSBU", "LBDHDL", "LBXHGB", "LBXLYPCT", "LBXWBCSI", "LBXHCT", "LBXRBCSI", "LBXPLTSI", "RIDAGEYR" )]

write.csv( Body.Selected, "Anthropometric_parameters_1999.csv" )





# 2001-2002
setwd("C:/Users/SyedAshiqur/Dropbox/PhD/Research/SBSI_Extended/NHANES/2001-2002/Laboratory/")

# Demographic
# demo.XPT = import("DEMO_B.XPT")
# SeqnAge = demo.XPT[, c("SEQN", "RIDAGEYR")]
# write.csv(SeqnAge, "SeqnAge.csv")

# Blood Pressure (BPXSY1)
DataBPX.XPT <- import("BPX_B.XPT")

# AGE
age <- read.csv("SeqnAge.csv")

total <- merge(DataBPX.XPT, Data10.XPT, by="SEQN")
total <- merge(total, Data11.XPT, by="SEQN")
total <- merge(total, Data13.XPT, by="SEQN")
total <- merge(total, Data16.XPT, by="SEQN")
total <- merge(total, Data40.XPT, by="SEQN")
total <- merge(total, SSCMV.XPT, by="SEQN")
total <- merge(total, Data25.XPT, by="SEQN")

total <- merge(total, age, by="SEQN")

# BelskySelected = total[, c("SEQN", "BPXSY1", "LBXGH", "LBXCRP",	"LBXTC",	"URXUMA",	"URXUCR",	"LBXSAL",	"LBDSAPSI",	"SSCMVOD", "RIDAGEYR" )]
LevineSelected = total[, c("SEQN", "BPXSY1", "BPXPLS", "BPXDI1", "LBXGH", "LBXCRP",	"LBXTC",	"URXUMA",	"URXUCR",	"LBXSAL",	"LBDSAPSI",	"SSCMVOD", "LBXSBU", "LBDHDL", "LBXHGB", "LBXLYPCT", "LBXWBCSI", "LBXHCT", "LBXRBCSI", "LBXPLTSI", "RIDAGEYR" )]

# write.csv( BelskySelected, "Belsky_parameters_2001.csv" )
write.csv( LevineSelected, "Levine_parameters_2001.csv" )



# 2003-2004
setwd("C:/Users/SyedAshiqur/Dropbox/PhD/Research/SBSI_Extended/NHANES/2003-2004/Laboratory/")

# # Demographic
# demo.XPT = import("DEMO_C.XPT")
# SeqnAge = demo.XPT[, c("SEQN", "RIDAGEYR")]
# write.csv(SeqnAge, "SeqnAge.csv")

# Blood Pressure (BPXSY1)
DataBPX.XPT <- import("BPX_C.XPT")

# AGE
age <- read.csv("SeqnAge.csv")

total <- merge(DataBPX.XPT, Data10.XPT, by="SEQN")
total <- merge(total, Data11.XPT, by="SEQN")

total <- merge(total, age, by="SEQN")

LevineSelected = total[, c("SEQN", "BPXSY1", "BPXPLS", "BPXDI1", "LBXGH", "LBXCRP",	"LBXTC",	"URXUMA",	"URXUCR",	"LBXSAL",	"LBXSAPSI",	"SSCMVOD", "LBXSBU", "LBXHDD", "LBXHGB", "LBXLYPCT", "LBXWBCSI", "LBXHCT", "LBXRBCSI", "LBXPLTSI", "RIDAGEYR" )]

write.csv( LevineSelected, "Levine_parameters_2003.csv" )



# Combining LevineSelected Datasets

setwd("C:/Users/SyedAshiqur/Dropbox/PhD/Research/SBSI_Extended/NHANES/1999-2000/Laboratory/")
DATA99 <- read.csv("Levine_parameters_1999.csv")

setwd("C:/Users/SyedAshiqur/Dropbox/PhD/Research/SBSI_Extended/NHANES/2001-2002/Laboratory/")
DATA01 <- read.csv("Levine_parameters_2001.csv")

setwd("C:/Users/SyedAshiqur/Dropbox/PhD/Research/SBSI_Extended/NHANES/2003-2004/Laboratory/")
DATA03 <- read.csv("Levine_parameters_2003.csv")

LevineSelectedCombined = rbind(DATA99, DATA01, DATA03)
LevineSelectedCombined = na.omit(LevineSelectedCombined)
write.csv( LevineSelectedCombined, "LevineSelectedCombined_1999_2003.csv" )




# 2005-2006
setwd("C:/Users/SyedAshiqur/Dropbox/PhD/Research/SBSI_Extended/NHANES/2005-2006/Laboratory/")

# Demographic
demo.XPT = import("DEMO_D.XPT")
SeqnAge = demo.XPT[, c("SEQN", "RIDAGEYR")]
write.csv(SeqnAge, "SeqnAge.csv")

# Blood Pressure (BPXSY1)
DataBPX.XPT <- import("BPX_D.XPT")

# Glycohemoglobin (LBXGH)
Data10.XPT <- import("GHB_D.XPT")

# C-reactive protein (LBXCRP)
Data11.XPT <- import("CRP_D.XPT")

# Total Cholesterol (LBXTC)
Data13.XPT <- import("TCHOL_D.XPT")

# Creatinine, Albumin (URXUCR, URXUMA)
Data16.XPT <- import("ALB_CR_D.XPT")

# Standard Biochemistry Profile (Urea Nitrogen, Alkaline Phosphatase (URXUMA, LBXAL))
Data40.XPT <- import("BIOPRO_D.XPT")

# Cytomegalovirus IgG (SSCMVOD)
# SSCMV.XPT <- import("SSCMV_D.XPT")

# Blood Count with 5-part Differential Whole Blood
# LBHGB, LBXLYPCT, LBXWBCSI, LBXHCT, LBXRBCSI, LBXPLTSI
Data25.XPT <- import("CBC_D.XPT")

# SPXNFEV1, SPXNFEV3, SPXNFEV6 
DataSPX.XPT <- import("SPX_D.XPT")

# AGE
age <- read.csv("SeqnAge.csv")

total <- merge(DataBPX.XPT, Data10.XPT, by="SEQN")
total <- merge(total, Data11.XPT, by="SEQN")
total <- merge(total, Data13.XPT, by="SEQN")
total <- merge(total, Data16.XPT, by="SEQN")
total <- merge(total, Data40.XPT, by="SEQN")
total <- merge(total, SSCMV.XPT, by="SEQN")
total <- merge(total, Data25.XPT, by="SEQN")

total <- merge(total, age, by="SEQN")

# BelskySelected = total[, c("SEQN", "BPXSY1", "LBXGH", "LBXCRP",	"LBXTC",	"URXUMA",	"URXUCR",	"LBXSAL",	"LBDSAPSI",	"SSCMVOD", "RIDAGEYR" )]
LevineSelected = total[, c("SEQN", "BPXSY1", "BPXPLS", "BPXDI1", "LBXGH", "LBXCRP",	"LBXTC",	"URXUMA",	"URXUCR",	"LBXSAL",	"LBDSAPSI",	"SSCMVOD", "LBXSBU", "LBDHDL", "LBXHGB", "LBXLYPCT", "LBXWBCSI", "LBXHCT", "LBXRBCSI", "LBXPLTSI", "RIDAGEYR" )]

# write.csv( BelskySelected, "Belsky_parameters_2005.csv" )
write.csv( LevineSelected, "Levine_parameters_2005.csv" )




# 2007-2008
setwd("C:/Users/SyedAshiqur/Dropbox/PhD/Research/SBSI_Extended/NHANES/2007-2008/Laboratory/")

# Demographic
demo.XPT = import("DEMO_E.XPT")
SeqnAge = demo.XPT[, c("SEQN", "RIDAGEYR")]
write.csv(SeqnAge, "SeqnAge.csv")

# Blood Pressure (BPXSY1)
DataBPX.XPT <- import("BPX_E.XPT")

# Glycohemoglobin (LBXGH)
Data10.XPT <- import("GHB_E.XPT")

# C-reactive protein (LBXCRP)
Data11.XPT <- import("CRP_E.XPT")

# Total Cholesterol (LBXTC)
Data13.XPT <- import("TCHOL_E.XPT")

# Creatinine, Albumin (URXUCR, URXUMA)
Data16.XPT <- import("ALB_CR_E.XPT")

# Standard Biochemistry Profile (Urea Nitrogen, Alkaline Phosphatase (URXUMA, LBXAL))
Data40.XPT <- import("BIOPRO_E.XPT")

# Cytomegalovirus IgG (SSCMVOD)
# SSCMV.XPT <- import("SSCMV_E.XPT")

# Blood Count with 5-part Differential Whole Blood
# LBHGB, LBXLYPCT, LBXWBCSI, LBXHCT, LBXRBCSI, LBXPLTSI
Data25.XPT <- import("CBC_E.XPT")

# SPXNFEV1, SPXNFEV3, SPXNFEV6 
DataSPX.XPT <- import("SPX_E.XPT")

# AGE
age <- read.csv("SeqnAge.csv")

total <- merge(DataBPX.XPT, Data10.XPT, by="SEQN")
total <- merge(total, Data11.XPT, by="SEQN")
total <- merge(total, Data13.XPT, by="SEQN")
total <- merge(total, Data16.XPT, by="SEQN")
total <- merge(total, Data40.XPT, by="SEQN")
total <- merge(total, SSCMV.XPT, by="SEQN")
total <- merge(total, Data25.XPT, by="SEQN")

total <- merge(total, age, by="SEQN")

# BelskySelected = total[, c("SEQN", "BPXSY1", "LBXGH", "LBXCRP",	"LBXTC",	"URXUMA",	"URXUCR",	"LBXSAL",	"LBDSAPSI",	"SSCMVOD", "RIDAGEYR" )]
LevineSelected = total[, c("SEQN", "BPXSY1", "BPXPLS", "BPXDI1", "LBXGH", "LBXCRP",	"LBXTC",	"URXUMA",	"URXUCR",	"LBXSAL",	"LBDSAPSI",	"SSCMVOD", "LBXSBU", "LBDHDL", "LBXHGB", "LBXLYPCT", "LBXWBCSI", "LBXHCT", "LBXRBCSI", "LBXPLTSI", "RIDAGEYR" )]

# write.csv( BelskySelected, "Belsky_parameters_2007.csv" )
write.csv( LevineSelected, "Levine_parameters_2007.csv" )






# 2009-2010
setwd("C:/Users/SyedAshiqur/Dropbox/PhD/Research/SBSI_Extended/NHANES/2009-2010/Laboratory/")

# Demographic
demo.XPT = import("DEMO_F.XPT")
SeqnAge = demo.XPT[, c("SEQN", "RIDAGEYR")]
write.csv(SeqnAge, "SeqnAge.csv")

# Blood Pressure (BPXSY1)
DataBPX.XPT <- import("BPX_F.XPT")

# Glycohemoglobin (LBXGH)
Data10.XPT <- import("GHB_F.XPT")

# C-reactive protein (LBXCRP)
Data11.XPT <- import("CRP_F.XPT")

# Total Cholesterol (LBXTC)
Data13.XPT <- import("TCHOL_F.XPT")

# Creatinine, Albumin (URXUCR, URXUMA)
Data16.XPT <- import("ALB_CR_F.XPT")

# Standard Biochemistry Profile (Urea Nitrogen, Alkaline Phosphatase (URXUMA, LBXAL))
Data40.XPT <- import("BIOPRO_F.XPT")

# Cytomegalovirus IgG (SSCMVOD)
# SSCMV.XPT <- import("SSCMV_F.XPT")

# Blood Count with 5-part Differential Whole Blood
# LBHGB, LBXLYPCT, LBXWBCSI, LBXHCT, LBXRBCSI, LBXPLTSI
Data25.XPT <- import("CBC_F.XPT")

# SPXNFEV1, SPXNFEV3, SPXNFEV6 
DataSPX.XPT <- import("SPX_F.XPT")

# AGE
age <- read.csv("SeqnAge.csv")

total <- merge(DataBPX.XPT, Data10.XPT, by="SEQN")
total <- merge(total, Data11.XPT, by="SEQN")
total <- merge(total, Data13.XPT, by="SEQN")
total <- merge(total, Data16.XPT, by="SEQN")
total <- merge(total, Data40.XPT, by="SEQN")
total <- merge(total, SSCMV.XPT, by="SEQN")
total <- merge(total, Data25.XPT, by="SEQN")

total <- merge(total, age, by="SEQN")

# BelskySelected = total[, c("SEQN", "BPXSY1", "LBXGH", "LBXCRP",	"LBXTC",	"URXUMA",	"URXUCR",	"LBXSAL",	"LBDSAPSI",	"SSCMVOD", "RIDAGEYR" )]
LevineSelected = total[, c("SEQN", "BPXSY1", "BPXPLS", "BPXDI1", "LBXGH", "LBXCRP",	"LBXTC",	"URXUMA",	"URXUCR",	"LBXSAL",	"LBDSAPSI",	"SSCMVOD", "LBXSBU", "LBDHDL", "LBXHGB", "LBXLYPCT", "LBXWBCSI", "LBXHCT", "LBXRBCSI", "LBXPLTSI", "RIDAGEYR" )]

# write.csv( BelskySelected, "Belsky_parameters_2009.csv" )
write.csv( LevineSelected, "Levine_parameters_2009.csv" )




# Combining BelskySelected Datasets

# setwd("C:/Users/SyedAshiqur/Dropbox/PhD/Research/SBSI_Extended/NHANES/1999-2000/Laboratory/")
# DATA99 <- read.csv("Belsky_parameters_1999.csv")
# 
# setwd("C:/Users/SyedAshiqur/Dropbox/PhD/Research/SBSI_Extended/NHANES/2001-2002/Laboratory/")
# DATA01 <- read.csv("Belsky_parameters_2001.csv")
# 
# setwd("C:/Users/SyedAshiqur/Dropbox/PhD/Research/SBSI_Extended/NHANES/2003-2004/Laboratory/")
# DATA03 <- read.csv("Belsky_parameters_2003.csv")
# 
# BelskySelectedCombined = rbind(DATA99, DATA01, DATA03)
# BelskySelectedCombined = na.omit(BelskySelectedCombined)
# write.csv( BelskySelectedCombined, "BelskySelectedCombined_1999_2003.csv" )






