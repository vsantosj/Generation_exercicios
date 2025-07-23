CREATE DATABASE db_ecommerce;

USE db_ecommerce;

CREATE TABLE tb_produtos(
id BIGINT AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
descricao VARCHAR(255) NOT NULL,
preco DECIMAL(10,2) NOT NULL,
categoria VARCHAR(100) NOT NULL,
estoque INT NOT NULL,
PRIMARY KEY (id)
);

SELECT * FROM tb_produtos;

INSERT INTO tb_produtos (nome, descricao, preco, categoria, estoque) VALUES
('Mouse Gamer RGB', 'Mouse óptico com 6 botões programáveis e iluminação RGB.', 129.90, 'Informática', 200),
('Teclado Mecânico Compacto', 'Teclado mecânico 60% com switches azuis, ideal para digitação e jogos.', 349.99, 'Informática', 150),
('Webcam Full HD', 'Webcam com resolução 1080p para videochamadas e streaming.', 189.50, 'Informática', 180),
('SSD 240GB Sata III', 'Unidade de estado sólido para notebooks e desktops, velocidade de leitura rápida.', 215.00, 'Informática', 300),
('Monitor Gamer 27" 144Hz', 'Monitor LED IPS de 27 polegadas, 144Hz, 1ms, Full HD.', 1299.00, 'Informática', 75),
('Notebook Essencial i5', 'Notebook com processador Intel Core i5, 8GB RAM, 256GB SSD, tela 15.6".', 2899.99, 'Informática', 50),
('Placa de Vídeo RTX 3060', 'Placa de vídeo NVIDIA GeForce RTX 3060, 12GB GDDR6, ideal para jogos e criação.', 2100.00, 'Informática', 30),
('Roteador Wi-Fi 6 AX1800', 'Roteador dual-band Wi-Fi 6, velocidade de até 1800Mbps, 4 antenas.', 579.00, 'Informática', 100);

SELECT * FROM tb_produtos WHERE preco > 500.00;

SELECT * FROM tb_produtos WHERE preco < 500.00;

UPDATE tb_produtos SET preco = 149.99 WHERE id = 1;

SELECT * FROM tb_produtos;