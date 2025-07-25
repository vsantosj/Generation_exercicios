
DROP DATABASE db_pizzaria_legal;

#Criação do banco de dados
CREATE DATABASE IF NOT EXISTS db_pizzaria_legal 
CHARACTER SET utf8mb4 
COLLATE utf8mb4_unicode_ci;

USE db_pizzaria_legal;

# tabela categorias
CREATE TABLE tb_categorias (
    id BIGINT AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL UNIQUE,
    descricao VARCHAR(100) NOT NULL,
    PRIMARY KEY(id)
);

SELECT * FROM tb_categorias;

# tabela de Pizzas
CREATE TABLE tb_pizzas (
    id BIGINT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    ingredientes VARCHAR(255) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    tamanho ENUM('Pequena', 'Média', 'Grande') NOT NULL DEFAULT 'Média',
    disponivel BOOLEAN DEFAULT TRUE,
    categoria_id BIGINT NOT NULL,
    
    CONSTRAINT chk_preco CHECK (preco > 0),
    CONSTRAINT fk_pizza_categoria FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id),
    PRIMARY KEY(id)
);

SELECT * FROM  tb_pizzas;

# indices
CREATE INDEX idx_pizza_categoria ON tb_pizzas(categoria_id);
CREATE INDEX idx_pizza_nome ON tb_pizzas(nome);
CREATE INDEX idx_pizza_preco ON tb_pizzas(preco);
CREATE INDEX idx_pizza_disponivel ON tb_pizzas(disponivel);

#populando categorias
INSERT INTO tb_categorias (nome, descricao) VALUES
('Tradicional', 'Pizzas clássicas e tradicionais da culinária italiana'),
('Premium', 'Pizzas gourmet com ingredientes nobres e diferenciados'),
('Vegetariana', 'Pizzas exclusivamente com ingredientes vegetais'),
('Doce', 'Pizzas doces para sobremesa com chocolate, frutas e doces'),
('Vegana', 'Pizzas sem ingredientes de origem animal');


SELECT * FROM tb_categorias;


#populando pizzas
INSERT INTO tb_pizzas (nome, ingredientes, preco, tamanho, categoria_id) VALUES
('Margherita', 'Molho de tomate, mussarela, manjericão fresco, azeite extra virgem', 42.90, 'Média', 1),
('Calabresa', 'Molho de tomate, mussarela, calabresa fatiada, cebola, orégano', 38.50, 'Média', 1),
('Quattro Formaggi Premium', 'Molho branco, gorgonzola, parmesão, provolone, mussarela de búfala', 67.80, 'Média', 2),
('Salmão Defumado', 'Cream cheese, salmão defumado, alcaparras, cebola roxa, rúcula', 78.90, 'Média', 2),
('Vegetariana Especial', 'Molho de tomate, mussarela, abobrinha, berinjela, pimentão, tomate cereja', 48.70, 'Média', 3),
('Margherita Doce', 'Nutella, morango, banana, coco ralado, açúcar de confeiteiro', 52.30, 'Média', 4),
('Vegana Mediterrânea', 'Molho de tomate, queijo vegano, azeitona, tomate seco, manjericão', 55.60, 'Média', 5),
('Pepperoni Premium', 'Molho de tomate especial, mussarela artesanal, pepperoni importado', 72.40, 'Grande', 2);

SELECT * FROM  tb_pizzas;

# pizzas com valor maior que R$ 45,00
SELECT 
    p.id,
    p.nome,
    p.ingredientes,
    p.preco,
    p.tamanho,
    c.nome AS categoria
FROM tb_pizzas p
INNER JOIN tb_categorias c ON p.categoria_id = c.id
WHERE p.preco > 45.00
ORDER BY p.preco DESC;

# pizzas com valor entre R$ 50,00 e R$ 100,00
SELECT 
    p.id,
    p.nome,
    p.ingredientes,
    p.preco,
    p.tamanho,
    c.nome AS categoria
FROM tb_pizzas p
INNER JOIN tb_categorias c ON p.categoria_id = c.id
WHERE p.preco BETWEEN 50.00 AND 100.00
ORDER BY p.preco ASC;

# pizzas com letra 'M' no nome
SELECT 
    p.id,
    p.nome,
    p.ingredientes,
    p.preco,
    p.tamanho,
    c.nome AS categoria
FROM tb_pizzas p
INNER JOIN tb_categorias c ON p.categoria_id = c.id
WHERE p.nome LIKE '%M%'
ORDER BY p.nome;

# todas as pizzas com suas categorias
SELECT 
    p.id AS pizza_id,
    p.nome AS pizza_nome,
    p.ingredientes,
    p.preco,
    p.tamanho,
    p.disponivel,
    c.id AS categoria_id,
    c.nome AS categoria_nome,
    c.descricao AS categoria_descricao
FROM tb_pizzas p
INNER JOIN tb_categorias c ON p.categoria_id = c.id
WHERE p.disponivel = TRUE
ORDER BY c.nome, p.preco DESC;

# pizzas de uma categoria específica (Doces)
SELECT 
    p.id,
    p.nome AS pizza,
    p.ingredientes,
    p.preco,
    p.tamanho,
    c.nome AS categoria,
    c.descricao
FROM tb_pizzas p
INNER JOIN tb_categorias c ON p.categoria_id = c.id
WHERE c.nome = 'Doce'
ORDER BY p.preco ASC;


#3 pizzas mais caras
SELECT 
    p.nome AS pizza,
    c.nome AS categoria,
    p.ingredientes,
    p.preco,
    p.tamanho
FROM tb_pizzas p
INNER JOIN tb_categorias c ON p.categoria_id = c.id
WHERE p.disponivel = TRUE
ORDER BY p.preco DESC
LIMIT 3;

# pizzas por faixa de preço
SELECT 
    CASE 
        WHEN p.preco < 40 THEN 'Econômica (< R$ 40)'
        WHEN p.preco BETWEEN 40 AND 60 THEN 'Intermediária (R$ 40-60)'
        WHEN p.preco BETWEEN 60 AND 80 THEN 'Premium (R$ 60-80)'
        ELSE 'Luxury (> R$ 80)'
    END AS faixa_preco,
    COUNT(*) as quantidade,
    AVG(p.preco) as preco_medio
FROM tb_pizzas p
WHERE p.disponivel = TRUE
GROUP BY 
    CASE 
        WHEN p.preco < 40 THEN 'Econômica (< R$ 40)'
        WHEN p.preco BETWEEN 40 AND 60 THEN 'Intermediária (R$ 40-60)'
        WHEN p.preco BETWEEN 60 AND 80 THEN 'Premium (R$ 60-80)'
        ELSE 'Luxury (> R$ 80)'
    END
ORDER BY preco_medio;