


 
==================================================================
      BULK INSERTING THE DATA INTO THE SQL SERVER
==================================================================
*/

--EXEC bronze.LOAD_BRONZE
CREATE OR ALTER PROCEDURE bronze.LOAD_BRONZE AS
BEGIN 
BEGIN TRY 
declare @start_time datetime , @end_time datetime

    PRINT'============================================================'
    PRINT'LOADING BRONZE LAYER'
    PRINT '==========================================================='
    PRINT 'CRM LAYER'
    PRINT 'TRUNCATING THE bronze.crm_cust_info'
    set @start_time = GETDATE()
    TRUNCATE TABLE bronze.crm_cust_info
    PRINT 'INSERTING THE bronze.crm_cust_info'
    
    BULK INSERT bronze.crm_cust_info
    FROM 'C:\dbc9660c89a3480fa5eb9bae464d6c07\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'

    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '\n',
        TABLOCK
    );
   set @end_time = GETDATE()
   print'duration_load' + cast( datediff (second, @start_time, @end_time)as nvarchar) + 'seconds'


 

    PRINT 'TRUNCATING THE bronze.crm_prd_sales'
    TRUNCATE TABLE bronze.crm_prd_sales
    PRINT 'INSERTING THE bronze.crm_prd_sales'
      set @start_time = GETDATE()
    bulk insert bronze.crm_prd_sales
    from 'C:\dbc9660c89a3480fa5eb9bae464d6c07\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '\n',
        TABLOCK
    );set @end_time = GETDATE()
   print'duration_load' + cast( datediff (second, @start_time, @end_time)as nvarchar) + 'seconds'
    

    PRINT 'TRUNCATING THE bronze.crm_sales_details'
    TRUNCATE TABLE bronze.crm_sales_details
    PRINT 'INSERTING THE bronze.crm_sales_details'
       set @start_time = GETDATE()
    bulk insert bronze.crm_sales_details
    from 'C:\dbc9660c89a3480fa5eb9bae464d6c07\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '\n',
        TABLOCK
    );set @end_time = GETDATE()
   print'duration_load' + cast( datediff (second, @start_time, @end_time)as nvarchar) + 'seconds'
   
   

    PRINT'----------------------------------------------'

    PRINT 'ERP LAYER'

    PRINT 'TRUNCATING THE  bronze.erp_px_cat_g1v2'
    TRUNCATE TABLE bronze.erp_px_cat_g1v2
    PRINT 'INSERTING THE  bronze.erp_px_cat_g1v2'
   set @start_time = GETDATE()
    bulk insert bronze.erp_px_cat_g1v2
    from 'C:\dbc9660c89a3480fa5eb9bae464d6c07\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '\n',
        TABLOCK
    );set @end_time = GETDATE()
   print'duration_load' + cast( datediff (second, @start_time, @end_time)as nvarchar) + 'seconds'




    PRINT 'TRUNCATING THE bronze.erp_loc_a101'
    TRUNCATE TABLE bronze.erp_loc_a101
    PRINT 'INSERTING THE bronze.erp_loc_a101'
   set @start_time = GETDATE()
    bulk insert bronze.erp_loc_a101
    from 'C:\dbc9660c89a3480fa5eb9bae464d6c07\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '\n',
        TABLOCK

    );set @end_time = GETDATE()
   print'duration_load' + cast( datediff (second, @start_time, @end_time)as nvarchar) + 'seconds'

    PRINT 'TRUNCATING THE bronze.erp_cust_A012'
    TRUNCATE TABLE bronze.erp_cust_A012
    PRINT 'INSERTING THE bronze.erp_cust_A012'
   set @start_time = GETDATE()
    bulk insert bronze.erp_cust_A012
    from 'C:\dbc9660c89a3480fa5eb9bae464d6c07\sql-data-warehouse-project\datasets\source_erp\cust_AZ12.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '\n',
        TABLOCK
    );set @end_time = GETDATE()
   print'duration_load' + cast( datediff (second, @start_time, @end_time)as nvarchar) + 'seconds'
    
    
 END TRY
    begin catch 
    print' ============================================'
    print 'error occured during sql loading of bronze layer '
    print 'error message ' + error_message()
    print 'error number ' + cast (error_number() as nvarchar(50))
    print 'error state' +cast(error_state() as nvarchar)
    print '============================================'
    end catch
End
