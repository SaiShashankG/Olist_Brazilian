CREATE DATABASE olist_db;
USE olist_db;
CREATE TABLE olist_customers(
    customer_id VARCHAR(50) PRIMARY KEY,
    cutomer_unique_id VARCHAR(50),
    customer_zip_code_prefix INT,
    customer_city VARCHAR(100),
    customer_state VARCHAR(2)
);
SELECT *
FROM olist_customers
LIMIT 5;
CREATE TABLE olist_geolocation (
    geolocation_zip_code_prefix INT,
    geolocation_lat DECIMAL(11, 8),
    geolocation_lng DECIMAL(11, 8),
    geolocation_city VARCHAR(100),
    geolocation_state VARCHAR(2)
);
SELECT *
FROM olist_geolocation
LIMIT 5;
CREATE TABLE olist_orders (
    order_id VARCHAR(50) PRIMARY KEY,
    customer_id VARCHAR(50),
    order_status VARCHAR(20),
    order_purchase_timestamp DATETIME,
    order_approved_at DATETIME,
    order_delivered_carrier_date DATETIME,
    order_delivered_customer_date DATETIME,
    order_estimated_delivery_date DATETIME
);
SELECT *
FROM olist_orders
LIMIT 5;

CREATE TABLE olist_order_items (
    order_id VARCHAR(50),
    order_item_id INT,
    product_id VARCHAR(50),
    seller_id VARCHAR(50),
    shipping_limit_date DATETIME,
    price DECIMAL(10, 2),
    freight_value DECIMAL(10, 2),
    PRIMARY KEY (order_id, order_item_id)
);
CREATE TABLE olist_order_payments (
    order_id VARCHAR(50),
    payment_sequential INT,
    payment_type VARCHAR(20),
    payment_installments INT,
    payment_value DECIMAL(10, 2)
);
CREATE TABLE olist_order_reviews (
    review_id VARCHAR(50),
    order_id VARCHAR(50),
    review_score INT,
    review_comment_title TEXT,
    review_comment_message TEXT,
    review_creation_date DATETIME,
    review_answer_timestamp DATETIME
);
SELECT *
FROM olist_order_reviews
LIMIT 5;
CREATE TABLE olist_products (
    product_id VARCHAR(50) PRIMARY KEY,
    product_category_name VARCHAR(100),
    product_name_lenght INT,
    product_description_lenght INT,
    product_photos_qty INT,
    product_weight_g INT,
    product_length_cm INT,
    product_height_cm INT,
    product_width_cm INT
);
CREATE TABLE olist_sellers (
    seller_id VARCHAR(50) PRIMARY KEY,
    seller_zip_code_prefix INT,
    seller_city VARCHAR(100),
    seller_state VARCHAR(2)
);

CREATE TABLE product_category_name_translation (
    product_category_name VARCHAR(100) PRIMARY KEY,
    product_category_name_english VARCHAR(100)
);

