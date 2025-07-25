DROP DATABASE IF EXISTS db_farmacia_bem_estar;

# criação do banco de dados
CREATE DATABASE IF NOT EXISTS db_farmacia_bem_estar 
CHARACTER SET utf8mb4 
COLLATE utf8mb4_unicode_ci;

USE db_farmacia_bem_estar;

# tabela de Categorias
CREATE TABLE tb_categorias (
    id BIGINT AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL UNIQUE,
    descricao VARCHAR(255) NOT NULL,
    requer_receita BOOLEAN DEFAULT FALSE,
    PRIMARY KEY(id)
);

SELECT * FROM tb_categorias;

# tabela de Produtos (Entidade Filha)
CREATE TABLE tb_produtos (
    id BIGINT AUTO_INCREMENT,
    nome VARCHAR(150) NOT NULL,
    fabricante VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    estoque INT NOT NULL DEFAULT 0,
    data_validade DATE NOT NULL,
    categoria_id BIGINT NOT NULL,
    
    CONSTRAINT chk_preco CHECK (preco > 0),
    CONSTRAINT chk_estoque CHECK (estoque >= 0),
    CONSTRAINT fk_produto_categoria FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id),
    PRIMARY KEY(id)
);

SELECT * FROM tb_produtos;

# indices
CREATE INDEX idx_produto_categoria ON tb_produtos(categoria_id);
CREATE INDEX idx_produto_nome ON tb_produtos(nome);
CREATE INDEX idx_produto_preco ON tb_produtos(preco);
CREATE INDEX idx_produto_fabricante ON tb_produtos(fabricante);
CREATE INDEX idx_produto_validade ON tb_produtos(data_validade);

# populando categorias
INSERT INTO tb_categorias (nome, descricao, requer_receita) VALUES
('Medicamentos', 'Medicamentos para tratamento de diversas patologias', TRUE),
('Cosméticos', 'Produtos de beleza e cuidados pessoais', FALSE),
('Suplementos', 'Vitaminas, minerais e suplementos alimentares', FALSE),
('Higiene Pessoal', 'Produtos para higiene e cuidados diários', FALSE),
('Dermocosméticos', 'Produtos especializados para cuidados com a pele', FALSE);

SELECT * FROM tb_categorias;

# populando produtos
INSERT INTO tb_produtos (nome, fabricante, preco, estoque, data_validade, categoria_id) VALUES
('Paracetamol 500mg', 'Medley', 12.50, 150, '2025-12-31', 1),
('Dipirona 500mg', 'Neo Química', 8.90, 200, '2025-11-30', 1),
('Shampoo Anticaspa', 'Head & Shoulders', 24.90, 80, '2026-06-15', 2),
('Vitamina C 1000mg', 'Vitafor', 35.70, 120, '2025-10-20', 3),
('Sabonete Líquido Neutro', 'Johnson & Johnson', 18.30, 90, '2026-03-10', 4),
('Protetor Solar FPS 60', 'La Roche-Posay', 89.90, 45, '2025-08-25', 5),
('Complexo B', 'Centrum', 42.80, 75, '2025-09-18', 3),
('Creme Hidratante Facial', 'Eucerin', 67.40, 60, '2025-12-05', 5);


SELECT * FROM tb_produtos;


# produtos com valor maior que R$ 50,00
SELECT 
    p.id,
    p.nome,
    p.fabricante,
    p.preco,
    p.estoque,
    p.data_validade,
    c.nome AS categoria
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.categoria_id = c.id
WHERE p.preco > 50.00
ORDER BY p.preco DESC;

# produtos com valor entre R$ 5,00 e R$ 60,00
SELECT 
    p.id,
    p.nome,
    p.fabricante,
    p.preco,
    p.estoque,
    p.data_validade,
    c.nome AS categoria
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.categoria_id = c.id
WHERE p.preco BETWEEN 5.00 AND 60.00
ORDER BY p.preco ASC;

# produtos com letra 'C' no nome
SELECT 
    p.id,
    p.nome,
    p.fabricante,
    p.preco,
    p.estoque,
    c.nome AS categoria
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.categoria_id = c.id
WHERE p.nome LIKE '%C%'
ORDER BY p.nome;

# todos os produtos com suas categorias
SELECT 
    p.id AS produto_id,
    p.nome AS produto_nome,
    p.fabricante,
    p.preco,
    p.estoque,
    p.data_validade,
    c.id AS categoria_id,
    c.nome AS categoria_nome,
    c.descricao AS categoria_descricao,
    c.requer_receita,
    CASE 
        WHEN p.data_validade < CURDATE() THEN 'Vencido'
        WHEN p.data_validade < DATE_ADD(CURDATE(), INTERVAL 30 DAY) THEN 'Vence em breve'
        ELSE 'Válido'
    END AS status_validade
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.categoria_id = c.id
ORDER BY c.nome, p.nome;

# Produtos de uma categoria específica (Cosméticos)
SELECT 
    p.id,
    p.nome AS produto,
    p.fabricante,
    p.preco,
    p.estoque,
    p.data_validade,
    c.nome AS categoria,
    c.descricao
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.categoria_id = c.id
WHERE c.nome = 'Cosméticos'
ORDER BY p.preco DESC;



# produtos próximos do vencimento (próximos 60 dias)
SELECT 
    p.nome AS produto,
    p.fabricante,
    p.preco,
    p.estoque,
    p.data_validade,
    c.nome AS categoria,
    DATEDIFF(p.data_validade, CURDATE()) AS dias_para_vencer
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.categoria_id = c.id
WHERE p.data_validade <= DATE_ADD(CURDATE(), INTERVAL 60 DAY)
ORDER BY p.data_validade ASC;

# valor total do estoque por categoria
SELECT 
    c.nome AS categoria,
    COUNT(p.id) AS quantidade_produtos,
    SUM(p.estoque * p.preco) AS valor_total_estoque,
    AVG(p.preco) AS preco_medio
FROM tb_categorias c
INNER JOIN tb_produtos p ON c.id = p.categoria_id
GROUP BY c.id, c.nome
ORDER BY valor_total_estoque DESC;