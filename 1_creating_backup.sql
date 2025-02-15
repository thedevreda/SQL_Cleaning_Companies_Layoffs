/*
Creating a backup data is most important to not miss with raw data
at all even if something happen or error you wwill still have raw data to 
back on
*/

-- Creating companies_laidoff_staging
CREATE TABLE companies_laid_offs_staging AS
    SELECT 
        *
    FROM 
        company_laid_offs;


