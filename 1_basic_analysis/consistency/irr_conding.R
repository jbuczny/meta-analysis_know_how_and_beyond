## Title: Consistency for three raters (coding phase)
## Author: Dr. Jacek Buczny, Vrije Universiteit Amsterdam
## Last saved: Jun 23, 2024

## This code accounts for three rater that is recommended for the screening phase analysis

library(irr)
library(readxl)

## Reading data with coded effect sizes

irr_coding <- read_excel("irr_coding.xlsx")

## Note that the values represent the effect size the raters agreed upon in terms of type of effect size,
## namely, in a single line can be only, for instance, Pearson's r

View(irr_coding)

## Omitting report_id

irr_coding = subset(irr_coding, select = c(Rater_1, Rater_2, Rater_3))

View(irr_coding) ## The data set should not include report_id

head(irr_coding)

## Calculating ICC for continuous variables with CIs
icc(irr_coding
    , model = "twoway" ## two random factors
    , type = "agreement" ## How much agree with each other
    , unit = "single" ## Single indicator of effect size
    , conf.level = 0.95)

## Average correlations
meancor(irr_coding
        , fisher = TRUE)

## Inter-rater reliability coefficients
robinson(irr_coding)

## References
## Bartko, J. J. (1966). The intraclass correlation coefficient as a measure of reliability. Psychol Rep, 19(1), 3–11. http://doi.org/10.2466/pr0.1966.19.1.3
## Koo, T. K., & Li, M. Y. (2016). A guideline of selecting and reporting Intraclass correlation coefficients for reliability research. Journal of Chiropractic Medicine, 15(2), 155–163. https://doi.org/10.1016/j.jcm.2016.02.012
## Gamer, M. (2019). irr: Various Coefficients of Interrater Reliability and Agreement. R package version 0.84.1, https://CRAN.R-project.org/package=irr.

citation()
citation("irr")
citation("readxl")
