# pu084github

This repository contains all the code required to reproduce the manuscript:

Wills, A.J., Edmunds, C.E.R, & Milton, F. (2021). The rapid synthesis of integral stimuli. _preprint_.

## Compiling the manuscript

Run `to-compile.R` to compile the manuscript. It produces both the main manuscript (`wills2021rapid.pdf`) and the online supplementary materials (`wills2021rapid-som-r.pdf`). Compilation may take a couple of minutes. 

## How it works

The script `to-compile.R` runs the two Rmarkdown files in turn. These run the analyses, include the manuscript text, and output in PDF format. 

## Reproducibility

You can use the `checkpoint` package to recreate the R environment that was used in these analyses. Depending on your system, the commands to set up a checkpoint may take 10+ minutes to run, so are commented out in `to-compile.R`. Uncomment to use this functionality

## List of files

### Data

**data/ply44data.csv** - Trial-level data for Experiment 1. Columns are as follows: _cond_ : Experimental condition (1 = 100 ms, 2 = 2000 ms), _subj_: Participant number, _blk_: Block number, _trial_: Trial number, _triad_: Arbitrary code for stimulus presented, _resp_: Physical response key depressed, _rt_: Response time, _left1_ : Stimulus presented on the left of the triad (number indicates filename e.g. 1 = 1.png); _mid2_: stimulus presented in the middle of the triad, _right3_: stimulus presented of the right of the triad.

**data/ply62data.csv** - Trial-level data for Experiment 2. Same data format as ply44data.csv

**data/ply84data.csv** - Trial-level data for Experiment 3. Columns are as follows: _ppt_: Participant number, _block_: Block number, _trial_: Trial number, _lcol_: Stimulus presented on the left of the screen, _rcol_: Stimulus presented on the right of the screen, _sim_: Participant's similarity rating, _rt_: Participant's reaction time.

**data/preproc.R** - R script that generates trial-level data from raw E-prime
and PsychoPy files (raw files available on request).

### Stimuli

**stimuli** - Directory, containing the eight stimulus files used in all experiments. 

### R, Rmarkdown, and associated files

**apa.csl** - Style file for APA-format referencing

**BFfunc.R** - Custom function to calculate Bayes Factor by the Dienes (2011) method

**book.bib** - List of references, in bibtex format.

**fitfuncs.R** - Custom functions for fitting the response model.

**munsell-coords_red.csv** - Co-ordinates of stimuli in Munsell space.

**packages.R** - R script loading all packages required (helps to keep this in
one place, particularly for checkpointing)

**stimfig.png** - Figure 1 in the manuscript.

**stimfig.svg** - Original source file for stimfig.png

**tmp** - Initially empty directory to which R workspace is stored.

**to-compile.R** - R script to compile manuscript

**wills2021rapid.Rmd** - Rmarkdown file containing the text and analysis script for the main manuscript

**wills2021rapid-som-r.Rmd** - Rmarkdown file containing the text and analysis script for the supplementary online materials. 

### Other 

**clrtmp.sh** - Shell script to clear all temporary files generated (Linux only)

**LICENSE** - License file (GPL3)

**README.md** - This file


