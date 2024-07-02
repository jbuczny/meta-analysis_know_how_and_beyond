## Title: Consistency for two raters (PRISMA 2020 screening phase)
## Author: Dr. Jacek Buczny, Vrije Universiteit Amsterdam
## Last saved: Jun 23, 2024

## This code accounts for two rater that is sufficient for the screening phase analysis

library(readxl)
library(irr)
library(vcd)

## Reading data

irr_screening <- read_excel("irr_screening.xlsx")

View(irr_screening)

head(irr_screening)

## Calculating kappa for the categorical variables

irr_kappa <- kappa2(irr_screening[, c("Rater_1", "Rater_2")]
                    , weight = "unweighted")

irr_kappa

## Creating contingency table 2x2

irr_contingency <- table(irr_screening$Rater_1
                         , irr_screening$Rater_2)

irr_contingency

categories <- c("0", "1")

## Updating the table for clarity

dimnames(irr_contingency) <- list(Rater_1 = categories
                                  , Rater_2 = categories)

irr_contingency

## Calculating kappa with confidence intervals

vcd_kappa <- vcd::Kappa(irr_contingency)

vcd_kappa

confint(vcd_kappa)

## References
## Bartko, J. J. (1966). The intraclass correlation coefficient as a measure of reliability. Psychol Rep, 19(1), 3–11. http://doi.org/10.2466/pr0.1966.19.1.3
## Koo, T. K., & Li, M. Y. (2016). A guideline of selecting and reporting Intraclass correlation coefficients for reliability research. Journal of Chiropractic Medicine, 15(2), 155–163. https://doi.org/10.1016/j.jcm.2016.02.012
## Meyer D, Zeileis A, Hornik K (2023). vcd: Visualizing Categorical Data. R package version 1.4-11, https://CRAN.R-project.org/package=vcd.

citation()
citation("irr")
citation("readxl")
citation("vcd")
