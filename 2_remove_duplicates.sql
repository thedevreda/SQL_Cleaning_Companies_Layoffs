-- 1 - Remove Duplicates
    -- We dont Have ID to to see duplicates so we will create a filter to remove them
WITH filter_duplicates AS (
    SELECT 
        *, 
        ROW_NUMBER() OVER( -- Partition by everything so it show you the duplicates
        -- for none dupl = 1 for dupl = 2,3,4,...etc
            PARTITION BY company,
                        industry,
                        country,
                        location,
                        total_laid_off,
                        percentage_laid_off,
                        date,
                        stage,
                        funds_raised_millions
        ) AS filter_dup
    FROM 
        companies_laid_offs_staging
)
SELECT * 
FROM 
    filter_duplicates
WHERE
    filter_dup > 1;

/*As you can see we filter dubplicates but when we want to delete it
we can't delete it by using CTE cuz its not let us to update
so we will create another table insert that results and then 
remove anything greater than 1 in filter_dup*/


CREATE TABLE public.companies_laid_offs_staging_2(
    company TEXT,
    location TEXT,
    industry TEXT,
    -- TEXT Because they type Null instead of leave it blanc so its text
    total_laid_off TEXT,
    -- 0.01 is TEXT
    percentage_laid_off TEXT,
    date TEXT,
    stage TEXT,
    country TEXT,
    funds_raised_millions TEXT,
    --Inserting the row number
    filter_dup INT
);

-- Inserting the values now of CTE
INSERT INTO companies_laid_offs_staging_2
    SELECT 
        *, 
        ROW_NUMBER() OVER( -- Partition by everything so it show you the duplicates
        -- for none dupl = 1 for dupl = 2,3,4,...etc
            PARTITION BY company,
                        industry,
                        country,
                        location,
                        total_laid_off,
                        percentage_laid_off,
                        date,
                        stage,
                        funds_raised_millions
        ) AS filter_dup
    FROM 
        companies_laid_offs_staging;

/* Now we will only work on companies_laid_offs_staging_2*/
-- Removing Duplicates

DELETE
FROM
    companies_laid_offs_staging_2
WHERE
    filter_dup > 1;

SELECT
    *
FROM
    companies_laid_offs_staging_2
;

