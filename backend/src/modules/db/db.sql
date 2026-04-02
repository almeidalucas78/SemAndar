-- 1. Criação do Banco de Dados
DROP DATABASE IF EXISTS semandar_db;
CREATE DATABASE semandar_db;
USE semandar_db;

-- 2. Tabela de Usuários
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    role ENUM('BUYER', 'ADVERTISER', 'ADMIN') DEFAULT 'BUYER',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 3. Tabela de Imóveis (Com a nova coluna transaction_type)
CREATE TABLE properties (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    description TEXT,
    type ENUM('Apartamento', 'Casa', 'Studio', 'Kitnet') NOT NULL,
    status ENUM('Disponível', 'Alugado', 'Vendido') DEFAULT 'Disponível',
    transaction_type ENUM('Alugar', 'Comprar') NOT NULL, -- NOVA COLUNA
    price DECIMAL(12, 2) NOT NULL,
    condo_fee DECIMAL(10, 2) DEFAULT 0.00,
    iptu DECIMAL(10, 2) DEFAULT 0.00,
    bedrooms INT DEFAULT 0,
    bathrooms INT DEFAULT 0,
    parking_spots INT DEFAULT 0,
    area_m2 INT NOT NULL,
    address VARCHAR(255) NOT NULL,
    neighborhood VARCHAR(100),
    city VARCHAR(100) NOT NULL,
    state CHAR(2) NOT NULL,
    latitude FLOAT(10, 6),
    longitude FLOAT(10, 6),
    owner_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (owner_id) REFERENCES users(id) ON DELETE CASCADE
);

-- 4. Tabela de Imagens
CREATE TABLE property_images (
    id INT AUTO_INCREMENT PRIMARY KEY,
    property_id INT,
    url VARCHAR(255) NOT NULL,
    is_main BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (property_id) REFERENCES properties(id) ON DELETE CASCADE
);

-- 5. Tabela de Favoritos
CREATE TABLE favorites (
    user_id INT,
    property_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id, property_id),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (property_id) REFERENCES properties(id) ON DELETE CASCADE
);

-- ==========================================
-- SEEDERS (DADOS PARA TESTE)
-- ==========================================

INSERT INTO users (name, email, password, role) VALUES
('Admin', 'admin@semandar.com', 'admin123', 'ADMIN'),
('Lucas Corretor', 'lucas@prop.com', 'senha123', 'ADVERTISER');

-- Inserir Imóveis (Properties) com todos os campos obrigatórios preenchidos
INSERT INTO properties (
    title, description, type, status, transaction_type, price, 
    bedrooms, bathrooms, parking_spots, area_m2, 
    address, neighborhood, city, state, 
    latitude, longitude, owner_id
) VALUES 
('Studio Moderno Augusta', 'Mobiliado e pronto para morar.', 'Studio', 'Disponível', 'Alugar', 2500.00, 1, 1, 0, 35, 'Rua Augusta, 1200', 'Consolação', 'São Paulo', 'SP', -23.5533, -46.6529, 2),
('Apto Familia Suzano', 'Perto do shopping e estacao.', 'Apartamento', 'Disponível', 'Alugar', 1800.00, 2, 1, 1, 65, 'Rua Benjamin Constant, 10', 'Centro', 'Suzano', 'SP', -23.5431, -46.3102, 2),
('Mansao Jardins', 'Luxo total com piscina.', 'Casa', 'Disponível', 'Comprar', 2500000.00, 4, 5, 4, 300, 'Rua Oscar Freire, 100', 'Jardins', 'São Paulo', 'SP', -23.5641, -46.6672, 2),
('Apto Vila Mariana', 'Oportunidade unica.', 'Apartamento', 'Disponível', 'Comprar', 850000.00, 3, 2, 2, 110, 'Rua Domingos de Morais, 500', 'Vila Mariana', 'São Paulo', 'SP', -23.5891, -46.6343, 2),
('Kitnet UFABC', 'Ideal para investidor.', 'Kitnet', 'Disponível', 'Comprar', 190000.00, 1, 1, 0, 28, 'Avenida dos Estados, 1000', 'Bangu', 'Santo Andre', 'SP', -23.6432, -46.5284, 2);