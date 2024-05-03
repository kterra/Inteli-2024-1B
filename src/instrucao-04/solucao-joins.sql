SELECT Alunos.nome, Cursos.nome_curso
FROM Alunos
JOIN Cursos ON Alunos.curso_id = Cursos.curso_id;

SELECT Alunos.nome
FROM Alunos
LEFT JOIN Cursos ON Alunos.curso_id = Cursos.curso_id
WHERE Cursos.curso_id IS NULL;

SELECT Cursos.nome_curso, COUNT(Alunos.aluno_id) AS num_alunos
FROM Cursos
LEFT JOIN Alunos ON Cursos.curso_id = Alunos.curso_id
GROUP BY Cursos.nome_curso;
