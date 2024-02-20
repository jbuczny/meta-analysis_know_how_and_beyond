## Dr. Jacek Buczny, Vrije Universiteit Amsterdam
## Power Analysis Meta-Analysis for Completely Aggregated Effects

require("metapower")

#---
  
##Low effect size, low effect sizes number, low I-square
mpower(effect_size = .1, study_size = 100, k = 10, i2 = .25, es_type = "r")

##Medium effect size, low effect sizes number, low I-square
mpower(effect_size = .3, study_size = 100, k = 10, i2 = .25, es_type = "r")

##High effect size, low effect sizes number, low I-square
mpower(effect_size = .5, study_size = 100, k = 10, i2 = .25, es_type = "r")

#---

##Low effect size, low-to-medium effect sizes number, low I-square
mpower(effect_size = .1, study_size = 100, k = 20, i2 = .25, es_type = "r")

##Low effect size, medium effect sizes number, medium I-square
mpower(effect_size = .1, study_size = 100, k = 30, i2 = .25, es_type = "r")

##Low effect size, high effect sizes number, medium I-square
mpower(effect_size = .1, study_size = 100, k = 50, i2 = .25, es_type = "r")

#---

##Medium effect size, low-to-medium effect sizes number, low I-square
mpower(effect_size = .3, study_size = 100, k = 20, i2 = .25, es_type = "r")

##Medium effect size, medium effect sizes number, medium I-square
mpower(effect_size = .3, study_size = 100, k = 30, i2 = .25, es_type = "r")

##Medium effect size, high effect sizes number, medium I-square
mpower(effect_size = .3, study_size = 100, k = 50, i2 = .25, es_type = "r")

#---

##High effect size, low-to-medium effect sizes number, low I-square
mpower(effect_size = .5, study_size = 100, k = 20, i2 = .25, es_type = "r")

##High effect size, medium effect sizes number, medium I-square
mpower(effect_size = .5, study_size = 100, k = 30, i2 = .25, es_type = "r")

##High effect size, high effect sizes number, medium I-square
mpower(effect_size = .5, study_size = 100, k = 50, i2 = .25, es_type = "r")

#---

##Low effect size, low effect sizes number, medium I-square
mpower(effect_size = .1, study_size = 100, k = 10, i2 = .50, es_type = "r")

##Low effect size, low effect sizes number, high I-square
mpower(effect_size = .1, study_size = 100, k = 10, i2 = .75, es_type = "r")

#---

##Medium effect size, low effect sizes number, medium I-square
mpower(effect_size = .3, study_size = 100, k = 10, i2 = .50, es_type = "r")

##Medium effect size, low effect sizes number, high I-square
mpower(effect_size = .3, study_size = 100, k = 10, i2 = .75, es_type = "r")

#---

##High effect size, low effect sizes number, medium I-square
mpower(effect_size = .5, study_size = 100, k = 10, i2 = .50, es_type = "r")

##High effect size, low effect sizes number, high I-square
mpower(effect_size = .5, study_size = 100, k = 10, i2 = .75, es_type = "r")

#---

##Low effect size, low-to-medium effect sizes number, medium I-square
mpower(effect_size = .1, study_size = 100, k = 20, i2 = .50, es_type = "r")

##Low effect size, low-to-medium effect sizes number, high I-square
mpower(effect_size = .1, study_size = 100, k = 20, i2 = .75, es_type = "r")

#---

##Low effect size, medium effect sizes number, medium I-square
mpower(effect_size = .1, study_size = 100, k = 30, i2 = .50, es_type = "r")

##Low effect size, medium effect sizes number, high I-square
mpower(effect_size = .1, study_size = 100, k = 30, i2 = .75, es_type = "r")

#---

##Low effect size, high effect sizes number, medium I-square
mpower(effect_size = .1, study_size = 100, k = 50, i2 = .50, es_type = "r")

##Low effect size, high effect sizes number, high I-square
mpower(effect_size = .1, study_size = 100, k = 50, i2 = .75, es_type = "r")

#---

