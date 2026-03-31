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

INSERT INTO properties (title, description, type, transaction_type, price, bedrooms, area_m2, city, state, owner_id) VALUES 
-- ALUGUEL
('Studio Moderno Augusta', 'Mobiliado.', 'Studio', 'Alugar', 2500.00, 1, 35, 'São Paulo', 'SP', 2),
('Apto Família Suzano', 'Perto do shopping.', 'Apartamento', 'Alugar', 1800.00, 2, 65, 'Suzano', 'SP', 2),

-- VENDA
('Mansão Jardins', 'Luxo total.', 'Casa', 'Comprar', 2500000.00, 4, 300, 'São Paulo', 'SP', 2),
('Apto Vila Mariana', 'Oportunidade.', 'Apartamento', 'Comprar', 850000.00, 3, 110, 'São Paulo', 'SP', 2),
('Kitnet UFABC', 'Ideal investidor.', 'Kitnet', 'Comprar', 190000.00, 1, 28, 'Santo André', 'SP', 2);