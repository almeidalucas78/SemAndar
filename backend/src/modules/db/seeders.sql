USE semandar_db;

-- 1. Limpar dados antigos
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE property_images;
TRUNCATE TABLE favorites;
TRUNCATE TABLE properties;
TRUNCATE TABLE users;
SET FOREIGN_KEY_CHECKS = 1;

-- 2. Inserir Usuários
INSERT INTO users (name, email, password, role, phone) VALUES
('Admin SemAndar', 'admin@semandar.com', 'admin123', 'ADMIN', '11999999999'),
('Lucas Proprietário', 'lucas@gmail.com', 'senha123', 'ADVERTISER', '11988888888'),
('Ana Buscadora', 'ana@outlook.com', 'senha123', 'BUYER', '11977777777');

-- 3. Inserir Imóveis (Properties) diversificados para testes de filtros
INSERT INTO properties (title, description, type, status, price, condo_fee, iptu, bedrooms, bathrooms, parking_spots, area_m2, address, neighborhood, city, state, latitude, longitude, owner_id)
VALUES 
-- Cenário 1: São Paulo - Studio - Barato
(
    'Studio Moderno na Consolação', 
    'Próximo ao metrô, mobiliado e com lazer.', 
    'Studio', 'Disponível', 2500.00, 450.00, 120.00, 1, 1, 0, 35, 
    'Rua Augusta, 1200', 'Consolação', 'São Paulo', 'SP', -23.5533, -46.6529, 2
),
-- Cenário 2: São Paulo - Casa - Luxo
(
    'Casa de Alto Padrão nos Jardins', 
    'Casa reformada com 3 suítes e piscina.', 
    'Casa', 'Disponível', 15000.00, 0.00, 850.00, 3, 4, 3, 250, 
    'Rua Oscar Freire, 100', 'Jardins', 'São Paulo', 'SP', -23.5641, -46.6672, 2
),
-- Cenário 3: São Paulo - Apartamento - Médio
(
    'Apartamento Família na Vila Mariana', 
    'Varanda gourmet e 2 vagas de garagem.', 
    'Apartamento', 'Disponível', 5500.00, 900.00, 300.00, 2, 2, 2, 85, 
    'Rua Domingos de Morais, 500', 'Vila Mariana', 'São Paulo', 'SP', -23.5891, -46.6343, 2
),
-- Cenário 4: Outra Cidade (Ex: Suzano) - Casa - Barato
(
    'Casa aconchegante em Suzano', 
    'Ótima localização, próxima ao shopping.', 
    'Casa', 'Disponível', 1800.00, 0.00, 80.00, 2, 1, 1, 70, 
    'Rua Benjamin Constant, 10', 'Centro', 'Suzano', 'SP', -23.5431, -46.3102, 2
),
-- Cenário 5: Outra Cidade (Ex: Santo André) - Kitnet
(
    'Kitnet Próximo à UFABC', 
    'Ideal para estudantes, baixo custo.', 
    'Kitnet', 'Disponível', 1100.00, 150.00, 40.00, 1, 1, 0, 25, 
    'Avenida dos Estados, 1000', 'Bangu', 'Santo André', 'SP', -23.6432, -46.5284, 2
);

-- 4. Inserir Imagens (Relacionando com IDs gerados)
INSERT INTO property_images (property_id, url, is_main) VALUES
(1, 'https://images.unsplash.com/photo-1522708323590-d24dbb6b0267', TRUE),
(2, 'https://images.unsplash.com/photo-1512917774080-9991f1c4c750', TRUE),
(3, 'https://images.unsplash.com/photo-1493809842364-78817add7ffb', TRUE),
(4, 'https://images.unsplash.com/photo-1580587771525-78b9daa3b919', TRUE),
(5, 'https://images.unsplash.com/photo-1536376074432-bf13296b1f8a', TRUE);