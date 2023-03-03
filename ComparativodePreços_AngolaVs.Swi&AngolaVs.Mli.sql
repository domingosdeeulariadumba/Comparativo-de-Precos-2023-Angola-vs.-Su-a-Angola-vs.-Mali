/*
Neste projecto, eu apresento uma base de dados com informações referentes aos preços, em doláres americanos dos principais bens e serviços oferecidos em Angola tendo como referencias comparativas os
dois países posicionados no extremo do ranking de IDH, nomeadamente: Suiça e Mali (na ausencia de Chad). Fonte: https://pt.preciosmundi.com/; https://hdr.undp.org/data-center/country-insights#/ranks (dados de fevereiro de 2023) | -In this project, I present a database with 
information regarding the prices, in USD, of the main goods and services offered in Angola, having as comparative references the two countries positioned at the extreme of the HDI ranking, namely:
Switzerland and Mali (once Chad has no data in one of the sources). Source: https://pt.preciosmundi.com/, https://hdr.undp.org/data-center/country-insights#/ranks (data from February 2023)
*/


/*Criação da base de dados| Creating the database*/
CREATE DATABASE PricesAoSwiMli2023;

/*Criação da primeira tabela (Angola Vs. Suiça)| Creating the first table (Angola Vs. Switzerland)*/
CREATE TABLE PricesAoSwi (
IDItem INT IDENTITY(1,1) PRIMARY KEY,
ProductOrService VARCHAR (50) UNIQUE,
Sector VARCHAR (50),
PriceAo REAL,
PriceSwi REAL,
);

EXEC sp_COLUMNS PricesAoSwi;

/*Inserindo dados na primeira tabela|Inserting data into the first table*/



INSERT INTO PricesAoSwi (ProductOrService, Sector, PriceAo, PriceSwi)
VALUES('Cerveja Importada 330 ml', 'Cesta Básica', 0.79, 2.7);

INSERT INTO PricesAoSwi (ProductOrService, Sector, PriceAo, PriceSwi)
VALUES('Cerveja Nacional 0.5 L', 'Cesta Básica', 0.89, 2.2);

INSERT INTO PricesAoSwi (ProductOrService, Sector, PriceAo, PriceSwi)
VALUES
('Garrafa de Vinho (Qualidade Média)', 'Cesta Básica', 9.92, 14.32),
('Água (Garrafa de 1.5 L)', 'Cesta Básica', 1.07, 1.35);

INSERT INTO PricesAoSwi (ProductOrService, Sector, PriceAo, PriceSwi)
VALUES('Alface (1 unidade)', 'Cesta Básica', 1.11, 2.46),
('Cebolas (1 Kg)', 'Cesta Básica', 1.59, 2.49),
('Batatas (1 Kg)', 'Cesta Básica', 1.49, 2.63),
('Tomates (1 Kg)', 'Cesta Básica', 2.38, 4.30),
('Laranjas (1 Kg)', 'Cesta Básica', 4.96, 3.41),
('Bananas (1 Kg)', 'Cesta Básica', 1.43, 2.90),
('Maçãs (1 Kg)', 'Cesta Básica', 3.37, 4.19),
('Queijo Freco (1 Kg)', 'Cesta Básica', 12.49, 26.56),
('Ovos (1 dúzia)', 'Cesta Básica', 3.57, 6.39),
('Arroz (1 Kg)', 'Cesta Básica', 1.09, 3.14),
('Pão (1 Kg)', 'Cesta Básica', 1.43, 3.30),
('Leite (1 L)', 'Cesta Básica', 2.38, 1.80);

EXEC sp_RENAME 'PricesAoSwi.Sector', 'Class', 'COLUMN';

INSERT INTO PricesAoSwi (ProductOrService, Class, PriceAo, PriceSwi)
VALUES('Agua (garrafa de 330 ml)', 'Restaurantes', 1.17, 4.08),
('Coca-Cola/Pepsi (330 ml)', 'Restaurantes', 1.84, 4.52),
('Capuccino', 'Restaurantes', 4.16, 5.29),
('Cerveja importada (garrafa de 330 ml)', 'Restaurantes', 1.25, 6.61),
('Cerveja Nacional (0.5L)', 'Restaurantes', 2.18, 7.16),
('Menu McDonalds, Burger King ou Similares', 'Restaurantes', 9.92, 16.52);

