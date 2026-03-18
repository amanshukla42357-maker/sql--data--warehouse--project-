/*
=============================================================================================
                        quality checks 
=============================================================================================

script purpose 
  the script performs various qualoty checks for data consistency ,accuracy and standerdization 
across the 'silver schema'  it includes checks for :
1) null or duplicates primary keys
2) unwwanted spaces in the string feild
3)data standerization and consistency 
4)invalid data ranges and orders 
5)data consistency between related feilds

usage notes 
  -- run the checks after landing the silver layer 
  -- investigate and resolve any descripencies found during the checks 
================================================================================================
*/

print'================================================================================================'

print '     checking silver.crm_cust_info        '

print '================================================================================================'

-- checking for nulls or duplicates in the primary key 
--expectations = no results
select cst_id 
count (*) from silver.crm_cust_info  
group by cst_id 
having count(*)> 1 or cst_id is null 

--check for unwanted spaces 
--expectations = no results
select Cst_firstname
from silver.crm_cust_info
where Cst_firstname != trim(Cst_firstname)


print'================================================================================================'

print '     checking silver.crm_prd_sales         '

print '================================================================================================'

--checking whether the prd_id is duplicate or not
expectations - no results 
SELECT 
prd_id,
COUNT(*) counting_nulls_or_duplicates
FROM bronze.crm_prd_sales
group by prd_id
HAVING count(*) >1 or prd_id is null

print'================================================================================================'

print '     checking silver.erp_px_cat_g1v2         '

print '================================================================================================'

--CHECK FOR UNWANTED SPACES
expectations -- no results 
SELECT CAT ,SUBCAT
FROM bronze.erp_px_cat_g1v2
WHERE CAT != TRIM(CAT) OR SUBCAT != TRIM(SUBCAT)

 --checking for distinct characters in the data 
SELECT DISTINCT CAT,
SUBCAT ,
MAINTENANCE 
FROM silver.erp_px_cat_g1v2 

print'================================================================================================'

print '     checking silver.erp_loc_a101        '

print '================================================================================================'
select distinct cntry 
from silver.erp_loc_a101  
order by cntry 

print'================================================================================================'

print '     checking silver.erp_cust_az12     '

print '================================================================================================'

-- identifying out of range date 
expectations = check the date between  1924 to getdate()
select distinct bdate
from silver.erp_cust_az12 
where bdate <'1924-01-01'
or bdate > getdate()

--data standerdization and standerization 
select dis 
gen  
from silver.erp_cust_az12 

print'================================================================================================'

print '     checking silver.crm_sales_detaials'

print '================================================================================================'
-- checking the invalid dates 
-- expectations no invalid dates  (order date> shipping date)
select *
from silver.crm_sales_details
where sls_order_dt > sls_ship_dt
or sls_order_dt > sls_due_dt

--checking data consistency :sales = quantity * price 
select distinctsls_sales,sls_qunatity,sls_price 
from silver.crm_sales_details
where sls_sales != sls_quantity * sls_price or sls_sales is null or sls_quantity is null or sls_price is null or 
sls_price like '-%'
order by sls_sales,sls_quantity, sls_price