-- Ee dataset lo yedho problem unnattu undhi, so, data ni manual ga enter chesaam
INSERT INTO product_category_name_translation (product_category_name, product_category_name_english) VALUES
('beleza_saude', 'health_beauty'),
('informatica_acessorios', 'computers_accessories'),
('automotivo', 'auto'),
('cama_mesa_banho', 'bed_bath_table'),
('moveis_decoracao', 'furniture_decor'),
('esporte_lazer', 'sports_leisure'),
('perfumaria', 'perfumery'),
('utilidades_domesticas', 'housewares'),
('telefonia', 'telephony'),
('relogios_presentes', 'watches_gifts'),
('alimentos_bebidas', 'food_drink'),
('bebes', 'baby'),
('papelaria', 'stationery'),
('tablets_impressao_imagem', 'tablets_printing_image'),
('brinquedos', 'toys'),
('telefonia_fixa', 'fixed_telephony'),
('ferramentas_jardim', 'garden_tools'),
('fashion_bolsas_e_acessorios', 'fashion_bags_accessories'),
('eletroportateis', 'small_appliances'),
('consoles_games', 'consoles_games'),
('audio', 'audio'),
('fashion_calcados', 'fashion_shoes'),
('cool_stuff', 'cool_stuff'),
('malas_acessorios', 'luggage_accessories'),
('climatizacao', 'air_conditioning'),
('construcao_ferramentas_construcao', 'construction_tools_construction'),
('moveis_cozinha_area_de_servico_jantar_e_jardim', 'kitchen_dining_laundry_garden_furniture'),
('construcao_ferramentas_jardim', 'costruction_tools_garden'),
('fashion_roupa_masculina', 'fashion_male_clothing'),
('pet_shop', 'pet_shop'),
('moveis_escritorio', 'office_furniture'),
('market_place', 'market_place'),
('eletronicos', 'electronics'),
('eletrodomesticos', 'home_appliances'),
('artigos_de_festas', 'party_supplies'),
('casa_conforto', 'home_confort'),
('construcao_ferramentas_ferramentas', 'costruction_tools_tools'),
('agro_industria_e_comercio', 'agro_industry_and_commerce'),
('moveis_colchao_e_estofado', 'furniture_mattress_and_upholstery'),
('livros_tecnicos', 'books_technical'),
('casa_construcao', 'home_construction'),
('instrumentos_musicais', 'musical_instruments'),
('moveis_sala', 'furniture_living_room'),
('construcao_ferramentas_iluminacao', 'construction_tools_lights'),
('industria_comercio_e_negocios', 'industry_commerce_and_business'),
('alimentos', 'food'),
('artes', 'art'),
('moveis_quarto', 'furniture_bedroom'),
('livros_interesse_geral', 'books_general_interest'),
('construcao_ferramentas_seguranca', 'construction_tools_safety'),
('fashion_underwear_e_moda_praia', 'fashion_underwear_beach'),
('fashion_esporte', 'fashion_sport'),
('sinalizacao_e_seguranca', 'signaling_and_security'),
('pcs', 'computers'),
('artigos_de_natal', 'christmas_supplies'),
('fashion_roupa_feminina', 'fashio_female_clothing'),
('eletrodomesticos_2', 'home_appliances_2'),
('livros_importados', 'books_imported'),
('bebidas', 'drinks'),
('cine_foto', 'cine_photo'),
('la_cuisine', 'la_cuisine'),
('musica', 'music'),
('casa_conforto_2', 'home_comfort_2'),
('portateis_casa_forno_e_cafe', 'small_appliances_home_oven_and_coffee'),
('cds_dvds_musicais', 'cds_dvds_musicals'),
('dvds_blu_ray', 'dvds_blu_ray'),
('flores', 'flowers'),
('artes_e_artesanato', 'arts_and_craftmanship'),
('fraldas_higiene', 'diapers_and_hygiene'),
('fashion_roupa_infanto_juvenil', 'fashion_childrens_clothes'),
('seguros_e_servicos', 'security_and_services');

######### Now we are done with the Loading of the data ##################

/*
olist_customers(customer_id, customer_unique_id, customer_zip_code_prefix, customer_city, customer_state)
olist_geolocation(geolocation_zip_code_prefix, geolocation_lat, geolocation_lng, geolocation_city, geolocation_state)
olist_order_items(order_id, order_item_id, product_id, seller_id, shipping_limit_date, price, freight_value)
olist_order_payments(order_id, payment_sequential, payment_type, payment_installments, payment_value)
olist_order_reviews(review_id, order_id, review_score, review_comment_title, review_comment_message, review_creation_date, review_answer_timestamp)
olist_orders(order_id, customer_id, order_status, order_purchase_timestamp, order_approved_at, order_delivery_carrier_date, order_delivered_customer_date, order_estimated_delivery_date)
olist_products(product_id, product_category_name, product_name_length, product_description_length, product_photos_qty, product_weight_g, product_length_cm, product_height_cm, product_width_cm)
olist_sellers(seller_id, seller_zip_code_prefix, seller_city, seller_state)
product_category_name_translation(product_category_name, product_category_name_english)
*/

-- correcting the spelling mistake of the columns name, in future to avoid errors
ALTER TABLE olist_products 
    RENAME COLUMN product_name_lenght TO product_name_length,
    RENAME COLUMN product_description_lenght TO product_description_length;

### Q1) what's the average review score by product category?

order_estimated_delivery_dateSELECT p.product_category_name, ROUND(AVG(r.review_score),2) AS Average_Rating
FROM olist_order_reviews r
JOIN olist_order_items i ON (r.order_id=i.order_id)
JOIN olist_products p ON (p.product_id=i.product_id)
GROUP BY p.product_category_name
ORDER BY Average_Rating DESC

### Q2) What is the average delivery time (in days) by customer state, only for delivered orders?
SELECT *
FROM olist_orders;
SELECT c.customer_state,
ROUND(AVG(DATEDIFF(o.order_delivered_customer_date, o.order_purchase_timestamp)),2) AS Average_delivery_days
FROM olist_orders o
LEFT JOIN olist_customers c ON (o.customer_id=c.customer_id)
WHERE o.order_status='delivered'
GROUP BY c.customer_state;

### Q3) What are the top 10 product categories by revenue?
SELECT *
FROM olist_order_payments;
SELECT *
FROM olist_order_items;

SELECT price, freight_value, payment_value, payment_type, payment_sequential, payment_installments 
FROM olist_order_items i
RIGHT JOIN olist_order_payments p ON (p.order_id=i.order_id);
