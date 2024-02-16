## Author: Dr. Jacek Buczny, VU Amsterdam
## Last saved: Jan 23, 2024

## Opening the data set

## The data set must be saved in the same folder as this script
data_raw <- read.csv("BCG_Vaccine.csv")

## Go to Session, then Set Working Directory and select To Source File Location

## Note that the read.csv function may need some additional argument
## enabled, e.g., deci = "." (decimal values presented with .)

## Viewing the data; all the variables should be presented in separate columns
## Verify if all the variables are in columns
View (data_raw)

## Install metafor R package, if you have not done it yet
install.packages("metafor")

## Loading metafor
library(metafor)

## Based on the help file for metafor, we conclude that arguments ai, bi
## ci, and di correspond with the events/variables coded in the data set

## Function: escalc()
data_transformed <- escalc(measure = "OR"
                           , ai = tpos
                           , bi = tneg
                           , ci = cpos
                           , di = cneg
                           , data = data_raw) ## Note that we used the initial
                                              ## data set to which the effect
                                              ## sizes (OR = yi) and sampling
                                              ## errors (v = vi) were added
## Viewing the data set
View(data_transformed) ## Two columns should be added: yi, vi

## Preparing a fixed-effects model analysis; ; function: rma()
meta_fixed <- rma(yi = yi
                  , vi = vi
                  , data = data_transformed
                  , method = "FE")

##To view the analysis, run the line below
meta_fixed

## This analysis includes basic information, e.g., overall effect size
##Alternatively
summary(meta_fixed)

install.packages("esc")

library(esc) # We need this package the transform logOR to OR

odds_ratio(-0.4361)

## Note that the results are not similar to the results in JASP as we use OR
## not logOR

## Preparing a random-effects model analysis, restricted maximum likelihood
## is the estimator
meta_random <- rma(yi = yi
                   , vi = vi
                   , data = data_transformed
                   , method = "REML")

meta_random
## This analysis includes basic information, but does not include CI
## for I-squared

odds_ratio(-0.7452)

## To calculate CIs for I-squared:
confint(meta_random)

## This code calculates prediction intervals
## To ensure that the function is called from metafor package, we use ::
metafor::predict.rma(meta_random)

## If you need more on the function predict.rma:
help("predict.rma")

## Creating and customizing a forest plot
forest(meta_random
       , slab = author
       , addpred = TRUE ## Adding prediction intervals
       , xlab = "Effect Size (log OR)"
       , header = "Author(s) and Publication Year "
       , order = "obs") ## Ordering by the effect size values

## Moderator analyses

## Categorical moderator

## We use alloc as the moderator to create a new model: meta_random_alloc
meta_random_alloc <- rma(yi = yi
                         , vi = vi
                         , mods = ~ alloc
                         , data = data_transformed
                         , method = "REML")
meta_random_alloc
#However, we do not have control over what is the reference point, and we want
## to change it. See a new model below:
meta_random_alloc <- rma(yi = yi
                         , vi = vi
                         , mods = ~ relevel(factor(alloc), ref = 'random')
                         , data = data_transformed
                         , method = "REML")

meta_random_alloc
## In the new model, we make random level the reference point to compare
## effect sizes in the other two levels: alternate and systematic

## Importantly, if we have many comparisons to make, we make arrive at
## detecting false positive effects as many comparisons increase the chance
## to find a significance difference. To avoid this, we should test whether
## the moderator is significant in the first place. We do it by adding "-1"
## to the mods argument; see below:
meta_random_alloc <- rma(yi = yi
                         , vi = vi
                         , mods = ~ alloc - 1
                         , data = data_transformed
                         , method = "REML")

meta_random_alloc

## Continuous moderator

## We add publication year to the model. Because it is a continuous moderator
## there is no need to define a reference point:
meta_random_year <- rma(yi = yi
                        , vi = vi
                        , mods = ~ year
                        , data = data_transformed
                        , method = "REML")

meta_random_year

## As we have multiple moderators, we can add them to the meta-regression:
meta_random_year_ablat <- rma(yi = yi
                              , vi = vi
                              , mods = ~ year + ablat
                              , data = data_transformed
                              , method = "REML")

meta_random_year_ablat

## As this is a regression analysis, we might need to test whether the model
## with year and ablat as the moderator is better (higher fit) than the model
## with year as the only predictor. In classical step-wise regression, we
## can calculate an increase in explained variance after adding additional
## moderator. In meta-analysis we may try to use the function anova()

