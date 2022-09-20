USE dm2;

select *
from pais;

select *
from jogo;

select *
from jogador;

create temporary table idade   
select nome_jogador,
	   genero, 
       data_nascimento,
       timestampdiff(year, jg.data_nascimento, NOW()) as idade
from jogador jg;

-- media de idade por genero
select genero, avg(idade)
		from idade
        group by genero;
	

-- Qual o jogo que possui o maior número de partidas?
    
    select jo.nome_jogo, count(jg.total_partidas) contagem
	from jogador jg
	join jogo jo
	on jg.cod_jogo = jo.cod_jogo
	group by jo.nome_jogo
	order by contagem desc;

-- Qual o segundo jogo preferido entre as mulheres?
	
    select jo.nome_jogo, jg.genero, count(jo.cod_jogo) contagem
	from jogador jg
	join jogo jo
	on jg.cod_jogo = jo.cod_jogo
    where jg.genero = 'Feminino'
	group by jg.genero, jo.nome_jogo
	order by jg.genero, contagem desc;

-- Qual é a soma de derrotas do Chile no jogo Dama?
	select pa.nome_pais, sum(jg.num_derrotas) as soma_derrotas
	from jogador jg
	join pais pa
	on jg.cod_pais = pa.cod_pais
    join jogo jo
	on jg.cod_jogo = jo.cod_jogo
    where pa.nome_pais = 'Chile' and jo.nome_jogo = 'Dama';

-- Qual o país que possui a menor média de vitórias no geral (independente do jogo)?

	select pa.nome_pais, avg(jg.num_vitorias) as media
	from jogador jg
	join pais pa
	on jg.cod_pais = pa.cod_pais
	group by pa.nome_pais
	order by media asc;



