-- -----------------------------------------------------
-- Criando Consultas
-- -----------------------------------------------------


/* 
listar pedidos feitos por clientes no bairro de casa amarela mostrando bairro, 
cliente e nome do produto
*/
SELECT * FROM pedidos
WHERE clientes_nome IN (
   SELECT nome FROM clientes
   WHERE endereco_id_endereco IN (
      SELECT id_endereco FROM endereco
      WHERE bairro = "Casa Amarela"
   )
);


/* 
listar clientes e seus endereçoes
*/

SELECT c.nome, c.telefone, e.id_endereco, e.bairro, e.rua
    FROM clientes AS c
        INNER JOIN endereco AS e
            ON c.endereco_id_endereco = e.id_endereco
    ORDER BY e.bairro;



SELECT nome,  bairro, rua, telefone
FROM andersonGas.clientes
INNER JOIN andersonGas.endereco
ON clientes.endereco_id_endereco = endereco.id_endereco



/* 
listar os produtos do inventário que foram pedidos pelos clientes pelo menos uma vez
*/

SELECT i.nome_produto, i.preco_de_venda, i.quantidade
    FROM inventario AS i
        INNER JOIN pedidos AS p 
			ON i.nome_produto = p.inventario_nome_produto
    GROUP BY i.nome_produto
    HAVING COUNT(p.id_pedido) > 0;


/* 
listar todos os pedidos que foram realizados por clientes com nome "Silva"
*/

SELECT *
    FROM pedidos AS p
    WHERE p.clientes_nome IN 
        (SELECT nome
            FROM clientes
            WHERE nome LIKE "%Silva%");


/* 
listar clientes que tenham feito pelo pedidos em uma determinada data
*/

SELECT *
FROM clientes
WHERE EXISTS (
    SELECT *
		FROM pedidos
		WHERE pedidos.clientes_nome = clientes.nome
			AND pedidos.clientes_endereco_id_endereco = clientes.endereco_id_endereco
			AND pedidos.data_pedido = '01-12-22'
)


/* 
lista de todos os produtos cuja diferença entre o preço de compra e o preço de 
venda seja maior que 10
*/

SELECT nome_produto, preco_de_compra, preco_de_venda, (preco_de_venda - preco_de_compra) AS lucro
    FROM inventario
    WHERE ABS(preco_de_venda - preco_de_compra) > 10


/* 
retornar informações dos clientes, endereços, pedidos e produtos, além de 
calcular o lucro obtido em cada pedido, com base na diferença entre o preço de venda 
e o preço de compra dos produtos.
*/

SELECT clientes.nome, clientes.telefone, endereco.cidade, endereco.UF, pedidos.data_pedido, 
       inventario.nome_produto, inventario.preco_de_compra, inventario.preco_de_venda,
       (inventario.preco_de_venda - inventario.preco_de_compra) AS lucro
FROM pedidos
JOIN clientes ON pedidos.clientes_nome = clientes.nome
JOIN endereco ON clientes.endereco_id_endereco = endereco.id_endereco
JOIN inventario ON pedidos.inventario_nome_produto = inventario.nome_produto


/*
retornar os pedidos realizados por clientes de determinada cidade, junto com o 
preço de venda dos produtos
*/

SELECT p.id_pedido, c.nome AS cliente, i.preco_de_venda
    FROM andersonGas.pedidos AS p
        JOIN andersonGas.clientes AS c
        ON p.clientes_nome = c.nome AND p.clientes_endereco_id_endereco = c.endereco_id_endereco
        JOIN andersonGas.inventario AS i
        ON p.inventario_nome_produto = i.nome_produto
        JOIN andersonGas.endereco AS e
        ON c.endereco_id_endereco = e.id_endereco
        WHERE e.cidade = 'Recife';


/*

*/

SELECT c.nome AS nome_cliente, c.telefone, e.CEP, e.cidade, e.bairro, e.rua, e.numero, e.UF
    FROM andersonGas.clientes AS c
    JOIN andersonGas.endereco AS e ON c.endereco_id_endereco = e.id_endereco;




/*
retornar as informações d
*/


SELECT clientes_nome, inventario_nome_produto, data_pedido
    FROM pedidos
    WHERE pedidos.data_pedido BETWEEN '2022-01-01' AND '2022-12-31';



