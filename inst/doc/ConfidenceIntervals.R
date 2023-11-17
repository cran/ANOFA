## ---- echo = FALSE, message = FALSE, results = 'hide', warning = FALSE--------
cat("this will be hidden; use for general initializations.\n")
library(ANOFA)

## ---- message=FALSE, warning=FALSE, fig.width=5, fig.height=3, fig.cap="**Figure 1**. The frequencies of the Light & Margolin, 1971, data as a function of aspiration for higher education and as a function of gender. Error bars show difference-adjusted 95% confidence intervals."----
library(ANOFA)
w <- anofa( obsfreq ~ vocation * gender, LightMargolin1971)
anofaPlot(w) 

## ---- message=FALSE, warning=FALSE, fig.width=4, fig.height=3, fig.cap="**Figure 2**. The frequencies of the Light & Margolin, 1971, data as a function of gender. Error bars show difference-adjusted 95% confidence intervals."----
anofaPlot(w, obsfreq ~ gender) 

## ---- message=FALSE, warning=FALSE, fig.width=4, fig.height=3, fig.cap="**Figure 3**. Same as Figure 2 with some customization."----
library(ggplot2)
anofaPlot(w, obsfreq ~ gender) +
  theme_bw()

