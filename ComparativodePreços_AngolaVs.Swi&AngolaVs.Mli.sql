/*
Neste projecto, eu apresento uma base de dados com informa��es referentes aos pre�os, em dol�res americanos dos principais bens e servi�os oferecidos em Angola tendo como referencias comparativas os
dois pa�ses posicionados no extremo do ranking de IDH, nomeadamente: Sui�a e Mali (na ausencia de Chad). Fonte: https://pt.preciosmundi.com/; https://hdr.undp.org/data-center/country-insights#/ranks (dados de fevereiro de 2023) | -In this project, I present a database with 
information regarding the prices, in USD, of the main goods and services offered in Angola, having as comparative references the two countries positioned at the extreme of the HDI ranking, namely:
Switzerland and Mali (once Chad has no data in one of the sources). Source: https://pt.preciosmundi.com/, https://hdr.undp.org/data-center/country-insights#/ranks (data from February 2023)
*/


/*Cria��o da base de dados| Creating the database*/

CREATE DATABASE PricesAoSwiMli2023;


/*Cria��o da primeira tabela (Angola Vs. Sui�a)| Creating the first table (Angola Vs. Switzerland)*/

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
VALUES('Cerveja Importada 330 ml', 'Cesta B�sica', 0.79, 2.7);

INSERT INTO PricesAoSwi (ProductOrService, Sector, PriceAo, PriceSwi)
VALUES('Cerveja Nacional 0.5 L', 'Cesta B�sica', 0.89, 2.2);

INSERT INTO PricesAoSwi (ProductOrService, Sector, PriceAo, PriceSwi)
VALUES
('Garrafa de Vinho (Qualidade M�dia)', 'Cesta B�sica', 9.92, 14.32),
('�gua (Garrafa de 1.5 L)', 'Cesta B�sica', 1.07, 1.35);

INSERT INTO PricesAoSwi (ProductOrService, Sector, PriceAo, PriceSwi)
VALUES('Alface (1 unidade)', 'Cesta B�sica', 1.11, 2.46),
('Cebolas (1 Kg)', 'Cesta B�sica', 1.59, 2.49),
('Batatas (1 Kg)', 'Cesta B�sica', 1.49, 2.63),
('Tomates (1 Kg)', 'Cesta B�sica', 2.38, 4.30),
('Laranjas (1 Kg)', 'Cesta B�sica', 4.96, 3.41),
('Bananas (1 Kg)', 'Cesta B�sica', 1.43, 2.90),
('Ma��s (1 Kg)', 'Cesta B�sica', 3.37, 4.19),
('Queijo Freco (1 Kg)', 'Cesta B�sica', 12.49, 26.56),
('Ovos (1 d�zia)', 'Cesta B�sica', 3.57, 6.39),
('Arroz (1 Kg)', 'Cesta B�sica', 1.09, 3.14),
('P�o (1 Kg)', 'Cesta B�sica', 1.43, 3.30),
('Leite (1 L)', 'Cesta B�sica', 2.38, 1.80);

		-- corre��o do pre�o de "tomates" na Sui�a | correcting the price of "tomatoes" in Switzerland--
		UPDATE PricesAoSwi
		Set PriceSwi = 4.29 WHERE PricesAoSwi.ProductOrService ='Tomates (1 kg)';

		-- altera��o do nome da coluna de 'Sector' para 'Class' | column name changed from 'Sector' to 'Class'--
		EXEC sp_RENAME 'PricesAoSwi.Sector', 'Class', 'COLUMN';