ALTER TABLE PricesAoSwi
ALTER COLUMN ProductOrService VARCHAR (150);

INSERT INTO PricesAoSwi (ProductOrService, Class, PriceAo, PriceSwi)
VALUES
('Almoço para dois em um Restaurante (dois pratos principais e sobremesa)', 'Restaurantes', 67.84, 110.18),
('Comida em um Restaurante Barato)', 'Restaurantes', 7.34, 27.55);

INSERT INTO PricesAoSwi (ProductOrService, Class, PriceAo, PriceSwi)
VALUES
('Sapato de Couro Masculino', 'Vestuário e Calçado', 237.63, 167.46),
('Ténis Desportivo de Marca (Nike, Adidas, Puma, etc)', 'Vestuário e Calçado', 252.31, 125.6),
('1 Vestido', 'Vestuário e Calçado', 149.96, 56.19),
('Jeans Levis 501 (ou equivalente)', 'Vestuário e Calçado', 95.81, 115.68);

INSERT INTO PricesAoSwi (ProductOrService, Class, PriceAo, PriceSwi)
VALUES
('Volkswagen Golf 1,4 90 kw (ou um carro novo equivalente)', 'Transporte e Bens Associados', 20899.76, 33052.87),
('Gasolina (1L)', 'Transporte e Bens Associados', 0.35, 2.1),
('1 Hora de Taxi (bandeira 1))', 'Transporte e Bens Associados', 7.93, 76.02),
('Taxi Tarifa ao km (bandeira 1)', 'Transporte e Bens Associados', 1.67, 4.3),
('Valor Inicial (bandeira 1)', 'Transporte e Bens Associados', 31.74, 88.14),
('Bilhete Unitário em Transporte Público)', 'Transporte e Bens Associados', 0.35, 3.86);

INSERT INTO PricesAoSwi (ProductOrService, Class, PriceAo, PriceSwi)
VALUES
('Internet (6 Mbps, plano, a cabo/ADSL))', 'Serviços', 186.06, 58.40),
('Preço por minuto de ligação local de celular prepago (Sem descontos ou planos))', 'Serviços', 0.31, 0.13),
('Básicos (electricidade, gás, água, lixo))', 'Serviços', 77.95, 242.38);

INSERT INTO PricesAoSwi (ProductOrService, Class, PriceAo, PriceSwi)
VALUES
('Comprar casa no subúrbio (preço por m2))', 'Habitação e Salários', 4059.79, 9805.69),
('Comprar casa no centro da cidade (preço por m2))', 'Habitação e Salários', 5126.95, 1443309),
('Apartamento (3 quartos) no subúrbio ou em um vilarejo)', 'Habitação e Salários', 1304.20, 2534.05),
('Apartamento (3 quartos) no centro da cidade)', 'Habitação e Salários', 6868.33, 3195.11),
('Apartamento (1 quarto) no subúrbio ou em um vilarejo))', 'Habitação e Salários', 80.73, 1432.29),
('Apartamento (1 quarto) no centro da cidade)', 'Habitação e Salários', 346.13, 1762.82);

UPDATE PricesAoSwi SET Class = 'Habitação' WHERE Class= 'Habitação e Salários';

INSERT INTO PricesAoSwi (ProductOrService, Class, PriceAo, PriceSwi)
VALUES
('Hipoteca: taxa de juros anual (%))', 'Salários', 25%, 1.57%),
('Salário (salário mensal) médio depois de impostos (líquido))', 'Salários', 3270.52, 5949.51);

UPDATE PricesAoSwi SET PriceAo = 0.25 WHERE IDItem= 54;
UPDATE PricesAoSwi SET PriceSwi = 0.0157 WHERE IDItem= 54;

INSERT INTO PricesAoSwi (ProductOrService, Class, PriceAo, PriceSwi)
VALUES
('(Tênis Desportivos de Marca (Nike, Adidas, Puma, etc.))', 'Desporto', 252.31, 125.6),
('Aluguel de quadra de tênis (1 hora))', 'Desporto', 16.66, 40.1),
('Ginásio (preço mensal))', 'Desporto', 40.07, 85.93);

