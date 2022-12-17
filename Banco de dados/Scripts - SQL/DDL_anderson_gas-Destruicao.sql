-- -----------------------------------------------------
-- Destruindo dados das tabelas
-- -----------------------------------------------------

TRUNCATE TABLE `andersonGas`.`endereco`;

TRUNCATE TABLE `andersonGas`.`clientes`;

TRUNCATE TABLE `andersonGas`.`inventario`;

TRUNCATE TABLE `andersonGas`.`pedidos`;



-- -----------------------------------------------------
-- Destruindo tabelas
-- -----------------------------------------------------

DROP TABLE IF EXISTS `andersonGas`.`endereco`;

DROP TABLE IF EXISTS `andersonGas`.`clientes`;

DROP TABLE IF EXISTS `andersonGas`.`inventario`;

DROP TABLE IF EXISTS `andersonGas`.`pedidos`;



-- -----------------------------------------------------
-- Destruindo views
-- -----------------------------------------------------

DROP VIEW IF EXISTS `andersonGas`.`pedidosXbairros`

DROP VIEW IF EXISTS `andersonGas`.`clientesXenderecos`

DROP VIEW IF EXISTS `andersonGas`.`dataPedidos`

DROP VIEW IF EXISTS `andersonGas`.`clientesPedidos`

DROP VIEW IF EXISTS `andersonGas`.`clientesDados`

DROP VIEW IF EXISTS `andersonGas`.`pedidosEntre`



-- -----------------------------------------------------
-- Destruindo procedures
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS `andersonGas`.`listar_pedidos`;

DROP PROCEDURE IF EXISTS `andersonGas`.`cadastrar_pedido`;

DROP PROCEDURE IF EXISTS `andersonGas`.`get_order_total`;

DROP PROCEDURE IF EXISTS `andersonGas`.`numero_pedidos_cliente`;



-- -----------------------------------------------------
-- Destruindo funções
-- -----------------------------------------------------

DROP FUNCTION IF EXISTS `andersonGas`.`getEnderecoCliente`

DROP FUNCTION IF EXISTS `andersonGas`.`calcularLucro`

DROP FUNCTION IF EXISTS `andersonGas`.`getPrecoVendaProduto`

DROP FUNCTION IF EXISTS `andersonGas`.`valorTotalDoPedido`

DROP FUNCTION IF EXISTS `andersonGas`.`numero_pedidos_cliente`


-- -----------------------------------------------------
-- Destruindo triggers
-- -----------------------------------------------------

DROP TRIGGER IF EXISTS `andersonGas`.`verifica_estoque_antes_insercao_pedido`

DROP TRIGGER IF EXISTS `andersonGas`.`atualizar_quantidade_inventario`

DROP TRIGGER IF EXISTS `andersonGas`.`atualizar_preco_venda`



-- -----------------------------------------------------
-- Destruindo banco de dados
-- -----------------------------------------------------

DROP DATABASE  IF EXISTS andersonGas;