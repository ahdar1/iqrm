rm(list=ls())  # make a fresh start
library(psych) # load the psych package
library(ahdar) # load data package
rcor <- cor(fa_qual)
KMO(rcor)
cortest.bartlett(rcor, n = 243)
fa.parallel(fa_qual, fm="pa", fa="fa", n.obs=243,
            main="Scree Plots")
fa_res <- fa(fa_qual, fm="pa", nfactors = 2, rotate = "oblimin")
fa_res$communality
print(fa_res$loadings, cutoff = 0.4)
print(fa_res$Structure, cutoff = 0.4)
fa_res$Phi
fa.diagram(fa_res, digits=3)
fs_scores <- factor.scores(fa_qual, fa_res, method = "Thurstone")
head(fs_scores$scores)