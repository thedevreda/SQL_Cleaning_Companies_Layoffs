/* 
-- Clear
    company: clear
    location: clear
    country: clear

-- Not Clear
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
    industry IS NULL ;

-- Industry column
    /*
    After running the command above we found 4 rows without industry section
        The code below show us the AirBnb company and we found that on have Travel 
        Industry and other not, we will search for every undustry and then joining them 
    */

    SELECT *
    FROM 
        companies_laid_offs_staging_2
    WHERE
        company = 'Airbnb';
    /* Now we will start by joining the null values with real one */

    SELECT 
        table1.industry,
        table2.industry
    FROM    
        companies_laid_offs_staging_2 as table1
    INNER JOIN companies_laid_offs_staging_2 as table2
        ON table1.company = table2.company -- joining by company incase we have another Airbnb in another location so we will not affect 
    WHERE
        table1.company = table2.company -- SELECTING ONLY BY COMPANY incase we have another Airbnb in another location so we will not affect
        AND table1.industry IS NULL -- SELECTING NULL AND NOT NULL
        AND table2.industry IS NOT NULL;

    /* Now Updating.......! */

    UPDATE companies_laid_offs_staging_2 AS table1
    SET industry = table2.industry -- setting or JOINING that only the industry will change, industry of table1 
    FROM    
        companies_laid_offs_staging_2 AS table2
    WHERE  
        table1.company = table2.company -- SELECTING ONLY BY COMPANY incase we have another Airbnb in another location so we will not affect
        AND table1.industry IS NULL -- SELECTING NULL AND NOT NULL
        AND table2.industry IS NOT NULL;


    /*
    We will only have Bally's interactive with no something to compare withit so instead of that 
        even we leave it as Null 
        or searching on the internet and and update it manualy : Gambling, Entertainment
    */
    UPDATE companies_laid_offs_staging_2
    SET industry = 'Gambling'
    WHERE   
        company LIKE 'Bally%' ;

-- Stage Column
    /*
    After searching for these companies that mentioned below we havn't found
    nothing to compare with
    */
    SELECT *
    FROM 
        companies_laid_offs_staging_2
    WHERE
        company IN('Verily','Zapp','Advata','Relevel','Gatherly','Spreetail') AND 
        (stage IS NOT NULL OR stage IS NULL );

-- Date Column
    /*
    After searching for these companies that mentioned below we havn't found
    nothing to compare with
    */
    SELECT *
    FROM
        companies_laid_offs_staging_2
    WHERE
        company = 'Blackbaud' 
        AND (
            date IS NULL
            OR date IS NOT NULL
        );
    

