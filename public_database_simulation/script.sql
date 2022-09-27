--select * from core_user
--where id IN
--(
--select user_id from (
--select count(*) as nb_comparison,user_id from tournesol_comparison
--group by user_id) as comp_count
--where nb_comparison>=1000
--)


update core_user
set is_superuser=True
where id IN
(
select user_id from (
select count(*) as nb_comparison,user_id from tournesol_comparison
group by user_id) as comp_count
where nb_comparison>=1000
);

--select * from core_user

--tournesolpassword
--pbkdf2_sha256$320000$2HrgDXi0wmCZkEXt0GKsRL$zQ6JDahm2NdGDanygDzZfIZxxzLutX2F7Q/2hVRkUlk=

update core_user
set password='pbkdf2_sha256$320000$2HrgDXi0wmCZkEXt0GKsRL$zQ6JDahm2NdGDanygDzZfIZxxzLutX2F7Q/2hVRkUlk=';

create sequence id_seq;
update core_user  
  set username = 'user'||CAST(nextval('id_seq') as VARCHAR);
drop sequence id_seq;

select count(*) from core_user

create sequence id_seq;
update tournesol_entity  
  set uid = nextval('id_seq')
  where type='video';
drop sequence id_seq;
