download.dbc.sim <- function(ftp_path = "ftp://ftp.datasus.gov.br/dissemin/publicos/SIM/CID10/DORES/",
                         dest_files_path = getwd(),
                         estados = NULL, anos = NULL){
  require(RCurl)
  require(tidyverse)
  
  url <- ftp_path
  #userpwd <- "yourUser:yourPass"
  #recupera o nome dos arquivos em ftp_path
  filenames <- getURL(url, userpwd = NULL,
                      ftp.use.epsv = FALSE,dirlistonly = TRUE)
  filenames <- unlist(strsplit(filenames,"\n"))
  filenames <- data.frame(filename=filenames)
  filenames <- data.frame(lapply(filenames, as.character), stringsAsFactors=FALSE)
  
  #filtra os estados desejados se estes forem especificados
  if(!is.null(estados)){
    filenames <- filenames %>%
      filter(str_detect(filename, paste(estados,sep="",collapse = '|')))
  }
  #filtra os anos desejados se estes forem especificados
  if(!is.null(anos)){
    filenames <- filenames %>%
      filter(str_detect(filename, paste(anos,sep="",collapse = '|')))
  }
  
  #faz download dos arquivos selecionados e salva os arquivos em dest_files_path
  for (filename in filenames$filename) {
    download.file(paste(url, filename, sep = ""), paste(dest_files_path, "/", filename, sep = ""))
  }
  
  #retorna um data.frame com os nomes e caminho dos arquivos
  return(data.frame(file_name=filenames$filename,file_path=dest_files_path))
}
