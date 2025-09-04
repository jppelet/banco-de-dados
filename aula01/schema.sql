-- Ativa foreign keys no inicio do script

PRAGMA foreign_keys = NO;


CREATE TABLE usuario(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    senha TEXT NOT NULL 
);

CREATE TABLE cliente(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    telefone TEXT,
    usuario_id INTEGER NOT NULL UNIQUE,
    FOREIGN KEY (usuario_id) REFERENCES usuario(id) ON DELETE CASCADE
);

CREATE TABLE produto(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    descricao TEXT,
    preco REAL NOT NULL CHECK (preco >= 0)
);

CREATE TABLE venda(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    data TEXT NOT NULL,
    usuario_id INTEGER NOT NULL,
    cliente_id INTEGER NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuario(id) ON DELETE SET NULL,
    FOREIGN KEY (cliente_id) REFERENCES cliente(id) ON DELETE SET NULL
);

CREATE TABLE produto_venda(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    venda_id INTEGER NOT NULL,
    produto_id INTEGER NOT NULL,
    quantidade INTEGER NOT NULL CHECK (quantidade > 0),
    preco_unitario REAL NOT NULL CHECK (preco_unitario >= 0),
    FOREIGN KEY (venda_id) REFERENCES venda(id) ON DELETE CASCADE,
    FOREIGN KEY (produto_id) REFERENCES produto(id) ON DELETE CASCADE
);

INSERT INTO usuario (
    nome, 
    email, 
    senha
)
VALUES 
    ('João', 'joao@email.com', 'botafogo123'),
    ('Rassi', 'rassi@email.com', 'patospizzas'),
    ('Lucas', 'lucas@email.com', 'dededovasco'),
    ('Flavio', 'flavio@email.com', 'camilahamburguerps5');


INSERT INTO cliente (nome, telefone, usuario_id) 
VALUES
    ('João Pedro', '99999-9999', 1),
    ('Rassi', '88888-9999', 2),
    ('Lucas', '77777-9999', 3),
    ('Flavio', '66666-9999', 4);

INSERT INTO produto (nome, descricao, preco)
VALUES
    ('Arroz 5kg', 'Fininho', 10.20),
    ('Feijão Preto 1kg', 'Tipo 1, selecionado', 7.50),
    ('Macarrão Espaguete 500g', 'Grano duro', 4.30),
    ('Óleo de Soja 900ml', 'Refinado', 6.80);


INSERT INTO venda(data, usuario_id, cliente_id) 
VALUES
    ('2025-08-27', 1, 1),
    ('2025-08-26', 2, 2),
    ('2025-08-25', 3, 3);

INSERT INTO produto_venda(venda_id, produto_id, quantidade, preco_unitario)
VALUES
    (1, 1, 2, 10.20),
    (1, 2, 1, 7.50),
    (2, 3, 3, 4.30),    
    (3, 4, 1, 6.80);