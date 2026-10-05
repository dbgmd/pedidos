SQL
CREATE DATABASE IF NOT EXISTS petshop_db;
USE petshop_db;

CREATE TABLE tutores (
    tutor_id INT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    CONSTRAINT pk_tutores PRIMARY KEY (tutor_id)
);

CREATE TABLE pets (
    pet_id INT AUTO_INCREMENT,
    tutor_id INT NOT NULL,
    nome_pet VARCHAR(50) NOT NULL,
    especie VARCHAR(30) NOT NULL,
    raca VARCHAR(30),
    CONSTRAINT pk_pets PRIMARY KEY (pet_id),
    CONSTRAINT fk_pets_tutores FOREIGN KEY (tutor_id)
        REFERENCES tutores (tutor_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

INSERT INTO tutores (nome, telefone) VALUES
('Fernanda Costa', '(11) 98888-1111'),
('Marcelo Ribeiro', '(11) 97777-2222'),
('Camila Rodrigues', '(11) 96666-3333');

INSERT INTO pets (tutor_id, nome_pet, especie, raca) VALUES
(1, 'Thor', 'Cão', 'Golden Retriever'),
(1, 'Mel', 'Gato', 'Persa'),
(2, 'Bob', 'Cão', 'Vira-lata'),
(3, 'Luna', 'Gato', 'Siamês');

SELECT 
    p.pet_id,
    p.nome_pet,
    p.especie,
    p.raca,
    t.nome AS nome_tutor,
    t.telefone AS contato_tutor
FROM pets p
INNER JOIN tutores t ON p.tutor_id = t.tutor_id;
