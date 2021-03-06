CREATE TABLE USUARIO (
	ID_USUARIO INTEGER NOT NULL AUTO_INCREMENT,
    NOME VARCHAR(100) NOT NULL,
    EMAIL VARCHAR(200) NOT NULL,
    SENHA VARCHAR(200) NOT NULL,
    CONSTRAINT PK_USUARIO PRIMARY KEY(ID_USUARIO)
);

CREATE TABLE CATEGORIA (
	ID_CATEGORIA INTEGER NOT NULL AUTO_INCREMENT,
    DESCRICAO VARCHAR(100) NOT NULL,
    TIPO CHAR NOT NULL,
    CONSTRAINT PK_CATEGORIA PRIMARY KEY(ID_CATEGORIA)
);

CREATE TABLE DESPESA (
	ID_DESPESA INTEGER NOT NULL AUTO_INCREMENT,
	ID_CATEGORIA INTEGER NOT NULL,
	ID_USUARIO INTEGER NOT NULL,
    DESCRICAO VARCHAR(200) NOT NULL,
    DATA_PRIMEIRO_VENCIMENTO DATE NOT NULL,
    DATA_CADASTRO DATE NOT NULL,
    DATA_CONCLUSAO_DESPESA DATE NULL,
    VALOR_TOTAL DATE NULL,
    DESPESA_FIXA BOOLEAN,
    QUANTIDADE_PARCELAS INTEGER NOT NULL,
    SITUACAO CHAR NOT NULL,
    CONSTRAINT PK_DESPESA PRIMARY KEY(ID_DESPESA),
    CONSTRAINT FK_DESPESA_USUARIO FOREIGN KEY(ID_USUARIO) REFERENCES USUARIO(ID_USUARIO),
    CONSTRAINT FK_DESPESA_CATEGORIA FOREIGN KEY(ID_CATEGORIA) REFERENCES CATEGORIA(ID_CATEGORIA)
);

CREATE TABLE PARCELA_DESPESA (
    ID_PARCELA INTEGER NOT NULL AUTO_INCREMENT,
    ID_DESPESA INTEGER NOT NULL,
    DATA_VENCIMENTO DATE NOT NULL,
    VALOR DOUBLE NOT NULL,
    SITUACAO CHAR NOT NULL,
    CONSTRAINT PK_PARCELA PRIMARY KEY(ID_PARCELA),
    CONSTRAINT FK_PARCELA_DESPESA FOREIGN KEY(ID_DESPESA) REFERENCES DESPESA(ID_DESPESA)
);

CREATE TABLE RECEITA (
	ID_RECEITA INTEGER NOT NULL AUTO_INCREMENT,
	ID_CATEGORIA INTEGER NOT NULL,
	ID_USUARIO INTEGER NOT NULL,
    DESCRICAO VARCHAR(200) NOT NULL,
    DATA_PRIMEIRO_RECEBIMENTO DATE NOT NULL,
    DATA_CADASTRO DATE NOT NULL,
    DATA_FINAL_RECEITA DATE NULL,
    VALOR_TOTAL DATE NULL,
    RECEITA_FIXA BOOLEAN,
    SITUACAO CHAR NOT NULL,
    QUANTIDADE_PARCELAS INTEGER NOT NULL,
    CONSTRAINT PK_RECEITA PRIMARY KEY(ID_RECEITA),
    CONSTRAINT FK_RECEITA_USUARIO FOREIGN KEY(ID_USUARIO) REFERENCES USUARIO(ID_USUARIO),
    CONSTRAINT FK_RECEITA_CATEGORIA FOREIGN KEY(ID_CATEGORIA) REFERENCES CATEGORIA(ID_CATEGORIA)
);

CREATE TABLE PARCELAS_RECEITA (
    ID_PARCELA INTEGER NOT NULL AUTO_INCREMENT,
    ID_RECEITA INTEGER NOT NULL,
    DATA_VENCIMENTO DATE NOT NULL,
    VALOR DOUBLE NOT NULL,
    SITUACAO CHAR NOT NULL,
    CONSTRAINT PK_PARCELA PRIMARY KEY(ID_PARCELA),
    CONSTRAINT FK_PARCELA_RECEITA FOREIGN KEY(ID_RECEITA) REFERENCES RECEITA(ID_RECEITA)
);