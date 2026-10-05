
CREATE DATABASE IF NOT EXISTS meu_sistema;
USE meu_sistema;

CREATE TABLE clientes (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    data_cadastro DATE DEFAULT (CURRENT_DATE)
);

CREATE TABLE pedidos (
    pedido_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    data_pedido DATE NOT NULL,
    valor_total DECIMAL(10, 2) NOT NULL,
    CONSTRAINT fk_pedidos_clientes 
        FOREIGN KEY (cliente_id) 
        REFERENCES clientes(cliente_id)
        ON DELETE CASCADE
);

INSERT INTO clientes (nome, email) VALUES 
('Ana Silva', 'ana.silva@email.com'),
('Carlos Eduardo', 'carlos.eduardo@email.com'),
('Maria Santos', 'maria.santos@email.com');


INSERT INTO pedidos (cliente_id, data_pedido, valor_total) VALUES 
(1, '2026-10-01', 150.50),
(1, '2026-10-03', 89.90),
(2, '2026-10-04', 250.00),
(3, '2026-10-05', 45.00);


SELECT * FROM clientes;
SELECT * FROM pedidos;

SELECT 
    p.pedido_id, 
    c.nome AS cliente, 
    p.data_pedido, 
    p.valor_total
FROM pedidos p
JOIN clientes c ON p.cliente_id = c.cliente_id;