INSERT INTO PricesAoSwi (ProductOrService, Class, PriceAo, PriceSwi)
VALUES
('Cinema (entrada/bilhete))', 'Recreação', 5.35, 20.94),
('Maço de cigarro (Marlboro)', 'Recreação', 2.38, 9.69);
		-- alteração de alguns atributos para facilitar o entendimento dos dados | I updated some atributes to make the data better understanding--
EXEC sp_RENAME 'PricesAoSwi.IDItem', 'IDAoSwi', 'COLUMN';
EXEC sp_RENAME 'PricesAoSwi.PriceAo', 'PriceAoSwi', 'COLUMN';
SELECT * FROM PricesAoSwi;
/*Criação da segunda tabela (Angola Vs. Mali)| Creating the Second table (Angola Vs. Mali)*/
CREATE TABLE PricesAoMli(
IDAoMli INT IDENTITY (61, 1) PRIMARY KEY,
ProductOrService VARCHAR (150),
CLASS VARCHAR (50),
PriceAoMli REAL,
PriceMli REAL);

EXEC sp_RENAME 'PricesAoMli.CLASS', 'Class', 'COLUMN'

/*Inserindo dados na segunda tabela|Inserting data into the second table*/
INSERT INTO PricesAoMli(ProductOrService, Class, PriceAoMli, PriceMli) 
VALUES
('Cerveja Importada 330 ml', 'Cesta Básica', 0.79, 1.85),
('Cerveja Nacional 0.5 L', 'Cesta Básica', 0.89, 1.65),
('Garrafa de Vinho (Qualidade Média)', 'Cesta Básica', 9.92, 4.53),
('Água (Garrafa de 1.5 L)', 'Cesta Básica', 1.07, 0.81),
('Alface (1 unidade)', 'Cesta Básica', 1.11, 0.33),
('Cebolas (1 Kg)', 'Cesta Básica', 1.59, 1.33),
('Batatas (1 Kg)', 'Cesta Básica', 1.49, 1.01),
('Tomates (1 Kg)', 'Cesta Básica', 2.85, 2.38),
('Laranjas (1 Kg)', 'Cesta Básica', 4.96, 2.35),
('Bananas (1 Kg)', 'Cesta Básica', 1.43, 1.04),
('Queijo Freco (1 Kg)', 'Cesta Básica', 12.49, 15.61),
('Ovos (1 dúzia)', 'Cesta Básica', 3.57, 2.35),
('Arroz (1 Kg)', 'Cesta Básica', 1.09, 0.92),
('Pão (1 Kg)', 'Cesta Básica', 1.43, 1.43),
('Leite (1 L)', 'Cesta Básica', 2.38, 2.18);

INSERT INTO PricesAoMli(ProductOrService, Class, PriceAoMli, PriceMli) 
VALUES
('Agua (garrafa de 330 ml)', 'Restaurantes', 1.17, 0.59),
('Coca-Cola/Pepsi (330 ml)', 'Restaurantes', 1.84, 0.81),
('Capuccino', 'Restaurantes', 4.16, 2.85),
('Cerveja importada (garrafa de 330 ml)', 'Restaurantes', 1.25, 3.02),
('Cerveja Nacional (0.5L)', 'Restaurantes', 2.18, 2.01),
('Menu McDonalds, Burger King ou Similares', 'Restaurantes', 9.92, 5.04),
('Almoço para dois em um Restaurante (dois pratos principais e sobremesa)', 'Restaurantes', 67.84, 38.79),
('Comida em um Restaurante Barato)', 'Restaurantes', 7.34, 6.04);

INSERT INTO PricesAoMli(ProductOrService, Class, PriceAoMli, PriceMli)
VALUES
('Sapato de Couro Masculino', 'Vestuário e Calçado', 237.63, 124.77),
('Ténis Desportivo de Marca (Nike, Adidas, Puma, etc)', 'Vestuário e Calçado', 252.31, NULL),
('1 Vestido', 'Vestuário e Calçado', 149.96, 25.03),
('Jeans Levis 501 (ou equivalente)', 'Vestuário e Calçado', 95.81, NULL);

