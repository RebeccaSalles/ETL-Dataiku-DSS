library(dataiku)
library(dplyr)
#install.packages("read.dbc")

#Script path
path.script = "https://github.com/RebeccaSalles/ETL-Dataiku-DSS/SIM/load.dbc.sim.r"

#Load script
if(!exists("load.dbc.sim", mode="function")) source(path.script)

datasus_files_list <- dkuReadDataset("datasus_files_list")
datasus_files_list <- paste(datasus_files_list$file_path,datasus_files_list$file_name,sep="")

# Compute recipe outputs
do_from_DBC <- load.dbc.sim(datasus_files_list)

# Recipe outputs
dkuWriteDataset(do_from_DBC, "DORES_from_dbc",schema = TRUE)
