## ---- echo = FALSE, message = FALSE, results = 'hide', warning = FALSE--------
cat("this is hidden; general initializations.\n")
library(ANOFA)
w<-anofa(Frequency ~ Intensity * Pitch, minimalExample)
dataRaw      <- toRaw(w)
dataWide     <- toWide(w)
dataCompiled <-toCompiled(w)
dataLong     <- toLong(w)

## ---- message=FALSE, warning=FALSE, echo=TRUE, eval=TRUE----------------------
library(ANOFA)   

## ---- message=FALSE, warning=FALSE, echo=TRUE, eval=TRUE----------------------
dataRaw

## ---- message=FALSE, warning=FALSE, echo=TRUE, eval=TRUE----------------------
w <- anofa( ~ cbind(Low,Medium,High) + cbind(Soft,Hard), dataRaw)

## ---- message=FALSE, warning=FALSE, echo=TRUE, eval=TRUE----------------------
dataWide

## ---- message=FALSE, warning=FALSE, echo=TRUE, eval=TRUE----------------------
w <- anofa( ~ Intensity * Pitch, dataWide)

## ---- message=FALSE, warning=FALSE, echo=TRUE, eval=TRUE----------------------
dataCompiled

## ---- message=FALSE, warning=FALSE, echo=TRUE, eval=TRUE----------------------
w <- anofa(Frequency ~ Intensity * Pitch, dataCompiled )

## ---- message=FALSE, warning=FALSE, echo=TRUE, eval=TRUE----------------------
dataLong

## ---- message=FALSE, warning=FALSE, echo=TRUE, eval=TRUE----------------------
w <- anofa( Level ~ Factor | Id, dataLong)

## ---- message=FALSE, warning=FALSE, echo=TRUE, eval=TRUE----------------------
toCompiled(w)

## ---- message=FALSE, warning=FALSE, echo=TRUE, eval=TRUE----------------------
w <- anofa( ~ cbind(Low,Medium,High) + cbind(Soft,Hard), dataRaw)
toCompiled(w)

## ---- message=FALSE, warning=FALSE, echo=TRUE, eval=TRUE----------------------
w <- anofa( ~ cbind(Low,Medium,High) + cbind(Soft,Hard), dataRaw, 
            factors = c("Intensity","Pitch")
          )
toCompiled(w)

