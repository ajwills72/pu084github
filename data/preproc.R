## Script takes raw E-prime/PsychoPy output (not included in repo, available on
## request) and preprocesses into a tidy trial-level datasets.
library(MASS)
library(tidyverse)
library(readxl)

## Note: The XLS file read below was compiled from the EDAT files using E-prime
## E-merge and E-DataAid. These applications are proprietary and non-scriptable
## so cannot be included in the analysis path. So, we start with the XLS file.

## Load XLS
edag  <- read_excel("ply44data.xls")

## Select columns
eda  <- edag %>% select(ExperimentName, Subject, `Procedure[Block]`,
                         triadlist.Cycle, Trial, triadidmain, respcue.RESP,
                         respcue.RT)

## Condition names must be numeric for model fit code
eda$ExperimentName <- recode(eda$ExperimentName, "Triad_HTP_colour" = 1,
                             "Triad_LTP_colour" = 2)

## Clean up column names
colnames(eda) <- c('cond','subj','phase','blk','trial','stim','resp','rt')

## Remove the trials which are just instructions to rest between blocks
eda  <- eda %>% filter(phase == "blockproc") %>% select(-phase)

## Save out tidied CSV
write_csv(eda, "ply44data.csv")

## Load XLS
edag  <- read_excel("ply62data.xls")

## Select columns
eda.ply62  <- edag %>% select(ExperimentName, Subject, `Procedure[Block]`,
                         triadlist.Cycle, Trial, triadidmain, respcue.RESP,
                         respcue.RT)

## Condition names must be numeric for model fit code
eda.ply62$ExperimentName <- recode(eda.ply62$ExperimentName, "Triad_HTP_colour" = 1,
                                   "Triad_LTP_colour" = 2)

## Clean up column names
colnames(eda.ply62) <- c('cond','subj','phase','blk','trial','stim','resp','rt')

## Remove the trials which are just instructions to rest between blocks
eda.ply62  <- eda.ply62 %>% filter(phase == "blockproc") %>% select(-phase)

## Save out tidied CSV
write_csv(eda, "ply62data.csv")

## Create master data frame
fnams  <- tibble(ppt  = list.files("ply84data", "*.csv", full.names=TRUE))
alldat  <- fnams %>%
    group_by(ppt) %>%
    do(read_csv(.$ppt,  col_types = "cci----i----id------c-")) %>% # Read CSV files
    ungroup %>%
    filter(!is.na(rcolour)) ## Remove 'press space to continue' trials

## Select, rename columns
alldat <- alldat %>% 
    select(ppt = participant, block = trials_2.thisRepN ,
           block = trials_2.thisRepN, trial = trials.thisTrialN,
           lcol = lcolour, rcol = rcolour, sim = rating.response,
           rt = rating.rt) 

## Tidy stim names, block counts, data types
alldat  <- alldat %>%
    mutate(lcol = as.integer(str_extract(lcol, "(\\d)"))) %>% ## Extract stim ID from filename
    mutate(rcol = as.integer(str_extract(rcol, "(\\d)"))) %>% ## Extract stim ID from filename
    mutate(block = block + 1) %>% ## Start block count from 1
    mutate(trial = trial + 1) %>%
    mutate(ppt = as.factor(ppt))

## Save out tidied CSV
write_csv(alldat, "ply84data.csv")