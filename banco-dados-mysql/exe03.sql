CREATE DATABASE db_escola;

USE db_escola;

CREATE TABLE tb_estudantes(
matricula BIGINT AUTO_INCREMENT,
nome VARCHAR(100),
turma VARCHAR(50),
nota DECIMAL(4,2),
email VARCHAR(100) UNIQUE,
telefone VARCHAR(50),
PRIMARY KEY(matricula)
);

SELECT * FROM tb_estudantes;

INSERT INTO tb_estudantes(nome, turma, nota, email, telefone)  VALUES
('Alice Mendes', '8º Ano A', 8.20, 'alice.mendes@email.com', '(11) 98765-1111'),
('Bernardo Silva', '7º Ano B', 6.50, 'bernardo.silva@email.com', '(11) 98765-2222'),
('Clara Oliveira', '9º Ano C', 9.00, 'clara.oliveira@email.com', '(11) 98765-3333'),
('Diego Santos', '6º Ano A', 5.80, 'diego.santos@email.com', '(11) 98765-4444'),
('Emilia Costa', '8º Ano B', 7.10, 'emilia.costa@email.com', '(11) 98765-5555'),
('Fernando Lima', '7º Ano A', 6.90, 'fernando.lima@email.com', '(11) 98765-6666'),
('Giovanna Alves', '9º Ano A', 7.50, 'giovanna.alves@email.com', '(11) 98765-7777'),
('Heitor Rocha', '6º Ano B', 4.00, 'heitor.rocha@email.com', '(11) 98765-8888'),
('Isabela Pereira', '8º Ano C', 8.80, 'isabela.pereira@email.com', '(11) 98765-9999'),
('Julio Martins', '7º Ano C', 6.20, 'julio.martins@email.com', '(11) 98765-0000');

SELECT * FROM tb_estudantes;

SELECT * FROM tb_estudantes WHERE nota > 7.00;

SELECT * FROM tb_estudantes WHERE nota < 7.00;

SELECT nome, nota FROM tb_estudantes WHERE nota < 7.00;
SELECT nome, nota FROM tb_estudantes WHERE nota > 7.00;

UPDATE tb_estudantes SET nota = 8.00 WHERE MATRICULA = 7; 
