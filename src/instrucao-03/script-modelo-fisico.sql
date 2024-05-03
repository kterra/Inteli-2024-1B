-- ---
-- Table 'Turma'
-- ---

DROP TABLE IF EXISTS Turma;

CREATE TABLE Turma (
  id SERIAL PRIMARY KEY,
  capacidade INTEGER
);

-- ---
-- Table 'Professor'
-- ---

DROP TABLE IF EXISTS Professor;

CREATE TABLE Professor (
  id SERIAL PRIMARY KEY,
  nome TEXT NOT NULL DEFAULT 'NULL',
  telefone VARCHAR(15)
);

-- ---
-- Table 'Telefone'
-- ---

DROP TABLE IF EXISTS Telefone;

CREATE TABLE Telefone (
  id_telefone SERIAL PRIMARY KEY,
  DDD CHAR(2) NOT NULL DEFAULT 'NULL',
  numero VARCHAR(10) NOT NULL DEFAULT 'NULL',
  id_professor INTEGER NOT NULL,
  FOREIGN KEY (id_professor) REFERENCES Professor(id)
);

-- ---
-- Table 'Turma_Professor'
-- ---

DROP TABLE IF EXISTS Turma_Professor;

CREATE TABLE Turma_Professor (
  id SERIAL PRIMARY KEY,
  id_turma INTEGER NOT NULL,
  id_professor INTEGER NOT NULL,
  FOREIGN KEY (id_turma) REFERENCES Turma(id),
  FOREIGN KEY (id_professor) REFERENCES Professor(id)
);

-- Inserir dados na tabela 'Turma'
INSERT INTO Turma (capacidade) VALUES
(20),
(15),
(25),
(18),
(22);

-- Inserir dados na tabela 'Professor'
INSERT INTO Professor (nome, telefone) VALUES
('João Silva', '555-1234'),
('Maria Santos', '555-5678'),
('Carlos Oliveira', '555-9101'),
('Ana Souza', '555-2468'),
('Pedro Costa', '555-3698');

-- Inserir dados na tabela 'Telefone'
INSERT INTO Telefone (DDD, numero, id_professor) VALUES
('11', '999999999', 1),
('21', '888888888', 2),
('31', '777777777', 3),
('41', '666666666', 4),
('51', '555555555', 5);

-- Inserir dados na tabela 'Turma_Professor'
INSERT INTO Turma_Professor (id_turma, id_professor) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);
