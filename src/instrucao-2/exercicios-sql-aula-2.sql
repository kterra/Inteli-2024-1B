SELECT *
FROM zuyd_webapp.student
LIMIT 10;

SELECT *
FROM zuyd_webapp.student
WHERE country_of_birth = 'Brasil'


SELECT distinct university 
FROM zuyd_webapp.student
where country_of_birth = 'Brasil'
order by university ;

SELECT DISTINCT country_of_birth 
FROM zuyd_webapp.student;

SELECT MIN(birthday) as data_de_nascimento
FROM zuyd_webapp.student
where country_of_birth = 'Mexico';