INSERT INTO PricesAoSwi (ProductOrService, Class, PriceAo, PriceSwi)
VALUES('Agua (garrafa de 330 ml)', 'Restaurantes', 1.17, 4.08),
('Coca-Cola/Pepsi (330 ml)', 'Restaurantes', 1.84, 4.52),
('Capuccino', 'Restaurantes', 4.16, 5.29),
('Cerveja importada (garrafa de 330 ml)', 'Restaurantes', 1.25, 6.61),
('Cerveja Nacional (0.5L)', 'Restaurantes', 2.18, 7.16),
('Menu McDonalds, Burger King ou Similares', 'Restaurantes', 9.92, 16.52);
		
		-- alterando o tamanho da vari�vel 'ProductOrService' | changing the size of 'ProductOrService' attribute --
		ALTER TABLE PricesAoSwi
		ALTER COLUMN ProductOrService VARCHAR (150);

INSERT INTO PricesAoSwi (ProductOrService, Class, PriceAo, PriceSwi)
VALUES
('Almo�o para dois em um Restaurante (dois pratos principais e sobremesa)', 'Restaurantes', 67.84, 110.18),
('Comida em um Restaurante Barato)', 'Restaurantes', 7.34, 27.55);

INSERT INTO PricesAoSwi (ProductOrService, Class, PriceAo, PriceSwi)
VALUES
('Sapato de Couro Masculino', 'Vestu�rio e Cal�ado', 237.63, 167.46),
('T�nis Desportivo de Marca (Nike, Adidas, Puma, etc)', 'Vestu�rio e Cal�ado', 252.31, 125.6),
('1 Vestido', 'Vestu�rio e Cal�ado', 149.96, 56.19),
('Jeans Levis 501 (ou equivalente)', 'Vestu�rio e Cal�ado', 95.81, 115.68);

INSERT INTO PricesAoSwi (ProductOrService, Class, PriceAo, PriceSwi)
VALUES
('Volkswagen Golf 1,4 90 kw (ou um carro novo equivalente)', 'Transporte e Bens Associados', 20899.76, 33052.87),
('Gasolina (1L)', 'Transporte e Bens Associados', 0.35, 2.1),
('1 Hora de Taxi (bandeira 1))', 'Transporte e Bens Associados', 7.93, 76.02),
('Taxi Tarifa ao km (bandeira 1)', 'Transporte e Bens Associados', 1.67, 4.3),
('Valor Inicial (bandeira 1)', 'Transporte e Bens Associados', 31.74, 88.14),
('Bilhete Unit�rio em Transporte P�blico)', 'Transporte e Bens Associados', 0.35, 3.86);

INSERT INTO PricesAoSwi (ProductOrService, Class, PriceAo, PriceSwi)
VALUES
('Internet (6 Mbps, plano, a cabo/ADSL))', 'Servi�os', 186.06, 58.40),
('Pre�o por minuto de liga��o local de celular prepago (Sem descontos ou planos))', 'Servi�os', 0.31, 0.13),
('B�sicos (electricidade, g�s, �gua, lixo))', 'Servi�os', 77.95, 242.38);

INSERT INTO PricesAoSwi (ProductOrService, Class, PriceAo, PriceSwi)
VALUES
('Comprar casa no sub�rbio (pre�o por m2))', 'Habita��o e Sal�rios', 4059.79, 9805.69),
('Comprar casa no centro da cidade (pre�o por m2))', 'Habita��o e Sal�rios', 5126.95, 1443309),
('Apartamento (3 quartos) no sub�rbio ou em um vilarejo)', 'Habita��o e Sal�rios', 1304.20, 2534.05),
('Apartamento (3 quartos) no centro da cidade)', 'Habita��o e Sal�rios', 6868.33, 3195.11),
('Apartamento (1 quarto) no sub�rbio ou em um vilarejo))', 'Habita��o e Sal�rios', 80.73, 1432.29),
('Apartamento (1 quarto) no centro da cidade)', 'Habita��o e Sal�rios', 346.13, 1762.82);

UPDATE PricesAoSwi SET Class = 'Habita��o' WHERE Class= 'Habita��o e Sal�rios';