INSERT INTO PricesAoMli(ProductOrService, Class, PriceAoMli, PriceMli)
VALUES
('Volkswagen Golf 1,4 90 kw (ou um carro novo equivalente)', 'Transporte e Bens Associados', 20899.76, 49914.13),
('Gasolina (1L)', 'Transporte e Bens Associados', 0.35, 1.29),
('1 Hora de Taxi (bandeira 1))', 'Transporte e Bens Associados', 7.93, NULL),
('Taxi Tarifa ao km (bandeira 1)', 'Transporte e Bens Associados', 1.67, 1.24),
('Valor Inicial (bandeira 1)', 'Transporte e Bens Associados', 31.74, NULL),
('Bilhete Unitário em Transporte Público)', 'Transporte e Bens Associados', 0.35, 4.7);

INSERT INTO PricesAoMli(ProductOrService, Class, PriceAoMli, PriceMli)
VALUES
('Internet (6 Mbps, plano, a cabo/ADSL))', 'Serviços', 186.06, 35.94),
('Preço por minuto de ligação local de celular prepago (Sem descontos ou planos))', 'Serviços', 0.13, 0.21),
('Básicos (electricidade, gás, água, lixo))', 'Serviços', 77.95, 266.84);

INSERT INTO PricesAoMli(ProductOrService, Class, PriceAoMli, PriceMli)
VALUES
('Comprar casa no subúrbio (preço por m2))', 'Habitação', 4059.79, NULL),
('Comprar casa no centro da cidade (preço por m2))', 'Habitação', 5126.95, NULL),
('Apartamento (3 quartos) no subúrbio ou em um vilarejo)', 'Habitação', 1304.20, 884.5),
('Apartamento (3 quartos) no centro da cidade)', 'Habitação', 6868.33, 134.8),
('Apartamento (1 quarto) no subúrbio ou em um vilarejo))', 'Habitação', 80.73, 537.54),
('Apartamento (1 quarto) no centro da cidade)', 'Habitação', 346.13, 998.35);

INSERT INTO PricesAoMli(ProductOrService, Class, PriceAoMli, PriceMli)
VALUES
('Hipoteca: taxa de juros anual (%))', 'Salários', 0.25, 0.12),
('Salário (salário mensal) médio depois de impostos (líquido))', 'Salários', 3270.52, 109.32);

INSERT INTO PricesAoMli(ProductOrService, Class, PriceAoMli, PriceMli)
VALUES
('(Tênis Desportivos de Marca (Nike, Adidas, Puma, etc.))', 'Desporto', 252.31, NULL),
('Aluguel de quadra de tênis (1 hora))', 'Desporto', 16.66, 14.44),
('Ginásio (preço mensal))', 'Desporto', 40.07, 69.86);

INSERT INTO PricesAoMli(ProductOrService, Class, PriceAoMli, PriceMli)
VALUES
('Cinema (entrada/bilhete))', 'Recreação', 5.35, 6.04),
('Maço de cigarro (Marlboro)', 'Recreação', 2.38, 1.49);


-- correção do dado referente a classe de serviços/correction regarding 'Serviços' class--
UPDATE PriceAoSwi SET PriceSwi = 0.31 WHERE Class= 'Serviços';
UPDATE PriceAoSwi SET PriceAoSwi = 0.13 WHERE Class= 'Serviços'

-- nova correção do dado referente a classe de serviços por aplicação equívoca da sintaxe/new correction regarding 'serviços' class due to mistaken application of the syntax --
UPDATE PricesAoSwi SET PriceAoSwi = 186.06 WHERE IDAoSwi= 35;
UPDATE PricesAoSwi SET PriceSwi = 58.45 WHERE IDAoSwi= 35;

UPDATE PricesAoSwi SET PriceAoSwi = 77.95 WHERE IDAoSwi= 37;
UPDATE PricesAoSwi SET PriceSwi = 242.38 WHERE IDAoSwi= 37;

--Até aqui, inserimos os dados das duas tabelas. daremos sequencia com algumas operações. |We have entered data from both tables. we will proceed with some operations.











