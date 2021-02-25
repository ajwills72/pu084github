## library(checkpoint)
## checkpoint("2021-02-02") ## Uncomment to use checkpoint
library(rmarkdown)
library(bookdown)

### UNCOMMENT FOLLOWING CODE IF USING CHECKPOINT ##

## papaja package not in CRAN at time this code written, get from github
## first installing dependencies

### Install tinytex package (you can potentially skip this if you already have LaTeX installed)

## if(!"tinytex" %in% rownames(installed.packages())) install.packages("tinytex")
## tinytex::install_tinytex()

### Install devtools package

## if(!"devtools" %in% rownames(installed.packages())) install.packages("devtools")

### Install the version of papaja I used 

## devtools::install_github("crsh/papaja@v0.1.0.9997")

### END OF CHECKPOINT-RELATED CODE ###

render("wills2021rapid.Rmd")