INSERT INTO PricesAoSwi (ProductOrService, Class, PriceAo, PriceSwi)
VALUES
('Hipoteca: taxa de juros anual (%))', 'Sal�rios', 25%, 1.57%),
('Sal�rio (sal�rio mensal) m�dio depois de impostos (l�quido))', 'Sal�rios', 3270.52, 5949.51);

UPDATE PricesAoSwi SET PriceAo = 0.25 WHERE IDItem= 54;
UPDATE PricesAoSwi SET PriceSwi = 0.0157 WHERE IDItem= 54;

INSERT INTO PricesAoSwi (ProductOrService, Class, PriceAo, PriceSwi)
VALUES
('(T�nis Desportivos de Marca (Nike, Adidas, Puma, etc.))', 'Desporto', 252.31, 125.6),
('Aluguel de quadra de t�nis (1 hora))', 'Desporto', 16.66, 40.1),
('Gin�sio (pre�o mensal))', 'Desporto', 40.07, 85.93);

INSERT INTO PricesAoSwi (ProductOrService, Class, PriceAo, PriceSwi)
VALUES
('Cinema (entrada/bilhete))', 'Recrea��o', 5.35, 20.94),
('Ma�o de cigarro (Marlboro)', 'Recrea��o', 2.38, 9.69);


		-- altera��o de alguns atributos para facilitar o entendimento dos dados | update of some atributes to make the data better understanding--
		EXEC sp_RENAME 'PricesAoSwi.IDItem', 'IDAoSwi', 'COLUMN';
		EXEC sp_RENAME 'PricesAoSwi.PriceAo', 'PriceAoSwi', 'COLUMN';
		SELECT * FROM PricesAoSwi;


/*Cria��o da segunda tabela (Angola Vs. Mali)| Creating the Second table (Angola Vs. Mali)*/

CREATE TABLE PricesAoMli(
IDAoMli INT IDENTITY (61, 1) PRIMARY KEY,
ProductOrService VARCHAR (150),
CLASS VARCHAR (50),
PriceAoMli REAL,
PriceMli REAL);

		-- altera��o do formato do atributo 'CLASS' para 'Class' | Changing the 'CLASS' attribute format to 'Class' --
		EXEC sp_RENAME 'PricesAoMli.CLASS', 'Class', 'COLUMN'


/*Inserindo dados na segunda tabela|Inserting data into the second table*/

INSERT INTO PricesAoMli(ProductOrService, Class, PriceAoMli, PriceMli) 
VALUES
('Cerveja Importada 330 ml', 'Cesta B�sica', 0.79, 1.85),
('Cerveja Nacional 0.5 L', 'Cesta B�sica', 0.89, 1.65),
('Garrafa de Vinho (Qualidade M�dia)', 'Cesta B�sica', 9.92, 4.53),
('�gua (Garrafa de 1.5 L)', 'Cesta B�sica', 1.07, 0.81),
('Alface (1 unidade)', 'Cesta B�sica', 1.11, 0.33),
('Cebolas (1 Kg)', 'Cesta B�sica', 1.59, 1.33),
('Batatas (1 Kg)', 'Cesta B�sica', 1.49, 1.01),
('Tomates (1 Kg)', 'Cesta B�sica', 2.85, 2.38),
('Laranjas (1 Kg)', 'Cesta B�sica', 4.96, 2.35),
('Bananas (1 Kg)', 'Cesta B�sica', 1.43, 1.04),
('Queijo Freco (1 Kg)', 'Cesta B�sica', 12.49, 15.61),
('Ovos (1 d�zia)', 'Cesta B�sica', 3.57, 2.35),
('Arroz (1 Kg)', 'Cesta B�sica', 1.09, 0.92),
('P�o (1 Kg)', 'Cesta B�sica', 1.43, 1.43),
('Leite (1 L)', 'Cesta B�sica', 2.38, 2.18);

