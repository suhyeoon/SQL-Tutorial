6번 문제
Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values)
유럽의 모든 나라보다 GDP가 큰 나라의 이름을 출력하세요. (어떤 나라는 GDP 값이 NULL일 수도 있습니다.)

SELECT name FROM world
WHERE gdp > 
(SELECT gdp FROM world 
WHERE continent = 'Europe' 
ORDER BY gdp DESC LIMIT 1)


7번 문제
Find the largest country (by area) in each continent, show the continent, the name and the area
대륙들마다의 가장 큰 나라(area로 비교했을 때)를 찾고, 그나라의 대륙과, 이름, 면적을 출력하세요.

>> world 테이블을 x라는 별칭을 붙인 것

SELECT continent, name, area FROM world x
WHERE area >= ALL
(SELECT area FROM world y
WHERE y.continent=x.continent AND area > 0)
  
>> 동일한 예제
SELECT continent, name, area FROM world
WHERE area IN (SELECT MAX(area) FROM world GROUP BY continent)


8번 문제
List each continent and the name of the country that comes first alphabetically.
알파벳순으로 첫번째에 오는 나라의 대륙과 이름을 출력하세요.

SELECT continent, name FROM world
GROUP BY continent
 
위의 비상관 쿼리말고 아래의 상관 쿼리로 구해줄 수도 있다.
SELECT continent, name FROM world x
WHERE name = (SELECT name FROM world y
WHERE x.continent = y.continent ORDER BY name LIMIT 1)


9번 문제
Find the continents where all countries have a population <= 25000000. Then find the names of the countries associated with these continents. Show name, continent and population.
모든 나라가 인구수 25,000,000명보다 작은 대륙을 찾아서, 대륙에 대한 나라들의 이름들을 찾아서, 그나라의 이름과 대륙, 인구를 출력하세요.

SELECT name, continent, population FROM world x
WHERE 25000000 >= 
ALL(SELECT population FROM world y
WHERE x.continent = y.continent)


10번 문제
Some countries have populations more than three times that of any of their neighbours (in the same continent). Give the countries and continents.
어떤 나라들은 같은 대륙의 이웃나라보다 3배이상의 인구를 가지고 있습니다. 
그 나라와 대륙을 출력하세요.

SELECT name, continent FROM world x
WHERE population / 3 > 
ALL(SELECT population FROM world y
WHERE x.continent = y.continent
AND x.name != y.name)
