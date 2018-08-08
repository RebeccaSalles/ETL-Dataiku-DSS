library(dataiku)
library(dplyr)

#Script path
path.script = "https://github.com/RebeccaSalles/ETL-Dataiku-DSS/SIM/download.dbc.sim.r"

#FTP path
ftp_path = "ftp://ftp.datasus.gov.br/dissemin/publicos/SIM/CID10/DORES/"

#path for saving DBC files
path.data = "path_dbc_files"

#filters (optional)
estados = c("RJ")
anos = 2000:2014

#Load script
if(!exists("download.dbc.sim.r", mode="function")) source(path.script)

# Compute recipe outputs
datasus_files_list <- download.dbc.sim(ftp_path = ftp_path,
                                       dest_files_path = path.data,
                                       estados = estados,
                                       anos = anos)

# Recipe outputs
dkuWriteDataset(datasus_files_list,"datasus_files_list",schema = TRUE)
