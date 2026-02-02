use world;
select * from city;
select * from country;
select * from countrylanguage;

-- # Q1  Count how many cities are there in each country?
SELECT 
    c.Name AS CountryName,
    COUNT(ci.ID) AS NumberOfCities
FROM country c JOIN city ci ON c.Code = ci.CountryCode
GROUP BY c.Name;

-- Q2  Display all continents having more than 30 countries.
SELECT 
    Continent,
    COUNT(*) AS NumberOfCountries
FROM country
GROUP BY Continent
HAVING COUNT(*) > 30;

-- # Q3  List regions whose total population exceeds 200 million.
SELECT 
    Region,
    SUM(Population) AS TotalPopulation
FROM country
GROUP BY Region
HAVING SUM(Population) > 200000000;

-- # Q4  Find the top 5 continents by average GNP per country. 
SELECT 
    Continent,
    AVG(GNP) AS AvgGNP
FROM country
WHERE GNP IS NOT NULL
GROUP BY Continent
ORDER BY AvgGNP DESC
LIMIT 5;

-- # Q5 Find the total number of official languages spoken in each continent.
SELECT 
    c.Continent,
    COUNT(DISTINCT cl.Language) AS OfficialLanguagesCount
FROM country c
JOIN countrylanguage cl
    ON c.Code = cl.CountryCode
WHERE cl.IsOfficial = 'T'
GROUP BY c.Continent;

-- # Q6 Find the maximum and minimum GNP for each continent
SELECT 
    Continent,
    MAX(GNP) AS MaxGNP,
    MIN(GNP) AS MinGNP
FROM country
WHERE GNP IS NOT NULL
GROUP BY Continent;

-- # Q7 Find the country with the highest average city population.
SELECT 
    c.Name AS CountryName,
    AVG(ci.Population) AS AvgCityPopulation
FROM country c
JOIN city ci
    ON c.Code = ci.CountryCode
GROUP BY c.Name
ORDER BY AvgCityPopulation DESC
LIMIT 1;

-- # Q8  List continents where the average city population is greater than 200,000
SELECT 
    c.Continent,
    AVG(ci.Population) AS AvgCityPopulation
FROM country c
JOIN city ci
    ON c.Code = ci.CountryCode
GROUP BY c.Continent
HAVING AVG(ci.Population) > 200000;

-- # Q9 Find the total population and average life expectancy for each continent, ordered by average life expectancy descending.
SELECT 
    Continent,
    SUM(Population) AS TotalPopulation,
    AVG(LifeExpectancy) AS AvgLifeExpectancy
FROM country
WHERE LifeExpectancy IS NOT NULL
GROUP BY Continent
ORDER BY AvgLifeExpectancy DESC;

-- Q10  Find the top 3 continents with the highest average life expectancy, but only include those where the total population is over 200 million.
SELECT 
    Continent,
    AVG(LifeExpectancy) AS AvgLifeExpectancy,
    SUM(Population) AS TotalPopulation
FROM country
WHERE LifeExpectancy IS NOT NULL
GROUP BY Continent
HAVING SUM(Population) > 200000000
ORDER BY AvgLifeExpectancy DESC
LIMIT 3;
