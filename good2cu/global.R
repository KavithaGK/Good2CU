# Packae to connect MySQL
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


options(mysql = list(
  "host" = "good2cu.c5qcu27edea7.us-east-2.rds.amazonaws.com",
  "port" = 3306,
  "user" = "good2cu",
  "password" = "good2cuie"
))
#Create a database connection
mydb = dbConnect(MySQL(), dbname='sportsdb', host= options()$mysql$host,port= options()$mysql$port, user= options()$mysql$user, password = options()$mysql$password)
                
dbListTables(mydb)
#create table in R from Mysql table
myQuery <- "select * from sportsdb.sports"
df <- dbGetQuery(mydb, myQuery)
str(df)
dbDisconnect(mydb)
rsconnect::setAccountInfo(name='good2cu', token='FBA3DCC7E9E5C1CE47063EB4EA3AC58E', secret='6OcVKMAYQ2Ri0zAieCLThyh4otB0xV27DjfNDetV')