INSERT INTO PricesAoMli(ProductOrService, Class, PriceAoMli, PriceMli) 
VALUES
('Agua (garrafa de 330 ml)', 'Restaurantes', 1.17, 0.59),
('Coca-Cola/Pepsi (330 ml)', 'Restaurantes', 1.84, 0.81),
('Capuccino', 'Restaurantes', 4.16, 2.85),
('Cerveja importada (garrafa de 330 ml)', 'Restaurantes', 1.25, 3.02),
('Cerveja Nacional (0.5L)', 'Restaurantes', 2.18, 2.01),
('Menu McDonalds, Burger King ou Similares', 'Restaurantes', 9.92, 5.04),
('Almo�o para dois em um Restaurante (dois pratos principais e sobremesa)', 'Restaurantes', 67.84, 38.79),
('Comida em um Restaurante Barato)', 'Restaurantes', 7.34, 6.04);

INSERT INTO PricesAoMli(ProductOrService, Class, PriceAoMli, PriceMli)
VALUES
('Sapato de Couro Masculino', 'Vestu�rio e Cal�ado', 237.63, 124.77),
('T�nis Desportivo de Marca (Nike, Adidas, Puma, etc)', 'Vestu�rio e Cal�ado', 252.31, NULL),
('1 Vestido', 'Vestu�rio e Cal�ado', 149.96, 25.03),
('Jeans Levis 501 (ou equivalente)', 'Vestu�rio e Cal�ado', 95.81, NULL);

INSERT INTO PricesAoMli(ProductOrService, Class, PriceAoMli, PriceMli)
VALUES
('Volkswagen Golf 1,4 90 kw (ou um carro novo equivalente)', 'Transporte e Bens Associados', 20899.76, 49914.13),
('Gasolina (1L)', 'Transporte e Bens Associados', 0.35, 1.29),
('1 Hora de Taxi (bandeira 1))', 'Transporte e Bens Associados', 7.93, NULL),
('Taxi Tarifa ao km (bandeira 1)', 'Transporte e Bens Associados', 1.67, 1.24),
('Valor Inicial (bandeira 1)', 'Transporte e Bens Associados', 31.74, NULL),
('Bilhete Unit�rio em Transporte P�blico)', 'Transporte e Bens Associados', 0.35, 4.7);

INSERT INTO PricesAoMli(ProductOrService, Class, PriceAoMli, PriceMli)
VALUES
('Internet (6 Mbps, plano, a cabo/ADSL))', 'Servi�os', 186.06, 35.94),
('Pre�o por minuto de liga��o local de celular prepago (Sem descontos ou planos))', 'Servi�os', 0.13, 0.21),
('B�sicos (electricidade, g�s, �gua, lixo))', 'Servi�os', 77.95, 266.84);

INSERT INTO PricesAoMli(ProductOrService, Class, PriceAoMli, PriceMli)
VALUES
('Comprar casa no sub�rbio (pre�o por m2))', 'Habita��o', 4059.79, NULL),
('Comprar casa no centro da cidade (pre�o por m2))', 'Habita��o', 5126.95, NULL),
('Apartamento (3 quartos) no sub�rbio ou em um vilarejo)', 'Habita��o', 1304.20, 884.5),
('Apartamento (3 quartos) no centro da cidade)', 'Habita��o', 6868.33, 134.8),
('Apartamento (1 quarto) no sub�rbio ou em um vilarejo))', 'Habita��o', 80.73, 537.54),
('Apartamento (1 quarto) no centro da cidade)', 'Habita��o', 346.13, 998.35);

INSERT INTO PricesAoMli(ProductOrService, Class, PriceAoMli, PriceMli)
VALUES
('Hipoteca: taxa de juros anual (%))', 'Sal�rios', 0.25, 0.12),
('Sal�rio (sal�rio mensal) m�dio depois de impostos (l�quido))', 'Sal�rios', 3270.52, 109.32);

