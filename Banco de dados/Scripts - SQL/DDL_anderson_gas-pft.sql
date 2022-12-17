-- -----------------------------------------------------
-- Criação de procedures
-- -----------------------------------------------------

/*
PROCEDURE 01
recebe dois parâmetros de entrada: inicio e fim, que representam as datas inicial e final, 
respectivamente. Quando a procedure é chamada, ela retorna todos os pedidos realizados 
entre as duas datas fornecidas
*/

DELIMITER //
CREATE PROCEDURE andersonGas.listar_pedidos(IN inicio DATE, IN fim DATE)
BEGIN
    SELECT * FROM andersonGas.pedidos
    WHERE data_pedido BETWEEN inicio AND fim;
END//
DELIMITER ;

/*
PROCEDURE 02
cadastramento de pedidos 
*/

DELIMITER //
CREATE PROCEDURE andersonGas.cadastrar_pedido(
    IN p_data_pedido DATE,
    IN p_nome_cliente VARCHAR(100),
    IN p_telefone_cliente VARCHAR(9),
    IN p_id_endereco INT,
    IN p_nome_produto VARCHAR(45)
)
BEGIN
    INSERT INTO andersonGas.clientes (nome, telefone, endereco_id_endereco)
    VALUES (p_nome_cliente, p_telefone_cliente, p_id_endereco);

    INSERT INTO andersonGas.pedidos (data_pedido, clientes_nome, clientes_endereco_id_endereco, inventario_nome_produto)
    VALUES (p_data_pedido, p_nome_cliente, p_id_endereco, p_nome_produto);
END//
DELIMITER ;

/*
PROCEDURE 03
calcula o custo total de um pedido, multiplicando o valor dos items pela quantidade 
requirida de cada um
*/

DELIMITER //
CREATE PROCEDURE get_order_total(IN order_id INT)
BEGIN
  SELECT SUM(preco_de_venda * quantidade) AS total_cost
  FROM andersonGas.inventario i
  JOIN andersonGas.pedidos p ON i.nome_produto = p.inventario_nome_produto
  WHERE p.id_pedido = order_id;
END //
DELIMITER ;


/*
PROCEDURE 05
conte quantas vezes um cliente fez um pedido
*/

DELIMITER $$

CREATE PROCEDURE numero_pedidos_cliente(IN nome VARCHAR(100), IN endereco_id INT, OUT num_pedidos INT)
BEGIN
  SELECT COUNT(*) INTO num_pedidos
  FROM pedidos p
  WHERE p.clientes_nome = nome AND p.clientes_endereco_id_endereco = endereco_id;
END $$

DELIMITER ;


-- -----------------------------------------------------
-- Criação de functions
-- -----------------------------------------------------

/*
FUNÇÃO 02
retorna o endereço de um cliente a partir do nome do cliente e do ID do endereço.
*/

DELIMITER //
CREATE FUNCTION getEnderecoCliente(nome VARCHAR(100), id_endereco INT)
RETURNS VARCHAR(200)
BEGIN
    DECLARE endereco VARCHAR(200);
    SELECT concat(cidade, ', ', bairro, ', ', rua, ' ', numero, ', ', UF)
    INTO endereco
    FROM endereco
    WHERE id_endereco = endereco_id_endereco
    AND nome = clientes_nome;
    RETURN endereco;
END//
DELIMITER ;


/*
FUNÇÃO 03
calcule o lucro total de uma determinada venda, considerando o preço de compra do produto e o preço de venda
*/

DELIMITER //
CREATE FUNCTION calcularLucro(nomeProduto VARCHAR(45), quantidade INT)
RETURNS FLOAT
BEGIN
  DECLARE precoCompra FLOAT;
  DECLARE precoVenda FLOAT;
  
  -- Recuperar o preço de compra e o preço de venda do produto
  SELECT preco_de_compra, preco_de_venda
  INTO precoCompra, precoVenda
  FROM inventario
  WHERE nome_produto = nomeProduto;
  
  -- Retornar o lucro calculado com base nos preços e na quantidade
  RETURN (precoVenda - precoCompra) * quantidade;
