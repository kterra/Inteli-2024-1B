select now();

SELECT *
FROM zuyd_webapp.student;

SELECT *
FROM zuyd_webapp.student
LIMIT 20;

SELECT distinct  university 
FROM zuyd_webapp.student;

SELECT *
FROM zuyd_webapp.student
where last_name like 'Silva';

SELECT *
FROM zuyd_webapp.student
where first_name  IN ('João', 'Maria', 'Pedro');

SELECT *
FROM zuyd_webapp.student
where first_name  IN ('João', 'Maria', 'Pedro') and last_name = 'Silva';

select DATE_PART('YEAR', NOW())- DATE_PART('YEAR', birthday) as AGE
FROM zuyd_webapp.student;


