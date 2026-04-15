/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files. 
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from csv Files to bronze tables.

Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;
===============================================================================
*/


CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN 

DECLARE @START_TIME DATETIME ,@END_TIME DATETIME,@batch_start_time Datetime,@batch_end_time Datetime;
BEGIN TRY
set @batch_start_time=GETDATE();

PRINT '==========================================';
PRINT 'loading the bronze layer';
PRINT '==========================================';



PRINT '------------------------------------------';
PRINT 'loading crm tables';
PRINT '------------------------------------------';

SET @START_TIME=GETDATE();
print'>>truncation table:bronze.crm_cust_info';

tRUNCATE TABLE bronze.crm_cust_info;
print'inserting data:bronze.crm_cust_info';
BULK INSERT bronze.crm_cust_info
FROM 'C:\Users\hitoy\Downloads\data_analyst_projects\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
WITH (
FIRSTROW=2,
FIELDTERMINATOR=',',
TABLOCK
);
SET @END_TIME=GETDATE();
PRINT'>>Load duration:'+CAST(DATEDIFF(SECOND,@START_TIME,@END_TIME) AS NVARCHAR)+'SECONDS';
PRINT'---------------------------------------';

SET @START_TIME=GETDATE();
print'>>truncation table:bronze.crm_prd_info';
tRUNCATE TABLE bronze.crm_prd_info;
print'inserting data:bronze.crm_prd_info';
BULK INSERT bronze.crm_prd_info
FROM 'C:\Users\hitoy\Downloads\data_analyst_projects\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
WITH (
FIRSTROW=2,
FIELDTERMINATOR=',',
TABLOCK
);
SET @END_TIME=GETDATE();
PRINT'>>Load duration:'+CAST(DATEDIFF(SECOND,@START_TIME,@END_TIME) AS NVARCHAR)+'SECONDS';
PRINT'---------------------------------------';

SET @START_TIME=GETDATE();
print'>>truncation table:bronze.crm_sales_details';
tRUNCATE TABLE bronze.crm_sales_details;
print'inserting data:bronze.crm_sales_details';
BULK INSERT bronze.crm_sales_details
FROM 'C:\Users\hitoy\Downloads\data_analyst_projects\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
WITH (
FIRSTROW=2,
FIELDTERMINATOR=',',
TABLOCK
);
SET @END_TIME=GETDATE();
PRINT'>>Load duration:'+CAST(DATEDIFF(SECOND,@START_TIME,@END_TIME) AS NVARCHAR)+'SECONDS';



PRINT '------------------------------------------';
PRINT 'loading erp tables';
PRINT '------------------------------------------';


SET @START_TIME=GETDATE();
print'>>truncation table:bronze.erp_loc_a101';
tRUNCATE TABLE bronze.erp_loc_a101;
print'inserting data:bronze.erp_loc_a101';
BULK INSERT bronze.erp_loc_a101
FROM 'C:\Users\hitoy\Downloads\data_analyst_projects\sql-data-warehouse-project\datasets\source_erp\loc_A101.csv'
WITH (
FIRSTROW=2,
FIELDTERMINATOR=',',
TABLOCK
);
SET @END_TIME=GETDATE();
PRINT'>>Load duration:'+CAST(DATEDIFF(SECOND,@START_TIME,@END_TIME) AS NVARCHAR)+'SECONDS';
PRINT'---------------------------------------';

SET @START_TIME=GETDATE();
print'>>truncation table:bronze.erp_cust_az12';
tRUNCATE TABLE bronze.erp_cust_az12;
print'inserting data:bronze.erp_cust_az12';
BULK INSERT bronze.erp_cust_az12
FROM 'C:\Users\hitoy\Downloads\data_analyst_projects\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
WITH (
FIRSTROW=2,
FIELDTERMINATOR=',',
TABLOCK
);
SET @END_TIME=GETDATE();
PRINT'>>Load duration:'+CAST(DATEDIFF(SECOND,@START_TIME,@END_TIME) AS NVARCHAR)+'SECONDS';
PRINT'---------------------------------------';




SET @START_TIME=GETDATE();
print'>>truncation table:bronze.erp_px_cat_g1v2';
tRUNCATE TABLE bronze.erp_px_cat_g1v2;
print'inserting data:bronze.erp_px_cat_g1v2';
BULK INSERT bronze.erp_px_cat_g1v2
FROM 'C:\Users\hitoy\Downloads\data_analyst_projects\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
WITH (
FIRSTROW=2,
FIELDTERMINATOR=',',
TABLOCK
);

SET @END_TIME=GETDATE();
PRINT'>>Load duration:'+CAST(DATEDIFF(SECOND,@START_TIME,@END_TIME) AS NVARCHAR)+'SECONDS';
PRINT'---------------------------------------';
SET @batch_end_time=GETDATE();

PRINT'==========================================================================================';
PRINT'LOADING BRONZE LAYER IS COMPLETED';

PRINT'>>TOTAL LOAD duration:'+CAST(DATEDIFF(SECOND,@START_TIME,@END_TIME) AS NVARCHAR)+'SECONDS';

PRINT'==========================================================================================';

END TRY
BEGIN CATCH
	PRINT'=============================================='
	PRINT'error occured during loading of bronze layer'
	PRINT'error message'+ERROR_MESSAGE();
	PRINT'error message'+CAST (ERROR_number() as nvarchar);
	PRINT'error message'+CAST (ERROR_STATE() as nvarchar);
	PRINT'==============================================='
END CATCH
END
