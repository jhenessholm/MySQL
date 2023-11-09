USE world;
# SQL Join exercise
#

#
# 1: Get the cities with a name starting with ping sorted by their population with the least populated cities first
SELECT * FROM city WHERE name LIKE 'ping%' ORDER BY population;
#
# 2: Get the cities with a name starting with ran sorted by their population with the most populated cities first
SELECT * FROM city WHERE name LIKE 'ran%' ORDER BY population DESC;
#
# 3: Count all cities
SELECT COUNT(*) as city_count FROM city;
#
# 4: Get the average population of all cities
SELECT AVG(population) as average_population FROM city;
#
# 5: Get the biggest population found in any of the cities
SELECT MAX(population) as biggest_population FROM city;
#
# 6: Get the smallest population found in any of the cities
SELECT MIN(population) as smallest_population FROM city;
#
# 7: Sum the population of all cities with a population below 10000
SELECT SUM(population) as total_population FROM city WHERE population < 10000;
#
# 8: Count the cities with the countrycodes MOZ and VNM
SELECT COUNT(*) as city_count FROM city WHERE countrycode IN ('MOZ', 'VNM');
#
# 9: Get individual count of cities for the countrycodes MOZ and VNM
SELECT countrycode, COUNT(*) as city_count 
FROM city 
WHERE countrycode IN ('MOZ', 'VNM') 
GROUP BY countrycode;

# 10: Get average population of cities in MOZ and VNM
SELECT countrycode, AVG(population) as average_population 
FROM city 
WHERE countrycode IN ('MOZ', 'VNM') GROUP BY countrycode;
#
# 11: Get the countrycodes with more than 200 cities
SELECT countrycode, COUNT(*) as city_count 
FROM city GROUP BY countrycode 
HAVING city_count > 200;

# 12: Get the countrycodes with more than 200 cities ordered by city count
SELECT countrycode, COUNT(*) as city_count 
FROM city GROUP BY countrycode 
HAVING city_count > 200 ORDER BY city_count;

# 13: What language(s) is spoken in the city with a population between 400 and 500 ?
SELECT DISTINCT c1.Language
 FROM city c 
 JOIN countrylanguage c1 ON c.CountryCode = c1.CountryCode 
 WHERE c.Population BETWEEN 400 AND 500;

# 14: What are the name(s) of the cities with a population between 500 and 600 people and the language(s) spoken in them
SELECT c.Name AS CityName, c1.Language 
FROM city c 
JOIN countrylanguage c1 ON c.CountryCode = c1.CountryCode 
WHERE c.Population BETWEEN 500 AND 600;

# 15: What names of the cities are in the same country as the city with a population of 122199 (including the that city itself)
SELECT name 
FROM city 
WHERE countrycode = (SELECT countrycode 
FROM city WHERE population = 122199);

# 16: What names of the cities are in the same country as the city with a population of 122199 (excluding the that city itself)
SELECT name 
FROM city 
WHERE countrycode = (SELECT countrycode 
FROM city 
WHERE population = 122199) AND population != 122199;

# 17: What are the city names in the country where Luanda is capital?
SELECT c.Name AS CityName 
FROM city c 
JOIN country cn ON c.ID = cn.Capital 
WHERE cn.Code = 'Luanda';

# 18: What are the names of the capital cities in countries in the same region as the city named Yaren
SELECT c1.Name AS CapitalCity 
FROM country c1
JOIN city c2 ON c1.Code = c2.CountryCode 
WHERE C2.Name = 'Yaren';

# 19: What unique languages are spoken in the countries in the same region as the city named Riga
SELECT DISTINCT c1.Language 
FROM countrylanguage c1 
JOIN country c ON c1.CountryCode = c.Code 
JOIN city ci ON c.Capital = ci.ID 
WHERE ci.NAME = 'Riga';

# 20: Get the name of the most populous city
SELECT name
FROM city
ORDER BY population DESC
LIMIT 1;





