CREATE TABLE Autor (
IdAutor INT IDENTITY,
NomeAutor VARCHAR(50) NOT NULL,
SobrenomeAutor VARCHAR(60) NOT NULL,
CONSTRAINT pk_id_autor PRIMARY KEY(IdAutor)
);

CREATE TABLE Editora (
IdEditora INT PRIMARY KEY IDENTITY,
NomeEditora VARCHAR(50) NOT NULL
);

CREATE TABLE Assunto (
IdAssunto INT PRIMARY KEY IDENTITY,
NomeAssunto VARCHAR(25) NOT NULL
);

CREATE TABLE Livro (
IdLivro INT NOT NULL PRIMARY KEY IDENTITY(100,1),
NomeLivro VARCHAR(70) NOT NULL,
ISBN13 CHAR(13) UNIQUE NOT NULL,
DataPub DATE,
PrecoLivro MONEY NOT NULL,
NumeroPaginas INT NOT NULL,
IdEditora INT NOT NULL,
IdAssunto INT NOT NULL,
CONSTRAINT fk_id_editora FOREIGN KEY(IdEditora) REFERENCES Editora(IdEditora) ON DELETE CASCADE,
CONSTRAINT fk_id_assunto FOREIGN KEY(IdAssunto) REFERENCES Assunto(IdAssunto) ON DELETE CASCADE,
CONSTRAINT verifica_preco CHECK(PrecoLivro >= 0)
);

CREATE TABLE LivroAutor (
IdLivro INT NOT NULL,
IdAutor INT NOT NULL,
CONSTRAINT fk_id_livros FOREIGN KEY(IdLivro) REFERENCES Livro(IdLivro),
CONSTRAINT fk_id_autores FOREIGN KEY(IdAutor) REFERENCES Autor(IdAutor),
CONSTRAINT pk_livro_autor PRIMARY KEY(IdLivro, IdAutor)
);

-- Verificar tabelas do database Biblioteca
SELECT name FROM Biblioteca.sys.tables;