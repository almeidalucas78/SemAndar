USE semandar_db;

-- 1. Limpar dados antigos para um Reset Limpo
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE property_images;
TRUNCATE TABLE favorites;
TRUNCATE TABLE properties;
TRUNCATE TABLE users;
SET FOREIGN_KEY_CHECKS = 1;

-- 2. Inserir Usuários (Admin, Anunciante e Comprador)
INSERT INTO users (name, email, password, role, phone) VALUES
('Admin SemAndar', 'admin@semandar.com', 'admin123', 'ADMIN', '11999999999'),
('Lucas Corretor', 'lucas@corretora.com', 'senha123', 'ADVERTISER', '11988888888'),
('Ana Silva', 'ana@email.com', 'senha123', 'BUYER', '11977777777');

-- 3. Inserir Imóveis (Focado em Venda/Comprar no Estado de SP)
INSERT INTO properties (title, description, type, status, transaction_type, price, condo_fee, iptu, bedrooms, bathrooms, parking_spots, area_m2, address, neighborhood, city, state, latitude, longitude, owner_id)
VALUES 
-- Imóvel 1: Apartamento Alto Padrão - São Paulo
(
    'Apartamento de Luxo Vila Nova Conceição', 
    'Apartamento impecável com vista para o Ibirapuera, acabamento em mármore.', 
    'Apartamento', 'Disponível', 'Comprar', 2450000.00, 1800.00, 750.00, 3, 4, 3, 145,
    'Rua Afonso Braz, 500', 'Vila Nova Conceição', 'São Paulo', 'SP', -23.5924, -46.6712, 2
),
-- Imóvel 2: Casa de Condomínio - São Paulo
(
    'Casa Moderna em Condomínio Fechado', 
    'Segurança 24h, piscina privativa e área gourmet completa.', 
    'Casa', 'Disponível', 'Comprar', 3800000.00, 1200.00, 900.00, 4, 5, 4, 350,
    'Alameda dos Pintassilgos, 120', 'Morumbi', 'São Paulo', 'SP', -23.6012, -46.7214, 2
),
-- Imóvel 3: Apartamento Médio - São Paulo (Ideal para o filtro de 900k)
(
    'Apartamento Reformado na Vila Mariana', 
    'Próximo ao metrô Ana Rosa, varanda envidraçada e móveis planejados.', 
    'Apartamento', 'Disponível', 'Comprar', 890000.00, 850.00, 220.00, 2, 2, 1, 75,
    'Rua Domingos de Morais, 800', 'Vila Mariana', 'São Paulo', 'SP', -23.5891, -46.6343, 2
),
-- Imóvel 4: Studio - São Paulo (Centro)
(
    'Studio Design na Consolação', 
    'Ideal para investimento ou moradia prática. Prédio com rooftop e lavanderia.', 
    'Apartamento', 'Disponível', 'Comprar', 420000.00, 450.00, 110.00, 1, 1, 0, 32,
    'Rua Augusta, 1500', 'Consolação', 'São Paulo', 'SP', -23.5533, -46.6529, 2
),
-- Imóvel 5: Apartamento em Suzano
(
    'Apto Residencial em Suzano Centro', 
    'Excelente custo benefício, condomínio com lazer completo.', 
    'Apartamento', 'Disponível', 'Comprar', 320000.00, 350.00, 80.00, 2, 1, 1, 58,
    'Rua Benjamin Constant, 500', 'Centro', 'Suzano', 'SP', -23.5431, -46.3102, 2
),
-- Imóvel 6: Casa de Condomínio em Santo André
(
    'Casa de Condomínio - Bairro Jardim', 
    'Localização privilegiada em Santo André, fino acabamento.', 
    'Casa', 'Disponível', 'Comprar', 1250000.00, 600.00, 400.00, 3, 3, 2, 180,
    'Rua das Figueiras, 1000', 'Jardim', 'Santo André', 'SP', -23.6558, -46.5367, 2
);

