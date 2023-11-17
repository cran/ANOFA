## ---- echo = FALSE, message = FALSE, results = 'hide', warning = FALSE--------
cat("this will be hidden; use for general initializations.\n")
library(ANOFA)
library(ggplot2)
library(superb)
# generate some random data with no meaning
set.seed(43)
#probs  #alone                 #ingroup               #harass                #shout
pr <- c(0.4/12,1.4/12,0.5/12,  2.3/12,1.0/12,0.5/12,  0.5/12,2.0/12,0.4/12,  0.5/12,2.0/12,0.5/12)
dta <- GRF( list(Gender          = c("boy", "girl", "other"), 
                 TypeOfInterplay = c("alone", "ingroup", "harrass", "shout")
            ),
            300,
            pr
        )

## ---- message = FALSE, warning = FALSE----------------------------------------
dta

## ---- warning = FALSE---------------------------------------------------------
library(ANOFA)

w <- anofa(Freq ~ Gender * TypeOfInterplay, data = dta) 

## ---- message=FALSE, warning=FALSE, fig.width=4, fig.height=3, fig.cap="**Figure 1**. The frequencies of the ficticious data as a function of Gender and Type of Interplay. Error bars show difference-adjusted 95% confidence intervals."----
anofaPlot(w) 

## -----------------------------------------------------------------------------
summary(w)

## -----------------------------------------------------------------------------
e <- emFrequencies(w, Freq ~ TypeOfInterplay | Gender)
summary(e)

## -----------------------------------------------------------------------------
f <- contrastFrequencies(e, list(
    "alone vs. harass                     " = c(-1,    0, +1,    0  ),
    "(alone & harass) vs. shout           " = c(-1/2,  0, -1/2, +1  ),
    "(alone & harass & shout) vs. in-group" = c(-1/3, +1, -1/3, -1/3)
    
))
summary(f)

## ---- results="hold"----------------------------------------------------------
sum(summary(f)[,1])  # Gs
sum(summary(f)[,2])  # degrees of freedom

## ---- results="hold"----------------------------------------------------------
sum(summary(e)[,1])  # Gs
sum(summary(e)[,2])  # degrees of freedom

## ---- results="hold"----------------------------------------------------------
sum(summary(w)[c(3,4),1])  # Gs
sum(summary(w)[c(3,4),2])  # degrees of freedom

