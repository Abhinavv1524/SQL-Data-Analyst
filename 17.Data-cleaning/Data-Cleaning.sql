-- Data Cleaning

SELECT *
FROM layoffs;

-- 1. Remove Duplicate Data
-- 2. Standardize the Data [Spelling errors]
-- 3. Null values or Blank values
-- 4. Remove rows that are not required 

CREATE TABLE layoff_staging
LIKE layoffs;

INSERT layoff_staging
SELECT * 
FROM layoffs;

SELECT *,
ROW_NUMBER () 
OVER(PARTITION BY company,location,industry,total_laid_off,'date') AS row_num
FROM layoff_staging;

WITH duplicate_cte AS
(
SELECT *,
ROW_NUMBER () 
OVER(PARTITION BY company, location, industry,total_laid_off, percentage_laid_off, 
`date`, stage, country, funds_raised_millions) AS row_num
FROM layoff_staging
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1;

-- CHECK THE DATA
/*SELECT * 
FROM layoff_staging
WHERE company = "casper";*/

CREATE TABLE `layoff_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT * 
FROM layoff_staging2;

INSERT INTO layoff_staging2
SELECT *,
ROW_NUMBER () 
OVER(PARTITION BY company, location, industry,total_laid_off, percentage_laid_off, 
`date`, stage, country, funds_raised_millions) AS row_num
FROM layoff_staging;

SELECT * 
FROM layoff_staging2
WHERE row_num > 1;

DELETE 
FROM layoff_staging2
WHERE row_num > 1;

SELECT * 
FROM layoff_staging2;

-- Standardising data
-- compnay
SELECT DISTINCT(TRIM(company))
FROM layoff_staging2;

UPDATE layoff_staging2
SET company = TRIM(company);

-- location

SELECT DISTINCT location-- 
FROM layoff_staging2
ORDER BY 1;

-- industry

SELECT DISTINCT industry
FROM layoff_staging2
ORDER BY 1;

SELECT *
FROM layoff_staging2
WHERE industry LIKE '%Crypto%';

UPDATE layoff_staging2
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';

SELECT *
FROM layoff_staging2
WHERE industry LIKE '%Crypto%';

-- Country
SELECT * 
FROM layoff_staging2;

SELECT DISTINCT country
from layoff_staging2 
ORDER BY 1;

UPDATE layoff_staging2
SET country = TRIM(TRAILING "." FROM country)
WHERE country LIKE "United States%";

UPDATE layoff_staging2
SET country = "United States"
WHERE country LIKE "United States%";

-- Date
SELECT `date` ,
STR_TO_DATE(`date`,'%m/%d/%Y')
FROM layoff_staging2;

UPDATE layoff_staging2
SET `date` = STR_TO_DATE(`date`,'%m/%d/%Y');

ALTER TABLE layoff_staging2
MODIFY COLUMN `date` DATE;



-- Null or Blank values

SELECT *
FROM layoff_staging2
WHERE total_laid_off IS NULL 
AND percentage_laid_off IS NULL;

SELECT *
FROM layoff_staging2
WHERE industry IS NULL 
OR industry = "";
