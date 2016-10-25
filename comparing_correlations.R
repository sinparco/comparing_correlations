library(tidyverse)
bfi <- read_csv("bfi.csv")
glimpse(bfi)

#install.packages("cocor", dep=TRUE) 
library(cocor)
library(apaTables)
apa.cor.table(bfi)
library(cocor)
cocor(~A1+C1|E1+O1, data=as.data.frame(bfi))
# r = .13, 95% CI[.08, .18]

cocor(~A1+C1|A1+E1, data=as.data.frame(bfi))
#Which is a better predictor for A1?

bfi_men <- bfi %>% filter(gender==1) %>% select(-gender)
bfi_women <- bfi %>% filter(gender==2) %>% select(-gender)

apa.cor.table(bfi_men)
apa.cor.table(bfi_women)

bfi_men <- as.data.frame(bfi_men)
bfi_women <- as.data.frame(bfi_women)

cocor(~A1+E1|A1+E1, data=list(bfi_men, bfi_women))
#Comparing A and E between two samples