1번 문제
List each country name where the population is larger than that of 'Russia'.
인구가 러시아보다 큰 나라의 이름을 리스트로 출력하세요.

SELECT name FROM world
 WHERE population >
    (SELECT population FROM world
      WHERE name='Russia')


2번 문제
Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.
영국보다 인구당 GDP가 큰 유럽의 나라들을 출력하세요.

SELECT name FROM world
 WHERE continent = 'Europe'
   AND GDP / population > 
    (SELECT GDP / population FROM world
      WHERE name='United Kingdom')


3번 문제
List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.
아르헨티나와 오스트렐리아 둘 중 하나를 포함하는 대륙의 나라의 이름과 그 나라의 대륙을 리스트로 출력하세요. 
나라의 이름은 정렬하세요. (오름차순)

SELECT name, continent FROM world
 WHERE continent IN 
    (SELECT continent FROM world
     WHERE name IN ('Argentina', 'Australia'))
 ORDER BY name ASC


4번 문제
Which country has a population that is more than Canada but less than Poland? Show the name and the population.
폴란드보단 적지만 캐나다보단 많은 인구를 가진 나라가 있나요?
그나라의 인구와 이름을 출력하세요.

SELECT name, population FROM world
 WHERE population > (SELECT population FROM world WHERE name = 'Poland')
   AND population < (SELECT population FROM world WHERE name = 'Canada')


5번 문제
Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.
유럽의 나라의 이름과 인구를 출력하세요.
인구는 독일 인구의 퍼센트로 출력하세요.
힌트 : ROUND()로 반올림을 할 수 있으며, CONCAT()으로 문자열을 합칠 수 있습니다.

SELECT name, CONCAT(ROUND(population/(SELECT population FROM world WHERE name = 'Germany') * 100, 0), '%') AS percentage FROM world
 WHERE continent = 'Europe'