/*
=========================================
Create Database and Schemas
=========================================

Script Purpose:
    This script creates a new database named Datawarehouse after checking if it already exists.
    If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas within the database: 'bronze", 'silver', and 'gold"

WARNING:
    Running this script will drop the entire 'Datawarehouse" database if it exists.
    All data in the database will be permanently deleted. Proceed with caution and ensure you have proper backups before running this script.

*/


USE master;
GO

-- Drop and recreate the 'DataWareHouse' database
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'DataWareHouse')
BEGIN
    ALTER DATABASE DataWareHouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWareHouse;
END;
GO

-- Create the 'DataWareHouse'
CREATE DATABASE DataWareHouse;
GO

USE DataWareHouse;
GO

-- Create Schemas
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'bronze')
    EXEC('CREATE SCHEMA bronze');

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'silver')
    EXEC('CREATE SCHEMA silver');

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'gold')
    EXEC('CREATE SCHEMA gold');