INSERT INTO PricesAoMli(ProductOrService, Class, PriceAoMli, PriceMli)
VALUES
('(T�nis Desportivos de Marca (Nike, Adidas, Puma, etc.))', 'Desporto', 252.31, NULL),
('Aluguel de quadra de t�nis (1 hora))', 'Desporto', 16.66, 14.44),
('Gin�sio (pre�o mensal))', 'Desporto', 40.07, 69.86);

INSERT INTO PricesAoMli(ProductOrService, Class, PriceAoMli, PriceMli)
VALUES
('Cinema (entrada/bilhete))', 'Recrea��o', 5.35, 6.04),
('Ma�o de cigarro (Marlboro)', 'Recrea��o', 2.38, 1.49);


		-- corre��o do dado referente a classe de servi�os/correction regarding 'Servi�os' class--
		UPDATE PriceAoSwi SET PriceSwi = 0.31 WHERE Class= 'Servi�os';
		UPDATE PriceAoSwi SET PriceAoSwi = 0.13 WHERE Class= 'Servi�os';

		-- nova corre��o do dado referente a classe de servi�os por aplica��o equ�voca da sintaxe/new correction regarding 'servi�os' class due to mistaken application of the syntax --
		UPDATE PricesAoSwi SET PriceAoSwi = 186.06 WHERE IDAoSwi= 35;
		UPDATE PricesAoSwi SET PriceSwi = 58.45 WHERE IDAoSwi= 35;
		UPDATE PricesAoSwi SET PriceAoSwi = 77.95 WHERE IDAoSwi= 37;
		UPDATE PricesAoSwi SET PriceSwi = 242.38 WHERE IDAoSwi= 37;
		UPDATE PricesAoMli SET PriceMli=2.75 WHERE PricesAoMli.ProductOrService = 'Tomates (1 Kg)';
		UPDATE PricesAoMli SET PriceAoMli=2.38 WHERE PricesAoMli.ProductOrService = 'Tomates (1 Kg)';


--At� aqui, inserimos os dados das duas tabelas. daremos sequencia com algumas opera��es. |We have entered data from both tables. we will proceed with some operations.
SELECT * FROM PricesAoSwi;
SELECT * FROM PricesAoMli;




/*algumas opera��es entre as duas tabelas | some operations between the two tables*/



-- verificando se o n�mero de registo � proporcional nas duas tabelas | checking if we have the same number of records in the two tables. 
SELECT COUNT (ProductOrService) AS "Itens Angola e Su��a"  FROM PricesAoSwi;
SELECT COUNT (ProductOrService) AS "Itens Angola e Mali"  FROM PricesAoMli;

-- por, equivocadamente, n�o termos comparado o item ma�� para o caso de Angola e Mali, passaremos a inclu�-lo na linha de c�digo a seguir|because we have mistakenly not compared the "apple" item for angola and Mali, we will include it in the below line of code --
INSERT INTO PricesAoMli(ProductOrService, Class, PriceAoMli)
Values ('Ma��s (1 Kg)', 'Cesta B�sica',3.37);


-- queremos saber que produtos s�o comparativamente mais caros entre Angola e Sui�a, ordenados de maneira crescente | we want to know which products are comparatively more expensive between Angola and Switzerland, in ascending order --

SELECT ProductOrService AS 'Produtos mais baratos em angola que na Sui�a', PriceAoSwi, PriceSwi FROM PricesAoSwi WHERE PriceAoSwi < PriceSwi
ORDER BY PriceAoSwi ASC;


-- agora, no total dos bens compilados, quantos s�o mais caros em Angola, e quantos na Sui�a? | now, in the total of compiled goods, how many are more expensive in Angola, and how many in Switzerland? --

SELECT COUNT (ProductOrService) [Quantidade de Bens Mais Baratos em Angola que na Sui�a]
FROM PricesAoSwi WHERE PriceAoSwi < PriceSwi;

SELECT COUNT (ProductOrService) [Quantidade de Bens Mais Caros em Angola que na Sui�a] FROM PricesAoSwi WHERE PriceAoSwi > PriceSwi;


