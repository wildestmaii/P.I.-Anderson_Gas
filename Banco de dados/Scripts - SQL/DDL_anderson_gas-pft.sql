-- -----------------------------------------------------
-- Criação de procedures
-- -----------------------------------------------------

/*
recebe dois parâmetros de entrada: inicio e fim, que representam as datas inicial e final, 
respectivamente. Quando a procedure é chamada, ela retorna todos os pedidos realizados 
entre as duas datas fornecidas
*/

CREATE PROCEDURE andersonGas.listar_pedidos(IN inicio DATE, IN fim DATE)
BEGIN
    SELECT * FROM andersonGas.pedidos
    WHERE data_pedido BETWEEN inicio AND fim;
END;

/*
cadastrar pedidos 
*/

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
END;



CREATE PROCEDURE 

CREATE PROCEDURE 

CREATE PROCEDURE 

CREATE PROCEDURE 

CREATE PROCEDURE 

CREATE PROCEDURE 

CREATE PROCEDURE 

CREATE PROCEDURE 

CREATE PROCEDURE 

CREATE PROCEDURE 

-- -----------------------------------------------------
-- Criação de functions
-- -----------------------------------------------------







-- -----------------------------------------------------
-- Criação de triggers
-- -----------------------------------------------------

CREATE TRIGGER nome_do_gatilho
AFTER INSERT ON nome_da_tabela
FOR EACH ROW
BEGIN
   -- aqui vão as instruções SQL que o gatilho irá executar
END;


/*
para atualizar o preço de venda automaticamente
*/

CREATE TRIGGER atualizar_preco_venda
AFTER UPDATE ON inventario
FOR EACH ROW
BEGIN
   SET NEW.preco_de_venda = NEW.preco_de_compra * 1.2;
END;


/*
verificar se a quantidade de produtos em estoque é suficiente para atender ao pedido antes 
de inserir o pedido na tabela pedidos.
*/

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
manter o estoque do inventário atualizado sempre que um novo pedido é inserido na tabela pedidos
*/

CREATE TRIGGER andersonGas.atualizar_estoque
AFTER INSERT ON andersonGas.pedidos
FOR EACH ROW
BEGIN
    UPDATE andersonGas.inventario
    SET quantidade = quantidade - 1
    WHERE nome_produto = NEW.inventario_nome_produto;
END;

CREATE TRIGGER andersonGas.atualizar_quantidade_inventario
AFTER INSERT ON andersonGas.pedidos
FOR EACH ROW
BEGIN
    UPDATE andersonGas.inventario
    SET quantidade = quantidade - 1
    WHERE nome_produto = NEW.inventario_nome_produto;
END;






