#Ex1: Selecionar uma lista com nomes femininos.
select * from gafanhotos;
select nome from gafanhotos where sexo = 'F';

#Ex2: Selecionar uma lista com os dados de todos que nasceram entre 1/jan/2000 e 31/dez/2015.
select * from gafanhotos where nascimento between '2000-01-01' and '2015-12-31';

#Ex3: Selecionar uma lista com o nome de todos os homens que trabalham como programadores.#
select nome from gafanhotos where (sexo, profissao) = ('M', 'programador');

#Uma extensão da questão anterior é solicitar a quantidade de pessoas nessa lista.#
select count(nome) from gafanhotos where (sexo, profissao) = ('M', 'programador');

#Ex4: Uma lista com todos os dados de todas as mulheres que nasceram no Brasil e que têm seu nome iniciado com a letra J.#
select * from gafanhotos where (sexo, nacionalidade) = ('F', 'Brasil') and nome like 'J%';

#Ex5: Uma lista com o nome e nacionalidade de todos os homens que têm Silva no nome, não nasceram no Brasil e pesam menos de 100  kg.#
select nome, nacionalidade from gafanhotos where nome like '%Silva%' and nacionalidade != 'Brasil' and peso < 100;

#Ex6: Qual é a maior altura entre gafanhotos homens que moram no Brasil?#
select max(altura) from gafanhotos;

#Ex7: Qual é a média de peso dos gafanhotos cadastrados?#
select avg(peso) from gafanhotos;

#Ex8: Qual é o menor peso entre as gafanhotas que nasceram fora do Brasil e entre 01/Ja/1990 e 31/Dez/2000?#
select min(peso) from gafanhotos where sexo = 'F' and nacionalidade != 'Brasil' and nascimento between '1990-01-01' and '2000-12-31';

#Ex9: Quantas gafanhotos mulheres têm mais de 1.90 m de altura?#
select count(nome) from gafanhotos where sexo = 'F' and altura > 1.90;

#Ex10: Uma lista com as profissões dos gafanhotos e seus respectivos quantitativos#
select profissao, count(*) from gafanhotos group by profissao order by count(*);

#Ex11: Quantos gafanhotos homens e quantas mulheres nasceram aopós 01/Jan/2005?#
select sexo, count(*) from gafanhotos where nascimento > '2005-01-01' group by sexo;

#Ex12: Uma lista com os gafanhotos que nasceram foram do Brasil, mostrando o país de origem#
#e o total de pessoas nascidas lá. Só nos interessam os países que tiveram mais de 3#
# gafanhotos com essa nacionalidade.#

select nacionalidade, count(*) from gafanhotos
where nacionalidade != 'Brasil'
group by nacionalidade
having count(*) > 3;

#Uma lista agrupada pela altura dos gafanhotos, mostrando quantas pesssoas#
#pesam mais de 100 kg e que estão acima da média de altura de todos os cadastrados#
select * from gafanhotos;

select avg(altura) from gafanhotos;

select nome from gafanhotos
where peso > '100'
group by altura
having altura > (select avg(altura) from gafanhotos);