-- No total, em USD, onde os bens s�o mais caros? | Globally, in USD, where are goods most expensive? --

SELECT SUM(PriceAoSwi) [Total de Bens mais Baratos em Angola que na Sui�a ($)] FROM PricesAoSwi WHERE PriceAoSwi < PriceSwi;

SELECT SUM(PriceAoSwi) [Total de Bens mais Caros em Angola que na Sui�a ($)] FROM PricesAoSwi WHERE PriceAoSwi > PriceSwi;


-- que produto � mais caro em angola, e qual o seu valor? Qual o mais Barato? | what product is more expensive in angola, and what is its value? Which is the cheapest?--

SELECT PriceAoSwi, ProductOrService [Produto mais Caro em Angola] FROM PricesAoSwi WHERE PriceAoSwi IN (
	SELECT MAX (PriceAoSwi) [Produto mais Caro em Angola] FROM PricesAoSwi);

SELECT PriceAoSwi, ProductOrService [Produto mais Barato em Angola] FROM PricesAoSwi WHERE PriceAoSwi IN (
	SELECT MIN (PriceAoSwi) [Produto Menos Caro em Angola] FROM PricesAoSwi);


-- que produto � mais caro na Sui�a, e qual o seu valor? Qual o mais Barato? | which product is more expensive in Switzerland, and how much is it? Which is the cheapest?--

SELECT PriceSwi, ProductOrService [Produto mais Caro na Sui�a] FROM PricesAoSwi WHERE PriceSwi IN (
	SELECT MAX (PriceSwi) [Produto mais Caro em Angola] FROM PricesAoSwi);

SELECT PriceSwi, ProductOrService [Produto mais Barato na Sui�a] FROM PricesAoSwi WHERE PriceSwi IN (
	SELECT MIN (PriceSwi) [Produto Menos Caro em Angola] FROM PricesAoSwi);

	 
-- onde � que a cesta b�sica � mais cara? | where is the stapple foods more expensive?--

SELECT SUM(PriceAoSwi) [Total de Bens da Cesta B�sica em Angola ($)] FROM PricesAoSwi WHERE Class = 'Cesta B�sica';

SELECT SUM(PriceSwi) [Total de Bens da Cesta B�sica na Sui�a ($)] FROM PricesAoSwi WHERE Class = 'Cesta B�sica';


-- encontre a diferen�a entre os pre�os de cada produto e seu respectivo r�cio | find the difference between the prices of each product and their respective ratio--

SELECT *, ROUND((PriceAoSwi-PriceSwi),2) AS [Diferen�a ($)], ROUND(((PriceAoSwi/PriceSwi)*100),2) AS [R�cio (%)] FROM PricesAoSwi;


-- que produtos em angola s�o mais baratos ou tem os pre�os equiparados na Sui�a? | Which products in Angola are cheaper or have similar prices in Switzerland? --

SELECT ProductOrService, ROUND(((PriceAoSwi/PriceSwi)*100),2) AS [R�cio (%)] FROM PricesAoSwi WHERE ((PriceAoSwi/PriceSwi)*100) <=100
ORDER BY [R�cio (%)] DESC;


-- Apresentar toda a rela��o de produtos referente aos tres pa�ses: Angola, Mali e Sui�a | presenting the entire list of products referring to the three countries: Angola, Mali and Switzerland--

SELECT IDAoSwi, IDAoMli, PricesAoMli.ProductOrService, PricesAoSwi.Class, PriceAoSwi,PriceSwi, PriceMli FROM PricesAoSwi FULL OUTER JOIN PricesAoMli
ON PricesAoSwi.ProductOrService=PricesAoMli.ProductOrService ORDER BY IDAoSwi;


