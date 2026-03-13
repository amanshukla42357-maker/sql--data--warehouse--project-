/*
=============================================================================
create data bse and schema
=============================================================================
script purpose 
The scripts a new data base "data_analytics_warehouse" after checking its already exists.
if the data base exists it is dropped and created new 
additionally the scripts add 3 schema with in the database : bronze , silver ,gold 

warning 
Running this scripts will drop the entire "data_analytics_warehouse" database if it exists
All the data in the database will be permanently deleted . proceed with caution and ensure the entire backups of the script


use master 
go ;
-- drop and create "data_analytics_warehouse" if exists 
if exists (select 1 sys.database where name  = "data_analytics_warehouse")
begin 
     alter data ware house set single_user with roll backup immidiate ;
drop database data_analytics_warehouse
end 
 -- create database "data_analytics_warehouse" 

CREATE DATABASE DATA_ANALYTICS_WAREHOUSE;

--using the database DATA_ANALYTICS_WAREHOUSE
USE DATA_ANALYTICS_WAREHOUSE;

-- TO CREATE SCHEMA (bronze)
CREATE SCHEMA bronze 
GO 
-- TO CREATE SCHEMA (silver)
CREATE SCHEMA silver  
GO 
-- TO CREATE SCHEMA (gold )
CREATE SCHEMA gold  
GO 
