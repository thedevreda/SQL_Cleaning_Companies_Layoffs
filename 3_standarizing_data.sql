
-- Company Column
    SELECT 
        DISTINCT company
    FROM 
        companies_laid_offs_staging_2
    ORDER BY 1 DESC;

    -- Found: Spaces 
    -- TRIM: Removing Spaces
    SELECT 
        company,
        TRIM(company)
    FROM 
        companies_laid_offs_staging_2;
    -- Updating
    UPDATE companies_laid_offs_staging_2
    SET company = TRIM(company);

-- Industry Column 
    SELECT 
        DISTINCT industry
    FROM 
        companies_laid_offs_staging_2
    ORDER BY 1 DESC;

    -- Found: Null values, Null Text, CryptoCurrency Repeated
    -- Updating: CryptoCurrency, Crypto Currency, Crypto
    SELECT *
    FROM 
        companies_laid_offs_staging_2
    WHERE
        industry LIKE 'Crypto%';

    UPDATE companies_laid_offs_staging_2
    SET industry = 'Crypto'
    WHERE
        industry LIKE 'Crypto%';

    -- Updating2 : Null Text to Null Values
    UPDATE companies_laid_offs_staging_2
    SET industry = NULL
    WHERE 
        industry = 'NULL';

-- location Column
    SELECT 
        DISTINCT location
    FROM 
        companies_laid_offs_staging_2
    ORDER BY 1 DESC;
    -- Found: Malmo, Malmö, Non-U.S., Düsseldorf, Dusseldorf
    SELECT *
    FROM 
        companies_laid_offs_staging_2
    WHERE 
        location IN ('Malmo', 'Malmö', 'Non-U.S.', 'Düsseldorf', 'Dusseldorf')
    ORDER BY 1 DESC;
    -- Updating: The Values with original one
    UPDATE companies_laid_offs_staging_2
    SET location = 'Malmo'
    WHERE 
        location = 'Malmö';
    UPDATE companies_laid_offs_staging_2
    SET location = 'Non-U.S'
    WHERE 
        location = 'Non-U.S.';
    UPDATE companies_laid_offs_staging_2
    SET location = 'Dusseldorf'
    WHERE 
        location = 'Düsseldorf';

-- Country Column
    SELECT 
        DISTINCT country
    FROM 
        companies_laid_offs_staging_2
    ORDER BY 1 DESC;
    -- Found: United States., United States
    -- Updating: The Values with original one
    UPDATE companies_laid_offs_staging_2
    SET country = 'United States'
    WHERE  
        country = 'United States.';

-- Stage Column
    SELECT
        *
    FROM 
        companies_laid_offs_staging_2
    ORDER BY 1 DESC;
    -- Found: Null Text, Unknown
    -- Updating: The Values with original one
    UPDATE companies_laid_offs_staging_2
    SET stage = NULL
    WHERE  
        stage = 'NULL';

-- Date Column
    SELECT 
        DISTINCT date
    FROM 
        companies_laid_offs_staging_2
    ORDER BY 1 DESC;
    -- Found: Changing the type from TEXT to DATE, Null Text
    -- Updating: The Values with original one
    UPDATE companies_laid_offs_staging_2
    SET date = NULL
    WHERE  
        date = 'NULL';

    --Updating2: TEXT TO DATE
    SELECT 
         date,
         TO_DATE(date, 'MM/DD/YYYY')    
    FROM 
        companies_laid_offs_staging_2;
    
    UPDATE companies_laid_offs_staging_2
    SET date = TO_DATE(date, 'MM/DD/YYYY');

    -- Updating3: Change type to DATE
    ALTER TABLE companies_laid_offs_staging_2
    ALTER COLUMN date TYPE DATE USING date::DATE;

-- total_laid_off column
    -- Found: Change Null text to Null values, Change type to INT
    SELECT 
         DISTINCT total_laid_off
    FROM 
        companies_laid_offs_staging_2; 
        
    --Updating1: Null text to Null values
    UPDATE companies_laid_offs_staging_2
    SET total_laid_off = NULL
    WHERE  
        total_laid_off = 'NULL';

    --Updating2: TEXT TO INTGER
    ALTER TABLE companies_laid_offs_staging_2
    ALTER COLUMN total_laid_off TYPE INT USING total_laid_off::INT;

-- percentage_laid_off column
    -- Found: Change Null text to Null values, Change type to INT
    SELECT 
         DISTINCT percentage_laid_off
    FROM 
        companies_laid_offs_staging_2; 
        
    --Updating1: Null text to Null values
    UPDATE companies_laid_offs_staging_2
    SET percentage_laid_off = NULL
    WHERE  
        percentage_laid_off = 'NULL';
        
    --Updating2: TEXT TO INTGER
    ALTER TABLE companies_laid_offs_staging_2
    ALTER COLUMN percentage_laid_off TYPE NUMERIC USING percentage_laid_off::NUMERIC;

-- funds_raised_millions column
    -- Found: Change Null text to Null values, Change type to INT
    SELECT 
         DISTINCT funds_raised_millions
    FROM 
        companies_laid_offs_staging_2; 
        
    --Updating1: Null text to Null values
    UPDATE companies_laid_offs_staging_2
    SET funds_raised_millions = NULL
    WHERE  
        funds_raised_millions = 'NULL';
        
    --Updating2: TEXT TO INTGER
    ALTER TABLE companies_laid_offs_staging_2
    ALTER COLUMN funds_raised_millions TYPE NUMERIC USING funds_raised_millions::NUMERIC;



SELECT * 
FROM companies_laid_offs_staging_2;



