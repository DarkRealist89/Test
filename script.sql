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


insert into roles (name, team_id) values ('Артем', 1);
insert into users (name, email, hash, salt, date_create, role_id, team_id) values ('Аретм', 'dark@mail.ru','233' ,'3434' ,'2022-06-29', (select "_id" from roles where "name"= 'Артем' limit 1), 1 );

insert into users (name, email, hash, salt, date_create, role_id, team_id) values ('Аретм', 'dark@mail.ru','233' ,'3434' ,(select "date_create" from users where "name" = 'system') ,( select "role_id" from users where "name"= 'system') , 1 );

update users set name='Вася' where name='Арyyтм';
update users set hash ='333', salt ='ttt' where name='Аретм';
delete from users where "hash" in ('333');

select
	u.name,
	t.name as teams_name,
	r.name as role_name
from 
	users u  
	left join roles r  on 
	u.role_id = r."_id"
	left join teams t on
	r.team_id = t."_id" ;
	
	
	
	
	
https://postgrespro.ru/docs/postgrespro/13/functions-aggregate
https://postgrespro.ru/docs/postgrespro/13/functions-comparison
https://postgrespro.ru/docs/postgrespro/13/sql-select#SQL-GROUPBY


        // const alias = "al";
        // const tempItems = await this.connection
        //     .createQueryBuilder(MdlpBatch, alias)
        //     .select([`${alias}.${MdlpBatchFields.gtin}`, `${alias}.${MdlpBatchFields.gnvlp}`])
        //     .distinct(true)
        //     .orderBy(`${alias}.${MdlpBatchFields.gtin}`)
        //     .getRawMany();
        // console.log(tempItems);

        // const alias = "al";
        // const tempItems = await this.connection
        //     .createQueryBuilder(MdlpBatch, alias)
        //     // .select([`${alias}.${MdlpBatchFields.gtin}`, `${alias}.${MdlpBatchFields.gnvlp}`])
        //     .andWhere(`${alias}.${MdlpBatchFields.count_sgtin} <= 10000`)
        //     .orWhere(`${alias}.${MdlpBatchFields.count_sgtin} >= 20000`)
        //     .orderBy(`${alias}.${MdlpBatchFields.count_sgtin}`)
        //     .getRawMany();
        // console.log(tempItems);

        // const alias = "al";
        // const tempItems = await this.connection
        //     .createQueryBuilder(MdlpBatch, alias)
        //     .andWhere(`${alias}.${MdlpBatchFields.gnvlp} != true`)
        //     .getRawMany();
        // console.log(tempItems);

        // const alias = "al";
        // const tempItems = await this.connection
        //     .createQueryBuilder(MdlpBatch, alias)
        //     .select(`${alias}.${MdlpBatchFields.batch}`)
        //     .distinct(true)
        //     .orderBy(`${alias}.${MdlpBatchFields.batch}`)

        //     .getRawMany();
        // console.log(tempItems);

        // const alias = "al";
        // const tempItems = await this.connection
        //     .createQueryBuilder(MdlpBatch, alias)
        //     .select(`${alias}.${MdlpBatchFields.gtin}`, MdlpBatchFields.gtin)
        //     .addSelect(`${alias}.${MdlpBatchFields.gnvlp}`, MdlpBatchFields.gnvlp)
        //     .addSelect(`count(*)`, "test")
        //     .groupBy(`${alias}.${MdlpBatchFields.gtin}`)
        //     .addGroupBy(`${alias}.${MdlpBatchFields.gnvlp}`)
        //     .having(`count(*) > :cnt`, { cnt: 20 })
        //     .orderBy("test")
        //     .getRawMany();
        // console.log(tempItems);

        // const alias = "u";
        // const buider = this.connection
        //     .createQueryBuilder(User, alias)
        //     .leftJoin(`${alias}.${UserFields.role}`, "r")
        //     .leftJoin(`r.${RoleFields.team}`, "t")
        //     .select(`${alias}.${UserFields.name}`, "name")
        //     .addSelect(`r.${RoleFields.name}`, "role_name")
        //     .addSelect(`t.${TeamFields.name}`, "teams_name");
        // // console.log(buider.clone().getQueryAndParameters());
        // const tempItems = await buider.getRawMany();
        // console.log(tempItems);

        // const alias = "r";
        // const foundRole = await this.connection
        //     .createQueryBuilder(Role, alias)
        //     .select(`r.${RoleFields.name}`)
        //     .where({ name: "Вася" })
        //     .getOne();

        // if (!foundRole) {
        //     const tempItems1 = await this.connection
        //         .createQueryBuilder(Role, alias)
        //         .insert()
        //         .values({ name: "Вася", team })
        //         .execute();
        //     console.log(tempItems1);
        // }

        // const tempItems = await this.connection
        //     .createQueryBuilder(Role, alias)
        //     .update()
        //     .set({ name: "Вася" })
        //     .where({ name: "aard" })
        //     .execute();
        // console.log(tempItems);

        // const tempItems2 = await this.connection
        //     .createQueryBuilder(Role, alias)
        //     .delete()
        //     .where({ name: "fdfd" })
        //     .execute();

        // const tempItems12 = await this.connection
        //     .createQueryBuilder(User, alias)
        //     .insert()
        //     .values({
        //         name: "aard",
        //         email: "d@D",
        //         hash: "3333",
        //         salt: "11112",
        //         date_create: "2022-06-29",
        //         role: "7943e250-017c-4992-a697-f019f46036af" as any,
        //         team,
        //     })
        //     .execute();
        // console.log(tempItems1);

        // const tempItems1 = await this.connection
        //     .createQueryBuilder(MdlpBatch, alias)
        //     .select(`${alias}.${MdlpBatchFields.gtin}`, MdlpBatchFields.gtin)
        //     .addSelect(`${alias}.${MdlpBatchFields.gnvlp}`, MdlpBatchFields.gnvlp)
        //     .distinct(true)
        //     .orderBy(`${alias}.${MdlpBatchFields.gtin}`)
        //     .getRawMany<{
        //         [MdlpBatchFields.gtin]: string;
        //         [MdlpBatchFields.gnvlp]: boolean;
        //     }>();
        // console.log(tempItems1);
