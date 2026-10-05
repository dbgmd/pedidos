SQL
CREATE DATABASE IF NOT EXISTS empresa_db;
USE empresa_db;

CREATE TABLE departamentos (
    departamento_id INT AUTO_INCREMENT,
    nome_departamento VARCHAR(50) NOT NULL,
    sigla VARCHAR(10) NOT NULL,
    CONSTRAINT pk_departamentos PRIMARY KEY (departamento_id)
);

CREATE TABLE funcionarios (
    funcionario_id INT AUTO_INCREMENT,
    departamento_id INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    salario DECIMAL(10, 2) NOT NULL,
    CONSTRAINT pk_funcionarios PRIMARY KEY (funcionario_id),
    CONSTRAINT fk_funcionarios_departamentos FOREIGN KEY (departamento_id)
        REFERENCES departamentos (departamento_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

INSERT INTO departamentos (nome_departamento, sigla) VALUES
('Recursos Humanos', 'RH'),
('Tecnologia da Informação', 'TI'),
('Financeiro', 'FIN');

INSERT INTO funcionarios (departamento_id, nome, cargo, salario) VALUES
(1, 'Carla Souza', 'Analista de RH', 4500.00),
(2, 'Lucas Mendes', 'Desenvolvedor Senior', 8500.00),
(2, 'Beatriz Lima', 'Engenheira de Dados', 9200.00),
(3, 'Roberto Alves', 'Contador', 6000.00);

SELECT 
    f.funcionario_id,
    f.nome AS funcionario,
    f.cargo,
    f.salario,
    d.nome_departamento AS departamento
FROM funcionarios f
INNER JOIN departamentos d ON f.departamento_id = d.departamento_id;
