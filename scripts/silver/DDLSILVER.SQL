--CREATING DDL FOR SILVER LAYER 
/*
=================================================================
       DDL SCRIPT : CREATE  SILVER TABLE
=================================================================
=================================================================
      SCRIPT PURPOSE :
      THIS SCRIPT CREATES TABLES IN "SILVER SCHEMA ,DROPING THE
      EXISTING TABLE IF THEY ALREADY EXIST
   RUN THIS SCRIPT TO REDEFINE THE STRUCTURE OF THE SILVER TABLE 
=================================================================
*/



/* ================================================================
   DDL SCRIPT : CREATE SILVER TABLES
   PURPOSE    : Creates tables in Silver schema, dropping existing
                ones if they already exist
================================================================= */

-- ERP Customer Table
if OBJECT_ID('silver.erp_cust_A012','U') is not null
    drop table silver.erp_cust_A012;
create table silver.erp_cust_A012 (
    CID nvarchar(50),
    BDATE date,
    GEN nvarchar(10), cst_create_date date,dwh_create_date datetime2 default getdate()
);

-- ERP Category Table
if OBJECT_ID('silver.erp_px_cat_g1v2','U') is not null
    drop table silver.erp_px_cat_g1v2;
create table silver.erp_px_cat_g1v2 (
    ID nvarchar(50),
    CAT nvarchar(50),
    SUBCAT nvarchar(50),
    MAINTENANCE nvarchar(20), cst_create_date date,dwh_create_date datetime2 default getdate()
);

-- ERP Location Table
if OBJECT_ID('silver.erp_loc_A101','U') is not null
    drop table silver.erp_loc_A101;
create table silver.erp_loc_A101 (
    CID nvarchar(50),
    CNTRY nvarchar(50), cst_create_date date,dwh_create_date datetime2 default getdate()
);
print '=============================================================================================';

-- CRM Product Sales Table
if OBJECT_ID('silver.crm_prd_sales','U') is not null
    drop table silver.crm_prd_sales;
create table silver.crm_prd_sales (
    prd_id int,
    prd_key nvarchar(50),
    prd_nm nvarchar(50),
    prd_cost nvarchar(50),
    prd_line nvarchar(50),
    prd_start_dt datetime,
    prd_end_dt datetime, cst_create_date date,dwh_create_date datetime2 default getdate()
);

-- CRM Sales Details Table
if OBJECT_ID('silver.crm_sales_details','U') is not null
    drop table silver.crm_sales_details;
create table silver.crm_sales_details (
    sls_ord_num nvarchar(50),
    sls_prd_key nvarchar(50),
    sls_cust_id int,
    sls_order_dt date,
    sls_ship_dt date,
    sls_due_dt date,
    sls_sales int,
    sls_quantity int,
    sls_price int, cst_create_date date,dwh_create_date datetime2 default getdate()
);

-- CRM Customer Info Table
if OBJECT_ID('silver.crm_cust_info','U') is not null
    drop table silver.crm_cust_info;
create table silver.crm_cust_info (
    cst_id int,
    cst_key nvarchar(50),
    cst_firstname nvarchar(50),
    cst_lastname nvarchar(50),
    cst_marital_status nvarchar(50),
    cst_gndr nvarchar(50),
    cst_create_date date,dwh_create_date datetime2 default getdate()
);
