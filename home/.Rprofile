library(colorout)
library(vimcom)

options(repos="http://cran.cnr.Berkeley.edu")


get_rshift_cxn <- function() {
    library('RPostgreSQL')
    
    drv <- dbDriver('PostgreSQL')
    con <- dbConnect(drv, 
        user=Sys.getenv('redshift_username'),
        password=Sys.getenv('redshift_password'),
        host='aa-dw.ceqzd6qj6kx3.us-east-1.redshift.amazonaws.com',
        dbname='dw',
        port=5439
        )
    con
}

get_rshift_dplyr <- function() {
    src_postgres(
            user=Sys.getenv('redshift_username'),
            password=Sys.getenv('redshift_password'),
            host='aa-dw.ceqzd6qj6kx3.us-east-1.redshift.amazonaws.com',
            dbname='dw',
            port=5439
            )
}

