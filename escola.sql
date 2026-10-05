SQL
CREATE DATABASE IF NOT EXISTS escola_db;
USE escola_db;

CREATE TABLE turmas (
    turma_id INT AUTO_INCREMENT,
    nome_turma VARCHAR(50) NOT NULL,
    ano_letivo INT NOT NULL,
    turno VARCHAR(20) NOT NULL,
    CONSTRAINT pk_turmas PRIMARY KEY (turma_id)
);

CREATE TABLE alunos (
    aluno_id INT AUTO_INCREMENT,
    turma_id INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    matricula VARCHAR(20) NOT NULL,
    CONSTRAINT pk_alunos PRIMARY KEY (aluno_id),
    CONSTRAINT uc_aluno_matricula UNIQUE (matricula),
    CONSTRAINT fk_alunos_turmas FOREIGN KEY (turma_id)
        REFERENCES turmas (turma_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

INSERT INTO turmas (nome_turma, ano_letivo, turno) VALUES
('1º Ano A', 2026, 'Manhã'),
('2º Ano B', 2026, 'Tarde'),
('3º Ano C', 2026, 'Manhã');

INSERT INTO alunos (turma_id, nome, data_nascimento, matricula) VALUES
(1, 'Gabriel Rocha', '2018-04-12', 'MAT202601'),
(1, 'Sofia Martins', '2018-08-25', 'MAT202602'),
(2, 'Enzo Gabriel', '2017-01-30', 'MAT202603'),
(3, 'Juliana Paes', '2016-11-05', 'MAT202604');

SELECT 
    a.aluno_id,
    a.nome AS aluno,
    a.matricula,
    t.nome_turma,
    t.turno
FROM alunos a
INNER JOIN turmas t ON a.turma_id = t.turma_id;