-- 4. Inserir Imagens (Relacionando com os IDs 1 a 6 gerados acima)
-- Usando Unsplash como placeholder (Imagens de arquitetura/interiores)
INSERT INTO property_images (property_id, url, is_main) VALUES
(1, 'https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?q=80&w=1000', TRUE),
(1, 'https://images.unsplash.com/photo-1484154218962-a197022b5858?q=80&w=1000', FALSE),
(2, 'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?q=80&w=1000', TRUE),
(3, 'https://images.unsplash.com/photo-1493809842364-78817add7ffb?q=80&w=1000', TRUE),
(4, 'https://images.unsplash.com/photo-1536376074432-bf13296b1f8a?q=80&w=1000', TRUE),
(5, 'https://images.unsplash.com/photo-1580587771525-78b9daa3b919?q=80&w=1000', TRUE),
(6, 'https://images.unsplash.com/photo-1600585154340-be6161a56a0c?q=80&w=1000', TRUE);


-- ==========================================
-- NOVOS APARTAMENTOS PARA VENDA (SÃO PAULO)
-- ==========================================

INSERT INTO properties (
    title, description, type, status, transaction_type, price, 
    bedrooms, bathrooms, parking_spots, area_m2, 
    address, neighborhood, city, state, 
    latitude, longitude, owner_id
) VALUES 
-- 1. Apartamento no ABC (São Bernardo do Campo)
(
    'Apto Mobiliado Jardim do Mar', 
    'Próximo ao Shopping Metrópole e fácil acesso à Anchieta. Lazer completo.', 
    'Apartamento', 'Disponível', 'Comprar', 580000.00, 
    2, 2, 2, 68, 'Rua Java, 200', 'Jardim do Mar', 'São Bernardo do Campo', 'SP', -23.6892, -46.5511, 2
),
-- 2. Apartamento na Zona Leste (Tatuapé)
(
    'Apartamento Moderno Tatuapé', 
    'Andar alto com vista panorâmica. Próximo ao metrô e Shopping Boulevard.', 
    'Apartamento', 'Disponível', 'Comprar', 920000.00, 
    3, 2, 2, 82, 'Rua Tuiuti, 1500', 'Tatuapé', 'São Paulo', 'SP', -23.5398, -46.5762, 2
),
-- 3. Apartamento Econômico (Ipiranga)
(
    'Oportunidade Ipiranga', 
    'Apto compacto e funcional. Baixo custo de condomínio e IPTU.', 
    'Apartamento', 'Disponível', 'Comprar', 450000.00, 
    2, 1, 1, 52, 'Rua Bom Pastor, 1000', 'Ipiranga', 'São Paulo', 'SP', -23.5894, -46.6102, 2
),
-- 4. Apartamento de Alto Padrão (Moema)
(
    'Residencial Moema Pássaros', 
    'Fora da rota, 4 suítes, varanda gourmet integrada. Luxo e exclusividade.', 
    'Apartamento', 'Disponível', 'Comprar', 3200000.00, 
    4, 5, 4, 210, 'Rua Gaivota, 450', 'Moema', 'São Paulo', 'SP', -23.6015, -46.6661, 2
),
-- 5. Apartamento Studio (Pinheiros)
(
    'Studio Pinheiros Design', 
    'Conceito aberto, pé direito duplo. Ao lado do metrô Fradique Coutinho.', 
    'Apartamento', 'Disponível', 'Comprar', 710000.00, 
    1, 1, 1, 40, 'Rua dos Pinheiros, 800', 'Pinheiros', 'São Paulo', 'SP', -23.5663, -46.6844, 2
);

-- ==========================================
-- IMAGENS PARA OS NOVOS APARTAMENTOS
-- ==========================================
-- O ID da propriedade começa do 7 (assumindo que você já rodou o seeder anterior com 6 itens)

INSERT INTO property_images (property_id, url, is_main) VALUES
-- Imagens para o Apto em SBC
(7, 'https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?q=80&w=1000', TRUE),
-- Imagens para o Tatuapé
(8, 'https://images.unsplash.com/photo-1460317442991-0ec239f3d7bb?q=80&w=1000', TRUE),
-- Imagens para o Ipiranga
(9, 'https://images.unsplash.com/photo-1493236272120-200db0da1927?q=80&w=1000', TRUE),
-- Imagens para Moema
(10, 'https://images.unsplash.com/photo-1545324418-cc1a3fa10c00?q=80&w=1000', TRUE),
-- Imagens para Pinheiros
(11, 'https://images.unsplash.com/photo-1502005229762-cf1b2da7c5d6?q=80&w=1000', TRUE);