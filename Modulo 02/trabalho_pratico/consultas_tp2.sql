USE tp2;

select genero, count(genero)
		from pessoa
        group by genero;

     create temporary table idade   
select cod_pessoa,
	   genero, 
       data_nascimento,
       timestampdiff(year, pes.data_nascimento, NOW()) as idade
from pessoa pes;
        
    -- media de idade por genero
select genero, avg(idade)
		from idade
        group by genero;
        
      -- para saber a maior idade, ordena idades
select distinct idade 
from idade
order by idade desc;



-- ##QUESTÕES DO TESTE##

-- quantas pessoas do sexo masculino gosta de cachorro e gato
-- cachorro = 271 , gato = 585
select ani.animal, count(pesq.cod_animal_estimacao) as animais_pref
	from pesquisa pesq
    join animal_estimacao ani
    on pesq.cod_animal_estimacao = ani.cod_animal_estimacao
    join pessoa pes
    on pesq.cod_pessoa = pes.cod_pessoa
    where ani.animal in ('cachorro','gato') and pes.genero = 'Masculino'
    group by ani.animal;

-- qual média de idade dos homens que gostam de chá e clima frio
select ps.genero, count(cl.cod_clima), count(be.cod_bebida), avg(id.idade)
    from pesquisa pq
    join clima cl
    on pq.cod_clima = cl.cod_clima
    join pessoa ps
    on pq.cod_pessoa = ps.cod_pessoa
    join bebida be on pq.cod_bebida = be.cod_bebida
    join idade id on pq.cod_pessoa = id.cod_pessoa
    where cl.clima = 'frio' and be.bebida = 'chá' and ps.genero = 'Masculino';
    
-- qual o hobbie de menor preferência entre as mulheres
-- ler livros = 80
	select pes.genero, hob.hobbie, count(hob.cod_hobbie) hobbie
	from pesquisa pesq
	join hobbie hob
	on pesq.cod_hobbie = hob.cod_hobbie
	join pessoa pes
	on pesq.cod_pessoa = pes.cod_pessoa
    where pes.genero = 'Feminino'
	group by pes.genero, hob.hobbie
	order by pes.genero, count(cod_hobbie) asc;
    
-- qual o hobbie de maior preferencia entre os homens que gostam
-- de cachorros?

	select ps.genero, ae.animal, count(hb.cod_hobbie) hobbie, hb.hobbie
	from pesquisa p
	inner join animal_estimacao ae
	on p.cod_animal_estimacao = ae.cod_animal_estimacao
	inner join hobbie hb
	on p.cod_hobbie = hb.cod_hobbie
	inner join pessoa ps
	on p.cod_pessoa = ps.cod_pessoa
	where ae.animal = 'cachorro' and ps.genero = 'Masculino'
	group by genero, hb.hobbie
	order by ps.genero, count(cod_hobbie) desc;

-- qual a bebida favorita entre as mulheres e homens respectiva
select pes.genero, beb.bebida, count(beb.cod_bebida) soma
	from pesquisa pesq
    join bebida beb
    on pesq.cod_bebida = beb.cod_bebida
    join pessoa pes
    on pesq.cod_pessoa = pes.cod_pessoa
    group by pes.genero, beb.bebida
    order by pes.genero, count(cod_bebida) desc;

-- media de idade das pessoas que tem como hobbie ler livros
select ps.genero, count(hb.cod_hobbie), avg(id.idade)
    from pesquisa pq
    join hobbie hb
    on pq.cod_hobbie = hb.cod_hobbie
    join pessoa ps
    on pq.cod_pessoa = ps.cod_pessoa
    join idade id on pq.cod_pessoa = id.cod_pessoa
    where hb.hobbie = 'ler livros';
    
-- quantas pessoas tem como hobbie "escrever" e qual é a sua 
-- media de idade respectivamente
select ps.genero, count(hb.cod_hobbie), avg(id.idade)
    from pesquisa pq
    join hobbie hb
    on pq.cod_hobbie = hb.cod_hobbie
    join pessoa ps
    on pq.cod_pessoa = ps.cod_pessoa
    join idade id on pq.cod_pessoa = id.cod_pessoa
    where hb.hobbie = 'escrever';
    
-- qual script retorna numero total de pessoas que responderam 
-- na pesquisa que gostam de cachorros

select ae.animal, count(1) total
from pesquisa p
inner join animal_estimacao ae
on p.cod_animal_estimacao = ae.cod_animal_estimacao
where ae.animal = 'cachorro'
group by animal;

-- qual a quantidade de pessoas que gostam do tempo frio ?
select cli.clima, count(cli.cod_clima) qtd_pes
    from pesquisa pesq
    join clima cli
    on pesq.cod_clima = cli.cod_clima
    join pessoa pes
    on pesq.cod_pessoa = pes.cod_pessoa
    where cli.clima = 'frio';

-- qual o animal de estimação preferido entre as mulheres?
-- gato = 279
select pes.genero, an.animal, count(an.cod_animal_estimacao) soma
	from pesquisa pesq
    join animal_estimacao an
    on pesq.cod_animal_estimacao = an.cod_animal_estimacao
    join pessoa pes
    on pesq.cod_pessoa = pes.cod_pessoa
	where pes.genero = 'feminino'
    group by pes.genero, an.animal
    order by pes.genero, count(an.animal) desc;

-- quantas pessoas gostam do clima quente por gênero ? 
select pes.genero, cli.clima, count(cli.cod_clima)
    from pesquisa pesq
    join clima cli
    on pesq.cod_clima = cli.cod_clima
    join pessoa pes
    on pesq.cod_pessoa = pes.cod_pessoa
    where cli.clima = 'quente'
    group by pes.genero;


