-- Create company_laid_offs table 
CREATE TABLE public.company_laid_offs
(

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
    funds_raised_millions TEXT
);

DROP TABLE company_laid_offs;
-- Set ownership of the tables to the postgres user
ALTER TABLE public.company_laid_offs OWNER to postgres;
