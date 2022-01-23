#Data cleaning

file = load("clindata_miss.rda")

View(clindata_miss)

install.packages("naniar")

vignette("naniar-visualisation")

vis_miss(clindata_miss)

library(tidyverse)

glimpse(clindata_miss)

summary(clindata_miss)


gg_miss_upset(clindata_miss)

n_var_miss(clindata_miss)

gg_miss_upset(clindata_miss, nsets = n_var_miss(clindata_miss))

library(ggplot2)

ggplot(clindata_miss, aes(x = TG, y = HDL))+
  geom_miss_point()

#facetting

ggplot(clindata_miss, aes(x = DBP, y = PPG))+
  geom_miss_point()+
  facet_wrap(~education)

gg_miss_var(clindata_miss) + labs(y = "Instances of Missing values")


gg_miss_var(clindata_miss, facet = sex)


gg_miss_fct(clindata_miss, fct = education)


#Feature Scaling

normalize <- function(x){
  return((x - min(x))/(max(x) - min(x)))
}

clindata_miss <- clindata_miss[1:12,]

clindata_miss$age <- normalize(clindata_miss$age)

clindata_miss$age
