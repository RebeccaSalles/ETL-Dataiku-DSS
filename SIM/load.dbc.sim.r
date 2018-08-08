load.dbc.sim <- function(files){
  require(read.dbc)
  
  do_from_DBC=data.frame()
  
  for(f in files){
    # Compute a data frame for the output to write
    bind_rows( do_from_DBC, read.dbc(f) ) -> do_from_DBC
  }
  return(do_from_DBC)
}
