USE semandar_db;

-- 1. Limpar dados antigos (Cuidado: use apenas em desenvolvimento!)
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE property_images;
TRUNCATE TABLE favorites;
TRUNCATE TABLE properties;
TRUNCATE TABLE users;
SET FOREIGN_KEY_CHECKS = 1;

-- 2. Inserir Usuários
-- As senhas aqui são '123456', mas no mundo real usaremos bcrypt. 
-- Para o seeder inicial, vamos focar na estrutura.
INSERT INTO users (name, email, password, role, phone) VALUES
('Admin SemAndar', 'admin@semandar.com', 'admin123', 'ADMIN', '11999999999'),
('Lucas Proprietário', 'lucas@gmail.com', 'senha123', 'ADVERTISER', '11988888888'),
('Ana Buscadora', 'ana@outlook.com', 'senha123', 'BUYER', '11977777777');

-- 3. Inserir Imóveis (Properties)
-- Exemplo 1: Apartamento na Consolação
INSERT INTO properties (title, description, type, status, price, condo_fee, iptu, bedrooms, bathrooms, parking_spots, area_m2, address, neighborhood, city, state, latitude, longitude, owner_id)
VALUES (
    'Studio Moderno na Consolação', 
    'Próximo ao metrô, totalmente mobiliado e com lazer completo no prédio.', 
    'Studio', 
    'Disponível', 
    2500.00, 450.00, 120.00, 
    1, 1, 0, 35, 
    'Rua Augusta, 1200', 'Consolação', 'São Paulo', 'SP', 
    -23.5533, -46.6529, 
    2
);

-- Exemplo 2: Casa em Condomínio
INSERT INTO properties (title, description, type, status, price, condo_fee, iptu, bedrooms, bathrooms, parking_spots, area_m2, address, neighborhood, city, state, latitude, longitude, owner_id)
VALUES (
    'Casa Espaçosa com Quintal', 
    'Casa reformada, 3 suítes e vaga para 2 carros. Ideal para famílias.', 
    'Casa', 
    'Disponível', 
    7500.00, 0.00, 350.00, 
    3, 4, 2, 180, 
    'Alameda Santos, 450', 'Jardim Paulista', 'São Paulo', 'SP', 
    -23.5641, -46.6521, 
    2
);

-- 4. Inserir Imagens para os Imóveis
-- Usando URLs de placeholder por enquanto
INSERT INTO property_images (property_id, url, is_main) VALUES
(1, 'https://images.unsplash.com/photo-1522708323590-d24dbb6b0267', TRUE),
(1, 'https://images.unsplash.com/photo-1502672260266-1c1ef2d93688', FALSE),
(2, 'https://images.unsplash.com/photo-1512917774080-9991f1c4c750', TRUE);

-- 5. Inserir um Favorito
-- Ana (ID 3) favoritou o Studio (ID 1)
INSERT INTO favorites (user_id, property_id) VALUES (3, 1);