-- Apresentar a rela��o de produtos que n�o tenha coreespondencia nas duas compara��es | presenting the list of products that do not have a core response in the two comparisons --
SELECT IDAoSwi, IDAoMli, PricesAoMli.ProductOrService, PricesAoSwi.Class, PriceAoSwi,PriceSwi, PriceMli FROM PricesAoSwi FULL OUTER JOIN PricesAoMli
ON PricesAoSwi.ProductOrService=PricesAoMli.ProductOrService WHERE PricesAoSwi.PriceSwi IS NULL OR PricesAoMli.PriceMli IS NULL ORDER BY IDAoSwi;


-- Apresentar apenas a rela��o de produtos que, a n�vel de pre�o, tenha coreespondencia nas duas compara��es | presenting only the list of products that, in terms of price, are in line with the two comparisons--
SELECT IDAoSwi, IDAoMli, PricesAoMli.ProductOrService, PricesAoSwi.Class, PriceAoSwi, PriceSwi, PriceMli FROM PricesAoSwi INNER JOIN PricesAoMli
ON PricesAoSwi.ProductOrService=PricesAoMli.ProductOrService WHERE PricesAoMli.PriceMli IS NOT NULL AND PricesAoSwi.PriceSwi IS NOT NULL ORDER BY IDAoSwi;

-- Apresentar apenas a rela��o de produtos da tabela comparativa de Angola e Sui�a, MAIS apenas os que tem correspondencia na tabela Angola Mali | Presenting only the list of products in the comparative table for Angola and Switzerland, PLUS only those that correspond to the Angola Mali table--
SELECT IDAoSwi, IDAoMli, PricesAoMli.ProductOrService, PricesAoSwi.Class, PriceAoSwi, PriceSwi, PriceMli FROM PricesAoSwi LEFT JOIN PricesAoMli
ON PricesAoSwi.ProductOrService=PricesAoMli.ProductOrService WHERE PricesAoMli.PriceMli IS NOT NULL ORDER BY IDAoSwi;

-- Apresentar apenas a rela��o de produtos da tabela comparativa de Angola e Sui�a, e que n�o tem correspondencia na tabela Angola Mali | Presenting only the list of products in the comparative table for Angola and Switzerland, which has no correspondence in the Angola Mali table--
SELECT IDAoSwi, IDAoMli, PricesAoMli.ProductOrService, PricesAoSwi.Class, PriceAoSwi, PriceSwi, PriceMli FROM PricesAoSwi LEFT JOIN PricesAoMli
ON PricesAoSwi.ProductOrService=PricesAoMli.ProductOrService WHERE PricesAoMli.PriceMli IS NULL ORDER BY IDAoSwi;	


-- Apresentar apenas a rela��o de produtos da tabela comparativa de Angola e Mali, e que n�o tem correspondencia na tabela Angola Sui�a | Presenting only the list of products in the comparative table for Angola and Mali, which has no correspondence in the Angola Switzerland table--
SELECT IDAoSwi, IDAoMli, PricesAoMli.ProductOrService, PricesAoSwi.Class, PriceAoSwi, PriceSwi, PriceMli FROM PricesAoSwi RIGHT JOIN PricesAoMli
ON PricesAoSwi.ProductOrService=PricesAoMli.ProductOrService WHERE PricesAoSwi.PriceSwi IS NULL ORDER BY IDAoSwi;	

-- Apresentar apenas a rela��o de produtos da tabela comparativa de Angola e Mali, MAIS apenas os que tem correspondencia na tabela Angola Sui�a | Presenting only the list of products in the comparative table for Angola and Mali, PLUS only those that correspond to the Angola Switzerland table--
SELECT IDAoSwi, IDAoMli, PricesAoMli.ProductOrService, PricesAoSwi.Class, PriceAoSwi, PriceSwi, PriceMli FROM PricesAoSwi RIGHT JOIN PricesAoMli
ON PricesAoSwi.ProductOrService=PricesAoMli.ProductOrService WHERE PricesAoSwi.PriceSwi IS NOT NULL ORDER BY IDAoSwi;





