PRAGMA foreign_keys = ON;

CREATE TABLE participante (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    telefone TEXT 
);

CREATE TABLE evento (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    descricao TEXT,
    local TEXT NOT NULL,
    data TEXT NOT NULL
);

CREATE TABLE inscricao (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_evento INTEGER NOT NULL,
    id_participante INTEGER NOT NULL,
    data_inscricao TEXT,
    status TEXT,
    FOREIGN KEY (id_evento) REFERENCES evento(id) ON DELETE CASCADE,
    FOREIGN KEY (id_participante) REFERENCES participante(id) ON DELETE CASCADE,
    UNIQUE (id_evento, id_participante)
);

CREATE TABLE pagamento (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_inscricao INTEGER NOT NULL UNIQUE,
    valor REAL,
    data_pagamento TEXT,
    status TEXT,
    FOREIGN KEY (id_inscricao) REFERENCES inscricao(id) ON DELETE CASCADE
);

INSERT INTO participante (nome, email, telefone) VALUES
('Alice Silva', 'alice@email.com', '1199999999'),
('Bruno Costa', 'bruno@email.com', '21999999999'),
('Carla Dias', 'carla@email.com', '31999999999');

INSERT INTO evento (nome, descricao, local, data) VALUES
('Seminário de Tecnologia', 'Evento sobre novas tecnologias', 'São Paulo', '2025-10-10'),
('Workshop de Inovação', 'Dinâmicas e práticas inovadoras', 'Rio de Janeiro', '2025-11-05');

INSERT INTO inscricao (id_evento, id_participante, data_inscricao, status) VALUES
(1, 1, '2025-09-01', 'confirmado'),
(1, 2, '2025-09-02', 'confirmado'),
(2, 3, '2025-09-03', 'pendente'),
(2, 1, '2025-09-04', 'confirmado');

INSERT INTO pagamento (id_inscricao, valor, data_pagamento, status) VALUES
(1, 100.00, '2025-09-01', 'pago'),
(2, 100.00, '2025-09-02', 'pago'),
(3, 150.00, '2025-09-03', 'pendente'),
(4, 150.00, '2025-09-04', 'pago');