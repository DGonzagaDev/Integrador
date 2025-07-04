create database Music;
use music;
CREATE TABLE plano_assinatura (
    cod_plano INT PRIMARY KEY AUTO_INCREMENT,
    nome_plano VARCHAR(50),
    valor_plano DECIMAL(7,2)
);

CREATE TABLE perfil_usuario (
    cod_perfil INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(100)
);

CREATE TABLE usuario (
    cod_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome_usuario VARCHAR(50),
    email VARCHAR(100),
    senha VARCHAR(100),
    data_nasc DATE,
    sexo CHAR(1),
    usuLogin VARCHAR(50),
    cod_perfil INT,
    FOREIGN KEY (cod_perfil) REFERENCES perfil_usuario(cod_perfil)
);

CREATE TABLE assinatura_plano (
    cod_assinatura INT PRIMARY KEY AUTO_INCREMENT,
    data_assinatura DATE,
    preco_assinatura DECIMAL(7,2),
    tipo_assinatura VARCHAR(50),
    cod_usuario INT,
    cod_plano INT,
    FOREIGN KEY (cod_usuario) REFERENCES usuario(cod_usuario),
    FOREIGN KEY (cod_plano) REFERENCES plano_assinatura(cod_plano)
);

CREATE TABLE playlist (
    cod_playlist INT PRIMARY KEY AUTO_INCREMENT,
    nome_playlist VARCHAR(50),
    data_criacao DATE,
    cod_usuario INT,
    FOREIGN KEY (cod_usuario) REFERENCES usuario(cod_usuario)
);

CREATE TABLE genero_musical (
    cod_genero INT PRIMARY KEY AUTO_INCREMENT,
    nome_genero VARCHAR(50)
);

CREATE TABLE artista (
    id_artista INT PRIMARY KEY AUTO_INCREMENT,
    nome_artista VARCHAR(50),
    data_nasc DATE,
    imagem_artista VARCHAR(255),
    link_redesSociais VARCHAR(255)
);

CREATE TABLE album (
    cod_album INT PRIMARY KEY AUTO_INCREMENT,
    titulo_album VARCHAR(50),
    data_lancamento DATE,
    num_faixas INT,
    capa_album VARCHAR(255),
    id_artista INT,
    FOREIGN KEY (id_artista) REFERENCES artista(id_artista)
);

CREATE TABLE musica (
    cod_musica INT PRIMARY KEY AUTO_INCREMENT,
    nome_musica VARCHAR(100),
    duracao TIME,
    lancamento DATE,
    id_artista INT,
    cod_genero INT,
    cod_album INT,
    FOREIGN KEY (id_artista) REFERENCES artista(id_artista),
    FOREIGN KEY (cod_genero) REFERENCES genero_musical(cod_genero),
    FOREIGN KEY (cod_album) REFERENCES album(cod_album)
);


CREATE TABLE ouvir (
    cod_usuario INT,
    cod_musica INT,
    data_ouviu DATETIME,
    PRIMARY KEY (cod_usuario, cod_musica, data_ouviu),
    FOREIGN KEY (cod_usuario) REFERENCES usuario(cod_usuario),
    FOREIGN KEY (cod_musica) REFERENCES musica(cod_musica)
);

CREATE TABLE avaliar (
    cod_usuario INT,
    cod_musica INT,
    data_avaliou DATE,
    nota_avaliacao INT,
    PRIMARY KEY (cod_usuario, cod_musica, data_avaliou),
    FOREIGN KEY (cod_usuario) REFERENCES usuario(cod_usuario),
    FOREIGN KEY (cod_musica) REFERENCES musica(cod_musica)
);

CREATE TABLE musica_playlist (
    cod_musica INT,
    cod_playlist INT,
    PRIMARY KEY (cod_musica, cod_playlist),
    FOREIGN KEY (cod_musica) REFERENCES musica(cod_musica),
    FOREIGN KEY (cod_playlist) REFERENCES playlist(cod_playlist)
);