anova(meta_random_year, meta_random_year_ablat)
## However, the anova() function can be used only for nested models, so
## models with the same number of coefficients, e.g., two predictors.
## In the example below, we have two nested models; the difference between
## them is the type of estimator used: the fixed-effects vs random-effects
meta_random_FE <- rma(yi = yi
                      , vi = vi
                      , data = data_transformed
                      , method = "FE")

meta_random_FE

meta_random_REML <- rma(yi = yi
                        , vi = vi
                        , data = data_transformed
                        , method = "REML")

meta_random_REML

anova(meta_random_FE, meta_random_REML)
## After running this analysis, you now see the results of the fit comparison.
## AIC and BIC are the major fit indices. Full model (less restrictions) is
## the FE model, whereas reduced is the REML model. The results indicate
## that the FE model is "better" that the REML one. The main reason for the 
## difference is that the FE is more "precise" (narrow CIs) than the REML
## (wider CIs). Of course, there is no specific reason for running such an
## analysis as it is an inherent feature of the REML model that it is less
## precise than the FE model as only the prior accounts for the differences
## between the studies. The anova() function is used for validation of
## multilevel models (function rma.mv).

## Interaction between continuous moderators

## In the most often cases for exploration purposes, we may want to test
## whether the moderators interact with each other. We specify an interaction
## here by the means of argument mods = ~ year:ablat. However, it will not
## run a full-factorial model.

meta_random_year_x_ablat <- rma(yi = yi
                                , vi = vi
                                , mods = ~ year:ablat
                                , data = data_transformed
                                , method = "REML")

meta_random_year_x_ablat

## To prepare a full-factorial model: two main effects of moderators and
## the interaction term, you would need to use *; see the example below.

meta_random_year_x_ablat_full <- rma(yi = yi
                                     , vi = vi
                                     , mods = ~ year*ablat
                                     , data = data_transformed
                                     , method = "REML")

meta_random_year_x_ablat_full

## Publication bias

## Analyzing and adjusting for publication bias is a vast problem. Currently,
## the researchers suggest to use PET-PEESE, robust Bayesian meta-analysis,
## and selection models as the top-tier methods for analyzing publication bias.
## See details: https://journals.sagepub.com/doi/full/10.1177/25152459221109259

## Traditionally, however, researchers report funnel plot, tests of funnel
## asymmetry, and trim-and-fill. The traditional methods have limitations.
## See details: https://journals.sagepub.com/doi/10.1177/2515245919847196

## Funnel plot

funnel(meta_random)

## Contour-enhanced funnel plot

funnel(meta_random
       , xlim = c(-2.0, 3.0)
       , ylim = c(0, 0.75)
       , refline = 0
       , level = c(90, 95, 99)
       , shade = c("white", "gray55", "gray75")
       , legend = TRUE)

## Tests for funnel plot asymmetry

ranktest(meta_random) ## rank test
regtest(meta_random) ## Egger's test

## In principle, non-significant results of the regression analyses
## indicate no support for publication bias.

## Trim-and-fill

trimfill(meta_random
         , side = "left") ## For potential studies on the left of
                                     ## the funnel plot
trimfill(meta_random
         , side = "right") ## For potential studies on the right of
                                      ## the funnel plot

## In principle, no studies imputed indicate no support for publication bias.

## Basic PET
PET <- lm(yi ~ sqrt(vi)
          , data = data_transformed
          , weights = 1/vi)

summary(PET)

confint(PET)

## Basic PEESE
PEESE <- lm(yi ~ vi
            , data = data_transformed
            , weights = 1/vi)

summary(PEESE)
confint(PEESE)

## In principle, non-significant results of PET-PEESE
## indicate no support for publication bias.

## For nice graphs illustrating PET-PEESE analyses, use JASP.

## Selection models
selmodel(meta_random, type = "beta")
## The estimate is a corrected overall effect size for publication bias
## If the corrected estimate is non-significant, it suggests that publication
## bias is present.

## For robust Bayesian meta-analysis, see JASP.

## See this tutorial: https://www.youtube.com/watch?v=2Cw_dqkZ8V0 for more
## information on publication bias analysis.

## Reporting meta-analysis

## metafor has a interesting function - reporter(). To see how it works, use
## function below, and then, open a newly generated html file.

reporter(meta_random_alloc)
## This function focuses only on the basic results.

## Citation of the packages used

utils::citation(package = "metafor")
utils::citation(package = "esc")