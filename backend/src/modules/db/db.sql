-- 1. Criação do Banco de Dados
CREATE DATABASE IF NOT EXISTS semandar_db;
USE semandar_db;

-- 2. Tabela de Usuários (Níveis de acesso: BUYER, ADVERTISER, ADMIN)
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    role ENUM('BUYER', 'ADVERTISER', 'ADMIN') DEFAULT 'BUYER',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 3. Tabela de Imóveis (Focada em geolocalização e filtros)
CREATE TABLE IF NOT EXISTS properties (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    description TEXT,
    type ENUM('Apartamento', 'Casa', 'Studio', 'Kitnet') NOT NULL,
    status ENUM('Disponível', 'Alugado', 'Vendido') DEFAULT 'Disponível',
    price DECIMAL(12, 2) NOT NULL,
    condo_fee DECIMAL(10, 2) DEFAULT 0.00,
    iptu DECIMAL(10, 2) DEFAULT 0.00,
    bedrooms INT DEFAULT 0,
    bathrooms INT DEFAULT 0,
    parking_spots INT DEFAULT 0,
    area_m2 INT NOT NULL,
    address VARCHAR(255) NOT NULL,
    number VARCHAR(10),
    neighborhood VARCHAR(100),
    city VARCHAR(100) NOT NULL,
    state CHAR(2) NOT NULL,
    zip_code VARCHAR(10),
    latitude FLOAT(10, 6), -- Crucial para o mapa no frontend
    longitude FLOAT(10, 6), -- Crucial para o mapa no frontend
     owner_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (owner_id) REFERENCES users(id) ON DELETE CASCADE
);

-- 4. Tabela de Imagens (Um imóvel pode ter várias fotos)
CREATE TABLE IF NOT EXISTS property_images (
    id INT AUTO_INCREMENT PRIMARY KEY,
    property_id INT,
    url VARCHAR(255) NOT NULL, -- Aqui salvaremos o link do Cloudinary
    is_main BOOLEAN DEFAULT FALSE, -- Para identificar a foto de capa
    FOREIGN KEY (property_id) REFERENCES properties(id) ON DELETE CASCADE
);

-- 5. Tabela de Favoritos (Relaciona Usuário com Imóvel)
CREATE TABLE IF NOT EXISTS favorites (
    user_id INT,
    property_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id, property_id),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (property_id) REFERENCES properties(id) ON DELETE CASCADE
);