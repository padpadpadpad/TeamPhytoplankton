# TeamPhytoplankton

TeamPhytoplankton is an R package aimed to make the life of the labgroup easier. We research thermal adaptation of phytoplankton and most of the functions within the package reflect that.

Most notable functions include:

nlsLoop - an upgrade on nlsList which fits a model to each curve in a set by shotgunning the desired number of starting parameters. The best model is picked using AIC.

schoolfield.high - fits the high inactivation only version of the modified Sharpe Schoolfield equation.

Eilers_PI - fits the Eilers PI curve to photosynthesis vs light data.

Platt_PI - fits the Platt PI curve (including photoinhibition) to photosynthesis vs light data.

quasi.rsq.nls - calculates a pseudo-rsquared value for non-linear models.

# Installation from GitHub

Installation has usually been made possible using Hadley Wickham's "devtools" package. However it has a lot of dependencies and proves problematic for some Windows users so there is new package on CRAN called "ghit" that should alleviate some of these issues.

```{R}
install.packages("devtools")

# or
install.packages("ghit")

library(devtools)

install_github("padpadpadpad/TeamPhytoplankton")

library(TeamPhytoplankton)
```

Voila!
