#Packae to connect MySQL
#install.packages("RMySQL")
#install.packages("dbConnect")
#install.packages("leaflet")
#install.packages("tidyverse")
#install.packages('rsconnect')

library(RMySQL)
library(dbConnect)
library(shiny)
library(datasets)
library(dplyr)
library(leaflet)
library(tidyverse)
library(rsconnect)

#rsconnect::deployApp('/Users/kv/good2cu')

# Endpoint RDS is host 
# port same page
# db inside aws User
# db inside aws Password

options(mysql = list(
  "host" = "australianchilddbidentifier.czlfekbldakq.ap-southeast-2.rds.amazonaws.com",
  "port" = 3306,
  "user" = "rootdb",
  "password" = "parthma4"
))


#Create a database connection
mydb = dbConnect(MySQL(), dbname='australianchilddatabase', host= options()$mysql$host,port= options()$mysql$port, user= options()$mysql$user, password = options()$mysql$password)


dbListTables(mydb)
#create table in R from Mysql table # change with name of my db
myQuery <- "select * from australianchilddatabase.schooldb"

# R shiny Io set up account (secret, token and name) -> set up rshinyio
df_new <- dbGetQuery(mydb, myQuery)
str(df_new)
print(df_new)
# Disconnect the connection with RDS 
dbDisconnect(mydb)
# Get from the website
rsconnect::setAccountInfo(name='challengersma4', token='270CBBC173246547772421F9E3C893F2', secret='33F0LbPLkBa9TLCm7yQfs0oskbIkFNrk6GyXn00U')

