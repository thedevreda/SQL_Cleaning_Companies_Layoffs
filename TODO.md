/*
 Delete nulls text from total_laid_off,percentage_laid_off,funds_raised_millions : 
    
    UPDATE companies_laid_offs_staging_2
    SET industry = ''
    WHERE industry = 'NULL';

 Change the type of them to INT=110 NUMERIC=0.35 :

    UPDATE companies_laid_offs_staging_2
    SET total_laid_off = ''
    WHERE total_laid_off = 'NULL';

    ALTER TABLE companies_laid_offs_staging_2
    ALTER COLUMN date TYPE DATE USING date::DATE;

 Change the type of date to DATE : 

   ALTER TABLE companies_laid_offs_staging_2
   ALTER COLUMN date TYPE DATE USING date::DATE;
*/

-- 1 Remove Duplicates
-- 2 Standarizing Data
-- 3 Null Values or blank values
-- 4 Remove any columns
