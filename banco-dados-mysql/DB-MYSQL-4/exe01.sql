DROP DATABASE db_generation_game_online; 

#Criação do banco de dados
CREATE DATABASE IF NOT EXISTS db_generation_game_online 
CHARACTER SET utf8mb4 
COLLATE utf8mb4_unicode_ci;

USE db_generation_game_online;

#Tabela de Classes
CREATE TABLE tb_classes (
    id BIGINT AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL UNIQUE,
    descricao VARCHAR(100) NOT NULL,
    bonus_ataque INT DEFAULT 0,
    bonus_defesa INT DEFAULT 0,
    PRIMARY KEY(id)
);

SELECT * FROM tb_classes;

#Tabela de Personagens
CREATE TABLE tb_personagens (
    id BIGINT AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    nivel INT NOT NULL DEFAULT 1,
    poder_ataque INT NOT NULL,
    poder_defesa INT NOT NULL,
    pontos_vida INT NOT NULL DEFAULT 5,
    classe_id BIGINT NOT NULL,
    
    CONSTRAINT chk_nivel CHECK (nivel >= 1 AND nivel <= 5),
    CONSTRAINT chk_poder_ataque CHECK (poder_ataque >= 0),
    CONSTRAINT chk_poder_defesa CHECK (poder_defesa >= 0),
    CONSTRAINT chk_pontos_vida CHECK (pontos_vida >= 0),
    CONSTRAINT fk_personagem_classe FOREIGN KEY (classe_id) REFERENCES tb_classes(id),
    PRIMARY KEY(id)
);

SELECT * FROM tb_personagens;

#indexação
CREATE INDEX idx_personagem_classe ON tb_personagens(classe_id);
CREATE INDEX idx_personagem_nome ON tb_personagens(nome);
CREATE INDEX idx_personagem_nivel ON tb_personagens(nivel);




#populando
INSERT INTO tb_classes (nome, descricao, bonus_ataque, bonus_defesa) VALUES
('Guerreiro', 'Classe focada em combate corpo a corpo com alta resistência', 150, 200),
('Mago', 'Especialista em magias devastadoras com baixa defesa física', 300, 50),
('Arqueiro', 'Combatente à distância com precisão letal', 200, 100),
('Paladino', 'Guerreiro sagrado com habilidades de cura e proteção', 120, 250),
('Assassino', 'Especialista em ataques rápidos e críticos', 280, 80);

SELECT * FROM tb_classes;

INSERT INTO tb_personagens (nome, nivel, poder_ataque, poder_defesa, pontos_vida, classe_id) VALUES
('Conan o Bárbaro', 4, 2500, 1800, 3500, 1),
('Gandalf Cinzento', 3, 3200, 800, 2200, 2),
('Legolas Folha Verde', 4, 2100, 1200, 2800, 3),
('Arthur Pendragon', 5, 1900, 2300, 4000, 4),
('Ezio Auditore', 4, 2800, 900, 2500, 5),
('Thorin Escudo de Carvalho', 3, 1800, 1600, 3200, 1),
('Merlin Ambrosius', 1, 2900, 700, 2000, 2),
('Robin Hood', 2, 1950, 1100, 2600, 3);


SELECT * FROM tb_personagens;

#Personagens com poder de ataque maior que 2000
SELECT 
    p.id,
    p.nome,
    p.nivel,
    p.poder_ataque,
    p.poder_defesa,
    c.nome AS classe
FROM tb_personagens p
INNER JOIN tb_classes c ON p.classe_id = c.id
WHERE p.poder_ataque > 2000
ORDER BY p.poder_ataque DESC;

#Personagens com poder de defesa entre 1000 e 2000
SELECT 
    p.id,
    p.nome,
    p.nivel,
    p.poder_defesa,
    c.nome AS classe
FROM tb_personagens p
INNER JOIN tb_classes c ON p.classe_id = c.id
WHERE p.poder_defesa BETWEEN 1000 AND 2000
ORDER BY p.poder_defesa DESC;

#Personagens com letra 'C' no nome
SELECT 
    p.id,
    p.nome,
    p.nivel,
    p.poder_ataque,
    p.poder_defesa,
    c.nome AS classe
FROM tb_personagens p
INNER JOIN tb_classes c ON p.classe_id = c.id
WHERE p.nome LIKE '%C%'
ORDER BY p.nome;

#Todos os personagens com suas classes
SELECT 
    p.id AS personagem_id,
    p.nome AS personagem_nome,
    p.nivel,
    p.poder_ataque,
    p.poder_defesa,
    p.pontos_vida,
    c.id AS classe_id,
    c.nome AS classe_nome,
    c.descricao AS classe_descricao,
    c.bonus_ataque,
    c.bonus_defesa,
    (p.poder_ataque + c.bonus_ataque) AS ataque_total,
    (p.poder_defesa + c.bonus_defesa) AS defesa_total
FROM tb_personagens p
INNER JOIN tb_classes c ON p.classe_id = c.id
ORDER BY p.nivel DESC, p.poder_ataque DESC;

#Personagens de uma classe específica (Arqueiros)
SELECT 
    p.id,
    p.nome AS personagem,
    p.nivel,
    p.poder_ataque,
    p.poder_defesa,
    p.pontos_vida,
    c.nome AS classe,
    c.descricao
FROM tb_personagens p
INNER JOIN tb_classes c ON p.classe_id = c.id
WHERE c.nome = 'Arqueiro'
ORDER BY p.nivel DESC;


#3 personagens mais poderosos (baseado na soma de atributos)
SELECT 
    p.nome AS personagem,
    c.nome AS classe,
    p.nivel,
    p.poder_ataque,
    p.poder_defesa,
    p.pontos_vida,
    (p.poder_ataque + p.poder_defesa + p.pontos_vida) AS poder_total
FROM tb_personagens p
INNER JOIN tb_classes c ON p.classe_id = c.id
ORDER BY poder_total DESC
LIMIT 3;

 