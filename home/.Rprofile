options(repos="http://cran.cnr.Berkeley.edu")

# Need to install these from Github:
#devtools::instalthub("jalvesaq/colorout")
#devtools::instalthub("jalvesaq/VimCom")

library(magrittr)

if(interactive()){
   library(colorout)
   library(setwidth)
   options(vimcom.verbose = 1) # optional
   library(vimcom)
   # library(nvimcom)
   library(RPostgreSQL)
}

read_in_file <- function(fn) readChar(fn, file.info(fn)$size)

get_rshift_cxn <- function(...) {
    drv <- dbDriver('PostgreSQL')
    con <- dbConnect(drv, 
        user=Sys.getenv('REDSHIFT_USERNAME'),
        password=Sys.getenv('REDSHIFT_PASSWORD'),
        host='aa-dw.ceqzd6qj6kx3.us-east-1.redshift.amazonaws.com',
        dbname='dw',
        port=5439,
        ...
        )
    con
}

run_rshift_query <- function(query, ...) {
   con <- get_rshift_cxn(...)
   result <- dbGetQuery(con, query)
   dbDisconnect(con)
   result
}

run_rshift_queryfile <- function(fn, ...) {
   fn %>% read_in_file %>% run_rshift_query(...)
}

get_rshift_dplyr <- function() {
    library(dplyr)
    src_postgres(
            user=Sys.getenv('REDSHIFT_USERNAME'),
            password=Sys.getenv('REDSHIFT_PASSWORD'),
            host='aa-dw.ceqzd6qj6kx3.us-east-1.redshift.amazonaws.com',
            dbname='dw',
            port=5439
            )
}

