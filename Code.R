library(lavaan)

dat <- read.csv("worland5.csv")

head(dat)


#Simple Linear Regression

m1 <-   '
  # regressions
    read ~ 1 + motiv
  # variance (optional)
    motiv ~~ motiv
'

fit1 <- sem(m1, data=dat)
summary(fit1, fit.measures=TRUE)

#Path Analysis

m2 <- '
  # regressions
    read ~ 1 + ppsych + motiv
    arith ~ 1 + motiv + read + ppsych
  # covariance and variance
    read~~read
    ppsych~~ppsych
    motiv~~motiv
    arith~~arith
    motiv ~~ ppsych
    
'

fit2 <- sem(m2, data=dat)
summary(fit2, fit.measures=TRUE)

#Structural Regression

m3 <- '
# measurement model
adjust =~ motiv + harm + stabi
risk =~ verbal + ppsych + ses
achieve =~ read + arith + spell
# regressions
achieve ~ adjust + risk
'
fit3 <- sem(m3, data=dat)
summary(fit3, fit.measures=TRUE)



