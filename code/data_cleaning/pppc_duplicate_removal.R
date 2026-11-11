# this script removes duplicates from the full pppc dataset (pppc_allScales.rds)
# assumes working directory is the directory containing the RDS file

library(tidyverse)
pppc <- readRDS(paste(getwd(), "pppc_allScales.rds", sep="/"))

# add flag with number of records per key
pppc <- pppc |>
  group_by(plotID, subplotID, boutNumber, eventID,
           taxonID, identificationQualifier,
           morphospeciesID, otherVariables) |>
  add_count()

# for the duplicates, try to figure out if entire plot/bout is duplicated?
pppcdup <- pppc |>
  filter(n>1)

# loop over unique plot, subplot, eventID and see how many records have n=1 vs n>1?
for(i in unique(pppcdup)) {
  
}


