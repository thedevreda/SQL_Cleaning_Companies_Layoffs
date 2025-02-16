
-- Total_laid_off, percentage_laid_off, funds_raised_millions columns
/*
 Total_laid_off, percentage_laid_off have a relaion with each other so we have some null values we should fix
 but How? unfortunly we can't cuz you have 100% laid off that's mean all employes in company have been laid off
 but we dont now the number of total but if we had Company total employee bu using some math we can fix
 comppany total * percentage_laid_off = Total_laid_off

 So we delete when Total_laid_off and percentage_laid_off IS NULL cuz its useless
 
*/

SELECT  *
FROM 
    companies_laid_offs_staging_2
WHERE 
    total_laid_off IS NULL
    AND percentage_laid_off IS NULL;

-- Deleting Null rows
DELETE
FROM 
    companies_laid_offs_staging_2
WHERE 
    total_laid_off IS NULL
    AND percentage_laid_off IS NULL;

-- Droping Unecessary columns

ALTER TABLE companies_laid_offs_staging_2
DROP COLUMN filter_dup;


/*
 For funds_raised_millions if we droping it we will delete also a bunch of
 total and percentage laid off that we need
*/

SELECT  *
FROM 
    companies_laid_offs_staging_2
WHERE 
    funds_raised_millions IS NULL;

