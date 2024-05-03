-- Remover tabelas se já existirem
DROP TABLE IF EXISTS Alunos;
DROP TABLE IF EXISTS Cursos;

CREATE TABLE Cursos (
    curso_id SERIAL PRIMARY KEY,
    nome_curso VARCHAR(100),
    descricao TEXT
);

-- Criação da tabela Alunos com chave estrangeira
CREATE TABLE Alunos (
    aluno_id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    idade INT,
    curso_id INT REFERENCES Cursos(curso_id) -- Chave estrangeira referenciando a tabela Cursos
);


-- Inserção de dados na tabela Cursos
INSERT INTO Cursos (nome_curso, descricao) VALUES 
('Matemática', 'Curso avançado de matemática'),
('Inglês', 'Curso intermediário de inglês'),
('Programação', 'Curso básico de programação');

-- Inserção de dados na tabela Alunos
INSERT INTO Alunos (nome, idade, curso_id) VALUES 
('João', 20, 1),
('Maria', 22, 2),
('Pedro', 21, 1),
('Ana', 23, 3),
('Luiz', 19, 2);



