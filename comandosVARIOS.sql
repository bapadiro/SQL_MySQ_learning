-- 1º Selecione todas as colunas e linhas da tabela de produtos
SELECT * FROM produtos;

-- 2º Agora selecione as colunas Nome_Produto, Marca_Produto e Preco_Unit
-- Renomeie essas colunas para Nome do Produto, Marca e Preço Unitário
SELECT Nome_Produto AS 'Nome do Produto', Marca_Produto AS 'Marca',
Preco_Unit AS 'Preço Unitário'
FROM produtos;

-- 3º Selecione as 5 primeiras linhas da tabela loja (considere todas as colunas)
SELECT * FROM lojas LIMIT 5;

-- 4º Faça uma consulta na tabela de lojas e ordene a tabela de acordo com a coluna de 
-- Num_Funcionarios, em ordem crescente
-- Obs: Sua consulta deve retornar as colunas de Loja (AS 'Nome da Loja'), Endereco (AS 
-- 'Endereço'), Num_Funcionarios (AS 'Qtd. Funcionários') e Telefone (AS 'Número para contato')
SELECT Loja AS 'Nome da Loja', Endereco 'Endereço', Num_Funcionarios 'Qt Funcionários',
Telefone 'Número de contato'
FROM lojas
ORDER BY Num_Funcionarios ASC;

--  5º Faça uma cosulta na tabela de clientes, ordenando a tabela de acordo com o nome 
-- (ordem alfabética) e sobrenome (ordem alfabética). Retorne todas as colunas e linhas da 
-- tabela
SELECT * FROM clientes
ORDER BY Nome, Sobrenome;

-- 6º Faça um filtro na tabela de produtos e retorne apenas os produtos com custo maior ou 
-- igual a 200
SELECT * FROM produtos
WHERE Custo_Unit >= 200;

--  7º Faça um filtro na tabela de produtos e retorne apenas os produtos da marca "DELL"
SELECT * FROM produtos
WHERE Marca_Produto = "DELL";

-- 8º Descubra o total de custo da tabela de pedidos.
SELECT SUM(Custo_Venda) AS 'Custo total das Vendas' FROM pedidos;

-- 9º Descubra a quantidade total de lojas
SELECT COUNT(Loja) AS 'Qtd Lojas' FROM lojas;

-- 10º Descubra o custo médio dos produtos (de acordo com a tabela de produtos)
SELECT AVG(Custo_Unit) AS 'Custo Médio dos Produtos' FROM produtos;

-- 11º Descubra a quantidade mínima e máxima de funcionários das lojas (faça isso em um único 
-- SELECT)
SELECT MAX(Num_Funcionarios) AS 'Qtd Máxima Funcionários',
	MIN(Num_Funcionarios) AS 'Qtd Minima Funcionários'FROM lojas;

-- 12º Faça um agrupamento para descobrir o total de clientes por Sexo
SELECT * FROM clientes;
SELECT Sexo, COUNT(Sexo) AS 'Qtd Clientes por Sexo'
FROM clientes
GROUP BY Sexo;

-- 13º Faça um agrupamento para descobrir quantos produtos existem por categoria apenas com GROUP BY
SELECT * FROM produtos;
SELECT ID_Categoria, COUNT(ID_Categoria) AS 'Produtos'
FROM produtos
GROUP BY ID_Categoria;

-- Agora faça com INNER JOIN
-- SELECT * FROM categorias;
-- SELECT * FROM produtos;
SELECT Categoria, COUNT(*) AS 'Produtos' 
FROM produtos
INNER JOIN categorias on produtos.ID_Categoria = categorias.ID_Categoria
GROUP BY Categoria;

-- 14º Faça um agrupamento para descobrir a soma total de receita por Loja
SELECT * FROM pedidos;
SELECT ID_Loja, SUM(Receita_Venda) AS 'Soma total Receita por Loja'
FROM pedidos
GROUP BY ID_Loja;

-- Agora faça com INNER JOIN + Soma de Custo
SELECT Loja, SUM(Receita_Venda) AS 'Soma total Receita por Loja',
	SUM(Custo_Venda) AS 'Custo total das Vendas'
FROM pedidos
INNER JOIN lojas on pedidos.ID_Loja = lojas.ID_Loja
GROUP BY Loja;






