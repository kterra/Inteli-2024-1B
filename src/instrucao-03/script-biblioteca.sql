-- Criação da tabela Livro
CREATE TABLE Livro (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(100),
    editora VARCHAR(100),
    ano_publicacao INTEGER
);

-- Criação da tabela Autor
CREATE TABLE Autor (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    nacionalidade VARCHAR(50)
);

-- Criação da tabela Usuario
CREATE TABLE Usuario (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    telefone VARCHAR(20)
);

-- Criação da tabela Empréstimo
CREATE TABLE Emprestimo (
    id SERIAL PRIMARY KEY,
    data_inicio DATE,
    data_retorno_prevista DATE,
    id_livro INTEGER,
    id_usuario INTEGER,
    FOREIGN KEY (id_livro) REFERENCES Livro(id),
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id)
);

-- Tabela de associação entre Livro e Autor
CREATE TABLE AutorLivro (
    id_livro INTEGER,
    id_autor INTEGER,
    PRIMARY KEY (id_livro, id_autor),
    FOREIGN KEY (id_livro) REFERENCES Livro(id),
    FOREIGN KEY (id_autor) REFERENCES Autor(id)
);
