-- -----------------------------------------------------
-- Inserindo dados na tabela Endereços
-- -----------------------------------------------------

INSERT INTO `andersonGas`.`endereco`
(`id_endereco`, `CEP`, `cidade`, `bairro`, `rua`, `numero`, `UF`) 
VALUES
(1, "50080590", "Recife", "Ilha Joana Bezerra", "Praça Ator Barreto Júnior", "13", "PE"),
(2, "50721640", "Recife", "Cordeiro", "Rua Rio Tejipió", "48", "PE"),
(3, "52070015", "Recife", "Casa Amarela", "Estrada do Encanamento", "738", "PE"),
(4, "50771790", "Recife", "Estância", "Rua Pero Vaz de Caminha", "345", "PE"),
(5, "52280540", "Recife", "Vasco da Gama", "Rua Girassol", "357", "PE"),
(6, "50771805", "Recife", "Estância", "Rua Raposo Tavares", "27", "PE"),
(7, "50720225", "Recife", "Prado", "Avenida Engenheiro Abdias de Carvalho", "73", "PE"),
(8, "50820560", "Recife", "Afogados", "Rua do Caboclinho", "61", "PE"),
(9, "51290130", "Recife", "COHAB", "Rua Rio Tefé", "94", "PE"),
(10, "50791200", "Rcife", "Coqueiral", "Rua Acarapé", "93", "PE"),
(11, "51130120", "Recife", "Boa Viagem", "Avenida Vinte de Janeiro", "62", "PE"),
(12, "50820550", "Recife", "Afogados", "Rua Ursulino Pinto de Carvalho", "258", "PE"),
(13, "52070230", "Recife", "Casa Amarela", "Estrada do Arraial", "7025", "PE");



-- -----------------------------------------------------
-- Inserindo dados na tabela Clientes
-- -----------------------------------------------------

INSERT INTO `andersonGas`.`clientes`
(`nome`, `telefone`, `endereco_id_endereco`)
VALUES
("Ayrton Santos Maia Medeiros", "925131418", 1),
("Douglas Guedes da Silva Junior", "987550098", 2),
("Erika Vilas Boas dos Santos", "934901675", 3),
("Everton Gabriel Silva dos Anjos", "876390277", 4),
("Gilmar Adrian de Souza Braz", "987651298", 5),
("Karolayne da Silva Santos", "987208178", 6),
("Mirelle da Silva Coutinho", "920975937", 7),
("Quézia Cassiano de Souza Silva", "964731682", 8),
("Sabrina Maria da Silva", "986376125", 9),
("Sara Rayane Araujo Lopes", "976183492", 10),
("Higor Cabral Alves de Castro", "946381290", 11),
("Jhonata Carvalho de Barros", "986932979", 12),
("Livia Vitória dos Santos Gomes", "915732001", 13);



-- -----------------------------------------------------
-- Inserindo dados na tabela Inventario
-- -----------------------------------------------------

INSERT INTO `andersonGas`.`inventario`
(`nome_produto`, `codigo_produto`, `preco_de_compra`, `preco_de_venda`, `quantidade`)
VALUES
("Gás liquefeito de petróleo(GLP)", 1, "90.00", "120.00", 61),
("Regulador de gás doméstico", 2, "37.00", "50.00", 47),
("Mangueira de gás de cozinha", 3, "15.00", "30.00", 50),
("Abraçadeira para gás de cozinha", 4, "00.50", "3.00", 30);



-- -----------------------------------------------------
-- Inserindo dados na tabela Pedidos
-- -----------------------------------------------------

INSERT INTO `andersonGas`.`pedidos`
(`id_pedido`, `data_pedido`, `clientes_nome`, `clientes_endereco_id_endereco`, `inventario_nome_produto`)
VALUES
(1, '01-12-22', "Ayrton Santos Maia Medeiros", 1, "Gás liquefeito de petróleo(GLP)"),
(2, '01-12-22', "Douglas Guedes da Silva Junior", 2, "Gás liquefeito de petróleo(GLP)"),
(3, '01-12-22', "Erika Vilas Boas dos Santos", 3, "Gás liquefeito de petróleo(GLP)"),
(4, '01-12-22', "Everton Gabriel Silva dos Anjos", 4, "Gás liquefeito de petróleo(GLP)"),
(5, '01-12-22', "Gilmar Adrian de Souza Braz", 5, "Gás liquefeito de petróleo(GLP)"),
(6, '01-12-22', "Karolayne da Silva Santos", 6, "Gás liquefeito de petróleo(GLP)"),
(7, '01-12-22', "Mirelle da Silva Coutinho", 7, "Gás liquefeito de petróleo(GLP)"),
(8, '01-12-22', "Quézia Cassiano de Souza Silva", 8, "Gás liquefeito de petróleo(GLP)"),
(9, '01-12-22', "Sabrina Maria da Silva", 9, "Gás liquefeito de petróleo(GLP)"),
(10, '31-12-22', "Sara Rayane Araujo Lopes", 10, "Gás liquefeito de petróleo(GLP)");



-- -----------------------------------------------------
-- Atualizando dados na tabela
-- -----------------------------------------------------

UPDATE `andersonGas`.`endereco`
SET `numero` = 662
WHERE `id_endereco` = 7;

UPDATE `andersonGas`.`endereco`
SET `rua` = "Rua Malacó"
WHERE `id_endereco` = 1;

UPDATE `andersonGas`.`endereco`
SET `rua` = "Rua Órodis"
WHERE `id_endereco` = 2;

UPDATE `andersonGas`.`endereco`
SET `rua` = "Rua Nova Descoberta"
WHERE `id_endereco` = 10;

UPDATE `andersonGas`.`endereco`
SET `Bairro` = "Nova Descoberta"
WHERE `id_endereco` = 10;

UPDATE `andersonGas`.`endereco`
SET `numero` = 3647
WHERE `id_endereco` = 10;

UPDATE `andersonGas`.`pedidos`
SET `inventario_nome_produto` = "Abraçadeira para gás de cozinha"
WHERE `id_pedido` = 9;

UPDATE `andersonGas`.`pedidos`
SET `inventario_nome_produto` = "Regulador de gás doméstico"
WHERE `id_pedido` = 4;

UPDATE `andersonGas`.`pedidos`
SET `inventario_nome_produto` = "Mangueira de gás de cozinha"
WHERE `id_pedido` = 6;

UPDATE `andersonGas`.`pedidos`
SET `inventario_nome_produto` = "Abraçadeira para gás de cozinha"
WHERE `id_pedido` = 3;