END//
DELIMITER ;


/*
FUNÇÃO 05
retornasse o preço de venda de um determinado produto a partir de seu nome
*/

DELIMITER//
CREATE FUNCTION getPrecoVendaProduto(nome_produto VARCHAR(45)) RETURNS VARCHAR(45)
BEGIN
  DECLARE preco_de_venda VARCHAR(45);

  SELECT preco_de_venda INTO preco_de_venda
  FROM inventario
  WHERE nome_produto = nome_produto;

  RETURN preco_de_venda;
END//
DELIMITER;


/*
FUNÇÃO 06
 dado o nome de um cliente e o código de um produto, retorna o valor total do pedido, 
 considerando a quantidade de produtos solicitada pelo cliente e o preço de venda de 
 cada produto.
*/

DELIMITER //
CREATE FUNCTION valorTotalDoPedido(nomeCliente VARCHAR(100), codigoProduto INT)
RETURNS DECIMAL(10,2)
BEGIN
  DECLARE valorTotal DECIMAL(10,2);

  SELECT i.preco_de_venda * p.quantidade
  INTO valorTotal
  FROM pedidos p
  INNER JOIN inventario i ON i.nome_produto = p.inventario_nome_produto
  WHERE p.clientes_nome = nomeCliente AND i.codigo_produto = codigoProduto;

  RETURN valorTotal;
END//
DELIMITER ;


/*
FUNÇÃO 07
conte quantas vezes um cliente fez um pedido
*/

DELIMITER //

CREATE FUNCTION numero_pedidos_cliente(nome VARCHAR(100), endereco_id INT) RETURNS INT
BEGIN
  DECLARE num_pedidos INT;
  SELECT COUNT(*) INTO num_pedidos
  FROM pedidos p
  WHERE p.clientes_nome = nome AND p.clientes_endereco_id_endereco = endereco_id;
  RETURN num_pedidos;
END//

DELIMITER ;


-- -----------------------------------------------------
-- Criação de triggers
-- -----------------------------------------------------


/*
TRIGGER 01
verificar se a quantidade de produtos em estoque é suficiente para atender ao pedido antes 
de inserir o pedido na tabela pedidos.
*/
--funcionou
DELIMITER //

CREATE TRIGGER andersonGas.verifica_estoque_antes_insercao_pedido
BEFORE INSERT ON andersonGas.pedidos
FOR EACH ROW
BEGIN
    DECLARE quantidade_estoque INT;

    SELECT quantidade INTO quantidade_estoque
    FROM andersonGas.inventario
    WHERE nome_produto = NEW.inventario_nome_produto;

    IF quantidade_estoque < 1 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Estoque insuficiente para atender ao pedido';
    END IF;
END //

DELIMITER ;


/*
TRIGGER 02
manter o estoque do inventário atualizado sempre que um novo pedido é inserido na tabela pedidos
*/

---funcionou
DELIMITER //
CREATE TRIGGER andersonGas.atualizar_quantidade_inventario
AFTER INSERT ON andersonGas.pedidos
FOR EACH ROW
BEGIN
    UPDATE andersonGas.inventario
    SET quantidade = quantidade - 1
    WHERE nome_produto = NEW.inventario_nome_produto;
END//
DELIMITER ;


/*
TRIGGER 03
para atualizar o preço de venda automaticamente
*/


DELIMITER //
CREATE TRIGGER atualizar_preco_venda
AFTER UPDATE ON inventario
FOR EACH ROW
BEGIN
   SET NEW.preco_de_venda = NEW.preco_de_compra * 1.2;
END//
DELIMITER ;


/*
TRIGGER 04
*/






/*
TRIGGER 05
*/







/*
TRIGGER 06
*/





