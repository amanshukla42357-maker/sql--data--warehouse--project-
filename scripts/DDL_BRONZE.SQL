--creating a ddl of erp file cust_a012
if OBJECT_ID(  'bronze.cust_A012', 'u') is not null 
drop table  bronze.cust_A012 
create table bronze.erp_cust_A012 (CID nvarchar(50)
,BDATE date
,GEN nvarchar(10)
)


--creating a ddl for erp file px_cat_g1v2 
if OBJECT_ID(  'bronze.px_cat_g1v2', 'u') is not null 
drop table bronze.px_cat_g1v2
create table bronze.erp_px_cat_g1v2 (ID nvarchar(50)
,CAT nvarchar(50) 
,SUBCAT nvarchar(50)
,MAINTENANCE nvarchar(20))


if OBJECT_ID(  'bronze.loc_A101', 'u') is not null 
drop table bronze.loc_A101
create table bronze.erp_loc_A101(


--creating a ddl for crm file prd_sales
if OBJECT_ID('bronze.prd_sales','u') is not null
drop table bronze.prd_sales
create table bronze.crm_prd_sales(prd_id int,prd_key nvarchar(50),prd_nm nvarchar(50),prd_cost nvarchar(50),prd_line nvarchar (50),prd_start_dt datetime,prd_end_dt datetime)


--creating a ddl for crm file (sales details
if OBJECT_ID('bronze.sales_details','u') is not null
drop table bronze.sales_details
create table bronze.crm_sales_details (sls_ord_num nvarchar(50),sls_prd_key nvarchar(50),sls_cust_id int ,sls_order_dt int,sls_ship_dt int,sls_due_dt int,sls_sales int,sls_quantity int ,sls_price int)

--creating a ddl for erp file loc_a101
if OBJECT_ID ('bronze.loc_a101' ,'u') is not null 
drop  table bronze.loc_a101
create table bronze.erp_loc_a101(CID nvarchar(50),CNTRY nvarchar(50))
