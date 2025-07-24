CREATE DATABASE db_rh;

USE db_rh;

CREATE TABLE tb_colaboradores(
id BIGINT AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
cargo VARCHAR(50) NOT NULL,
departamento VARCHAR(50),
data_admissao DATE NOT NULL,
salario DECIMAL (10,2),
PRIMARY KEY (id)
);

SELECT * FROM tb_colaboradores; 

INSERT INTO tb_colaboradores (
    nome, cargo, departamento, data_admissao, salario
) VALUES
('Beatriz Costa', 'Estágio Desenvolvedor FullStack', 'Tecnologia da informação', '2023-05-12', 1800.00),
('Juliana Rocha', 'Engenheira de Software', 'Tecnologia da informação', '2022-11-01', 8500.00),
('Patrícia Mendes', 'Cientista de Dados', 'Tecnologia da informação', '2024-01-20', 9200.00),
('Natália Fernandes', 'Product Owner', 'Tecnologia da informação', '2021-09-15', 6800.00),
('João Carlos', 'Estágio Desenvolvedor FullStack', 'Tecnologia da informação', '2025-03-02', 1800.00),
('Mariana Silva', 'Desenvolvedora Mobile', 'Tecnologia da informação', '2023-08-07', 7400.00);


SELECT * FROM tb_colaboradores WHERE salario > 2000.00;

SELECT * FROM tb_colaboradores WHERE salario < 2000.00;

UPDATE tb_colaboradores SET salario = 15000.00, cargo = 'CTO' WHERE id = 2;

SELECT * FROM tb_colaboradores; 
