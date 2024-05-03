-- Criação da tabela
CREATE TABLE Usuario (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50),
    idade INTEGER
);

-- Inserção de dados
INSERT INTO Usuario (nome, idade) VALUES 
('João', 25),
('Maria', 30),
('Pedro', 28);

-- Leitura de dados
SELECT * FROM Usuario;

-- Deleta alguns dados
DELETE FROM Usuario WHERE nome = 'Pedro';

-- Adiciona uma nova coluna
ALTER TABLE Usuario
ADD COLUMN sobrenome VARCHAR(50);

-- Inserção de dados na nova coluna
UPDATE Usuario SET sobrenome = 'Silva' WHERE nome = 'João';
UPDATE Usuario SET sobrenome = 'Santos' WHERE nome = 'Maria';

-- Leitura de dados atualizados
SELECT * FROM Usuario;

-- Exclusão da tabela
DROP TABLE IF EXISTS Usuario;
