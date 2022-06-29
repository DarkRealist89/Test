select * from mdlp_batch mb where gnvlp = true limit 10;
select * from mdlp_batch mb where count_sgtin  >=5000;

--asc от меньшего к большему
--desc от большего к меньшему
select * from mdlp_batch mb where count_sgtin <=5000 order by count_sgtin asc;
select * from mdlp_batch mb where count_sgtin >=3000 order by count_sgtin desc; 

select * from mdlp_batch mb where count_sgtin >=10000 and count_sgtin <=20000;
select * from mdlp_batch mb where count_sgtin <=10000 or count_sgtin >=20000 order by count_sgtin ;
select * from mdlp_batch mb where gnvlp != '1';
select distinct gtin, gnvlp  from mdlp_batch mb order by gtin;
select distinct batch from mdlp_batch mb order by batch;
select gtin, gnvlp, count(*) as test from mdlp_batch mb group by gtin, gnvlp having count(*) > 20 order by test; 
select sum(count_sgtin)  from mdlp_batch mb ; 
select count(*) from mdlp_batch mb where gnvlp = false ;
select max(count_sgtin) from mdlp_batch mb where gnvlp = true;
select min(count_sgtin) from mdlp_batch mb where gnvlp = false;

select
	u.name, 
	u.email,
	r."name" as role_name
from
	users u
left join roles r on
	r."_id" = u.role_id; 



--select 
--	where откуда брать
--	order by сортировка
--	group by групировка 
--	left join соединение данных из двух таблиц
--	limit ограничение количества выданных строк
--	distinct Уникальные
--	having условие соответствия после group by
--	псевдоним 'as' присвоение имени 


--insert 


--update 


--delete
https://postgrespro.ru/docs/postgrespro/13/functions-aggregate
https://postgrespro.ru/docs/postgrespro/13/functions-comparison
https://postgrespro.ru/docs/postgrespro/13/sql-select#SQL-GROUPBY
