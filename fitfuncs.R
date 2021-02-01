## Define functions for each response model
bright.mdl <- function(x) if (cde[x[1],'bright'] == x[2]) 1 else 0
chroma.mdl <- function(x) if (cde[x[1],'chroma'] == x[2]) 1 else 0
os.mdl <- function(x) if (cde[x[1],'os'] == x[2]) 1 else 0
ident.mdl <- function(x) if (cde[x[1],'ident'] == x[2]) 1 else 0
resp1.mdl <- function(x) if (1 == x[2]) 1 else 0
resp2.mdl <- function(x) if (2 == x[2]) 1 else 0
resp3.mdl <- function(x) if (3 == x[2]) 1 else 0

## Define function to fit single participant
ppfits <- function(ppno,blkno) {
  out <- array(0,14)
  dta <- subset(bigdta, bigdta$subj == ppno)
  if(blkno > 0) dta <-subset(dta, dta$blk == blkno)
  out[1] = as.numeric(dta[1,'subj'])
  out[2] = as.numeric(dta[1,'cond'])
  out[3] = as.numeric(blkno)
  x <- cbind(dta$stim,dta$resp)
  colnames(x) <- c('stim','resp')
  out[4] = sum(apply(x,1,bright.mdl)) 
  out[5] = sum(apply(x,1,chroma.mdl))
  out[6] = max(out[4],out[5]) # UD fit
  out[7] = sum(apply(x,1,os.mdl))
  out[8] = sum(apply(x,1,ident.mdl))  
  # Only do key bias analysis on full data set
  if(blkno == 0) {
    out[9] = sum(apply(x,1,resp1.mdl))    
    out[10] = sum(apply(x,1,resp2.mdl))    
    out[11] = sum(apply(x,1,resp3.mdl))  
  }
  out[12] = which.max(out[6:11]) # Best fitting model
  out[13] = max(out[6:11])/nrow(dta) # Model consistency
  tmp <- out[6:11]
  tmp <- tmp[order(tmp)]
  out[14] = (tmp[6] - tmp[5])/nrow(dta) # Win margin
  return(out)
}