##Medium effect size, low-to-medium effect sizes number, medium I-square
mpower(effect_size = .3, study_size = 100, k = 20, i2 = .50, es_type = "r")

##Medium effect size, low-to-medium effect sizes number, high I-square
mpower(effect_size = .3, study_size = 100, k = 20, i2 = .75, es_type = "r")

#---

##Medium effect size, medium effect sizes number, medium I-square
mpower(effect_size = .3, study_size = 100, k = 30, i2 = .50, es_type = "r")

##Medium effect size, medium effect sizes number, high I-square
mpower(effect_size = .3, study_size = 100, k = 30, i2 = .75, es_type = "r")

#---

##Medium effect size, high effect sizes number, medium I-square
mpower(effect_size = .3, study_size = 100, k = 50, i2 = .50, es_type = "r")

##Medium effect size, high effect sizes number, high I-square
mpower(effect_size = .3, study_size = 100, k = 50, i2 = .75, es_type = "r")

#---

##High effect size, low-to-medium effect sizes number, medium I-square
mpower(effect_size = .5, study_size = 100, k = 20, i2 = .50, es_type = "r")

##High effect size, low-to-medium effect sizes number, high I-square
mpower(effect_size = .5, study_size = 100, k = 20, i2 = .75, es_type = "r")

#---

##High effect size, medium effect sizes number, medium I-square
mpower(effect_size = .5, study_size = 100, k = 30, i2 = .50, es_type = "r")

##High effect size, medium effect sizes number, high I-square
mpower(effect_size = .5, study_size = 100, k = 30, i2 = .75, es_type = "r")

#---

##High effect size, high effect sizes number, medium I-square
mpower(effect_size = .5, study_size = 100, k = 50, i2 = .50, es_type = "r")

##High effect size, high effect sizes number, high I-square
mpower(effect_size = .5, study_size = 100, k = 50, i2 = .75, es_type = "r")

##Creating realistic assumptions

RH_power_1 <- mpower(effect_size = .1, study_size = 100, k = 30, i2 = .75, es_type = "r")
print(RH_power_1)

RH_power_2 <- mpower(effect_size = .1, study_size = 100, k = 30, i2 = .80, es_type = "r")
print(RH_power_2)

RH_power_3 <- mpower(effect_size = .1, study_size = 100, k = 30, i2 = .85, es_type = "r")
print(RH_power_3)

RH_power_4 <- mpower(effect_size = .1, study_size = 100, k = 30, i2 = .90, es_type = "r")
print(RH_power_4)

RH_power_5 <- mpower(effect_size = .1, study_size = 100, k = 30, i2 = .95, es_type = "r")
print(RH_power_5)

##Plotting power

plot_mpower(RH_power_1)

plot_mpower(RH_power_2)

plot_mpower(RH_power_3)

plot_mpower(RH_power_4)

plot_mpower(RH_power_5)

##Power analysis for moderators; creating realistic assumptions

RH_power_6 <- subgroup_power(n_groups = 2, 
                             effect_sizes = c(.0, .2), 
                             study_size = 100,
                             k = 30,
                             i2 = .75,
                             es_type = "r")

RH_power_7 <- subgroup_power(n_groups = 2, 
                             effect_sizes = c(.0, .2), 
                             study_size = 100,
                             k = 30,
                             i2 = .80,
                             es_type = "r")

RH_power_8 <- subgroup_power(n_groups = 2, 
                             effect_sizes = c(.0, .2), 
                             study_size = 100,
                             k = 30,
                             i2 = .85,
                             es_type = "r")

RH_power_9 <- subgroup_power(n_groups = 2, 
                             effect_sizes = c(.0, .2), 
                             study_size = 100,
                             k = 30,
                             i2 = .90,
                             es_type = "r")

RH_power_10 <- subgroup_power(n_groups = 2, 
                             effect_sizes = c(.0, .2), 
                             study_size = 100,
                             k = 30,
                             i2 = .95,
                             es_type = "r")

