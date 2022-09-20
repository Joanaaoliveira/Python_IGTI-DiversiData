USE dfin;

select *
from estado;

select *
from produto;

select *
from compra;

select *
from cliente;

-- média dos valores de produtos do dataset de produtos cuja classe do alimento é Carnes e Frios?
select pd.classe_produto, avg(pd.valor)
		from produto pd
        group by pd.classe_produto;

-- proporção de homens e mulheres diabéticos que compraram produtos da classe "hortifruti"?
select cl.sexo, count(cl.diabetico), pd.classe_produto
		from cliente cl
        join compra cp
		on cl.cod_cliente = cp.cod_cliente
		where pd.classe_produto = 'hortifruti' and cl.diabetico = '1'
		group by cl.sexo;
        
-- classe de produtos possui menor média de compras para as pessoas do estado de Minas Gerais?

select pd.classe_produto, avg(cp.valor_total_compra) media_compra, es.estado
		from cliente cl
		join estado es
		on cl.cod_estado = es.cod_estado
       	join compra cp
		on cl.cod_cliente = cp.cod_cliente
        join produto pd
		on pd.cod_produto = cp.cod_produto
		where es.estado = 'Minas Gerais'
		group by pd.classe_produto
		order by  media_compra asc;


        ;