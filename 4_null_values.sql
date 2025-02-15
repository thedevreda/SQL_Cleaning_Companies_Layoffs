/* 
    company: clear
    location: clear
    country: clear
    industry: null
    total_laid_off: null
    percentage_laid_off: null
    date : null
    stage: null
    funds_raised_millions: null
*/

SELECT *
FROM 
    companies_laid_offs_staging_2
WHERE
    industry IS NULL;

-- Industry column