RH_power_11 <- subgroup_power(n_groups = 3, 
                             effect_sizes = c(.0, .1, .2), 
                             study_size = 90,
                             k = 30,
                             i2 = .75,
                             es_type = "r")

RH_power_12 <- subgroup_power(n_groups = 3, 
                              effect_sizes = c(.0, .1, .2), 
                              study_size = 90,
                              k = 30,
                              i2 = .80,
                              es_type = "r")

RH_power_13 <- subgroup_power(n_groups = 3, 
                              effect_sizes = c(.0, .1, .2), 
                              study_size = 90,
                              k = 30,
                              i2 = .85,
                              es_type = "r")

RH_power_14 <- subgroup_power(n_groups = 3, 
                              effect_sizes = c(.0, .1, .2), 
                              study_size = 90,
                              k = 30,
                              i2 = .90,
                              es_type = "r")

RH_power_15 <- subgroup_power(n_groups = 3, 
                              effect_sizes = c(.0, .1, .2), 
                              study_size = 90,
                              k = 30,
                              i2 = .95,
                              es_type = "r")

RH_power_16 <- mod_power(n_groups = 2, 
                        effect_sizes = c(.0, .2), 
                        study_size = 100,
                        k = 30,
                        i2 = .75,
                        es_type = "r")

RH_power_17 <- mod_power(n_groups = 2, 
                         effect_sizes = c(.0, .2), 
                         study_size = 100,
                         k = 30,
                         i2 = .80,
                         es_type = "r")

RH_power_18 <- mod_power(n_groups = 2, 
                         effect_sizes = c(.0, .2), 
                         study_size = 100,
                         k = 30,
                         i2 = .85,
                         es_type = "r")

RH_power_19 <- mod_power(n_groups = 2, 
                         effect_sizes = c(.0, .2), 
                         study_size = 100,
                         k = 30,
                         i2 = .90,
                         es_type = "r")

RH_power_20 <- mod_power(n_groups = 2, 
                         effect_sizes = c(.0, .2), 
                         study_size = 100,
                         k = 30,
                         i2 = .95,
                         es_type = "r")

RH_power_21 <- mod_power(n_groups = 3, 
                        effect_sizes = c(.0, .1, .2), 
                        study_size = 100,
                        k = 30,
                        i2 = .75,
                        es_type = "r")

RH_power_22 <- mod_power(n_groups = 3, 
                        effect_sizes = c(.0, .1, .2), 
                        study_size = 100,
                        k = 30,
                        i2 = .80,
                        es_type = "r")

RH_power_23 <- mod_power(n_groups = 3, 
                         effect_sizes = c(.0, .1, .2), 
                         study_size = 100,
                         k = 30,
                         i2 = .85,
                         es_type = "r")

RH_power_24 <- mod_power(n_groups = 3, 
                         effect_sizes = c(.0, .1, .2), 
                         study_size = 100,
                         k = 30,
                         i2 = .90,
                         es_type = "r")

RH_power_25 <- mod_power(n_groups = 3, 
                         effect_sizes = c(.0, .1, .2), 
                         study_size = 100,
                         k = 30,
                         i2 = .95,
                         es_type = "r")

##Plotting power for subgroup/moderator analyzes

plot_subgroup_power(RH_power_6)

plot_subgroup_power(RH_power_7)

plot_subgroup_power(RH_power_8)

plot_subgroup_power(RH_power_9)

plot_subgroup_power(RH_power_10)

plot_subgroup_power(RH_power_11)

plot_subgroup_power(RH_power_12)

plot_subgroup_power(RH_power_13)

plot_subgroup_power(RH_power_14)

plot_subgroup_power(RH_power_15)

plot_mod_power(RH_power_16)

plot_mod_power(RH_power_17)

plot_mod_power(RH_power_18)

plot_mod_power(RH_power_19)

plot_mod_power(RH_power_20)

plot_mod_power(RH_power_21)

plot_mod_power(RH_power_22)

plot_mod_power(RH_power_23)

plot_mod_power(RH_power_24)

plot_mod_power(RH_power_25)
