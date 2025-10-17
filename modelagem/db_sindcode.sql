CREATE DATABASE IF NOT EXISTS sindcode;
USE sindcode;

CREATE TABLE IF NOT EXISTS endereco(
	id_endereco INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	cep VARCHAR(15) NOT NULL,
    logradouro VARCHAR(100) NOT NULL,
    complemento VARCHAR(100),
    numero VARCHAR(20),
    cidade VARCHAR(80) NOT NULL,
    bairro VARCHAR(80) NOT NULL,
    estado VARCHAR(80) NOT NULL,
    uf VARCHAR(2) NOT NULL
);

CREATE TABLE IF NOT EXISTS autor(
	id_autor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(80) NOT NULL,
    perfil TEXT	NOT NULL,
    fk_endereco INT NOT NULL,
    CONSTRAINT fk_autor_endereco FOREIGN KEY(fk_endereco) REFERENCES endereco(id_endereco)
);

CREATE TABLE IF NOT EXISTS categoria(
	id_categoria INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(80) NOT NULL
);

CREATE TABLE IF NOT EXISTS noticia(
	id_noticia INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    conteudo TEXT NOT NULL,
    data_publicacao DATE NOT NULL,
    url_imagem_capa VARCHAR(100),
    destaque ENUM('0','1','2','3','4') NOT NULL DEFAULT '0',
    fk_autor INT NOT NULL,
    fk_categoria INT NOT NULL,
    CONSTRAINT fk_noticia_autor FOREIGN KEY(fk_autor) REFERENCES autor(id_autor),
    CONSTRAINT fk_noticia_categoria FOREIGN KEY(fk_categoria) REFERENCES categoria(id_categoria)
);