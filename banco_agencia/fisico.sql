-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE Pacote (
id_pacotes INTEGER PRIMARY KEY,
nome VARCHAR(50),
preco DECIMAL(20),
descricao VARCHAR(80),
id_destino INTEGER,
id_reserva INTEGER
)

CREATE TABLE Reservas (
id_reserva INTEGER PRIMARY KEY,
id_usuario INTEGER,
id_pacote INTEGER,
id_passagem INTEGER,
id_hotel INTEGER,
data_reserva DATETIME,
status VARCHAR(20)
)

CREATE TABLE Promoção (
id_promocao INTEGER PRIMARY KEY,
descricao VARCHAR(80),
desconto DECIMAL(20),
data_inicio DATETIME,
data_fim DATETIME,
id_destino INTEGER
)

CREATE TABLE Destino (
id_destino INTEGER PRIMARY KEY,
nome VARCHAR(50),
lugar VARCHAR(50),
descricao VARCHAR(80),
id_promocao INTEGER,
FOREIGN KEY(id_promocao) REFERENCES Promoção (id_promocao)
)

CREATE TABLE Hotel (
id_hotel INTEGER PRIMARY KEY,
nome VARCHAR(50),
cidade VARCHAR(50),
id_destino INTEGER,
estrelas INTEGER,
preco_diaria DECIMAL(20),
id_reserva INTEGER,
FOREIGN KEY(id_reserva) REFERENCES Reservas (id_reserva)
)

CREATE TABLE Passagem (
data_retorno DATETIME,
id_passagem INTEGER PRIMARY KEY,
origem VARCHAR(20),
destino VARCHAR(30),
id_destino VARCHAR(20),
data_partida DATETIME,
preco DECIMAL(20),
id_reserva INTEGER,
FOREIGN KEY(id_reserva) REFERENCES Reservas (id_reserva)
)

CREATE TABLE Usuario (
nome VARCHAR(50),
telefone NUMERIC(10),
id_usuario INTEGER PRIMARY KEY,
endereço VARCHAR(100),
email VARCHAR(50),
senha VARCHAR(10),
id_reserva INTEGER,
FOREIGN KEY(id_reserva) REFERENCES Reservas (id_reserva)
)

CREATE TABLE Pagamento (
id_pagamento INTEGER PRIMARY KEY,
id_reserva INTEGER,
valor DECIMAL(10),
data_pagamento DATETIME,
forma_pagamento VARCHAR(50)
)

CREATE TABLE com (
id_destino INTEGER,
id_pacotes INTEGER,
FOREIGN KEY(id_destino) REFERENCES Destino (id_destino),
FOREIGN KEY(id_pacotes) REFERENCES Pacote (id_pacotes)
)

CREATE TABLE para (
id_destino INTEGER,
id_passagem INTEGER,
FOREIGN KEY(id_destino) REFERENCES Destino (id_destino),
FOREIGN KEY(id_passagem) REFERENCES Passagem (id_passagem)
)

CREATE TABLE em (
id_destino INTEGER,
id_hotel INTEGER,
FOREIGN KEY(id_destino) REFERENCES Destino (id_destino),
FOREIGN KEY(id_hotel) REFERENCES Hotel (id_hotel)
)

CREATE TABLE forma_de (
id_pagamento INTEGER,
id_reserva INTEGER,
FOREIGN KEY(id_pagamento) REFERENCES Pagamento (id_pagamento),
FOREIGN KEY(id_reserva) REFERENCES Reservas (id_reserva)
)

ALTER TABLE Pacote ADD FOREIGN KEY(id_reserva) REFERENCES Reservas (id_reserva)
