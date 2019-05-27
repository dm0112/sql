set serveroutput on;
------------------------------------------------ procedura
create or replace procedure populareProdCatI
as
BEGIN
for i in 1 ..100000 loop
INSERT INTO products(PRODID,PRODNAME,PRODDESC,PRODPRICE,CATID,INITIALSTOCK,CURRENTSTOCK)
values (prodID_seq.nextval, 
dbms_random.string('u',10), 
dbms_random.string('l',15), 
round(dbms_random.value(10,10000)),
1,
round(dbms_random.value(5000,10000)), 
round(dbms_random.value(0,5000))
);

end loop;
end;

BEGIN
populareProdCatI();
end;
--------------------------------------------------------------- functie + exceptie
create or replace function populareProdCatX(categorie_var number, inregistrari_var number)
return varchar2
as
e_invalid_numbers exception;
BEGIN
if (inregistrari_var < 0 or categorie_var < 0) then
RAISE e_invalid_numbers;
end if;
for i in 1 ..inregistrari_var loop
INSERT INTO products(PRODID,PRODNAME,PRODDESC,PRODPRICE,CATID,INITIALSTOCK,CURRENTSTOCK)
values (prodID_seq.nextval, 
dbms_random.string('u',10), 
dbms_random.string('l',15), 
round(dbms_random.value(10,10000)),
categorie_var,
round(dbms_random.value(5000,10000)), 
round(dbms_random.value(0,5000))
);
end loop;
return 'ok';
EXCEPTION WHEN e_invalid_numbers then
dbms_output.put_line('Negative numbers detected, use only positive!!');

end populareProdCatX;
--------------------------------------
declare
message varchar2(20);
begin
message := populareProdCatX(2,10);
end;
 -----------------------------------------------------------------------------
declare
message varchar2(20);
begin
for i in 2..6 loop
message := populareProdCatX(i,200000);
end loop;
end;
-----
select count(*) from products; -------

--------------------------------------------------------------------------------
create or replace function populareUseri(inregistrari_var number)
return varchar2
as
begin
for i in 1 ..inregistrari_var loop
insert into users(USERID, PW, FIRSTNAME, LASTNAME, ADRESA, PRIVILEGIES, PHONENUMBER)
VALUES (USERID_SEQ.nextVal,
DBMS_RANDOM.STRING('X',round(DBMS_RANDOM.VALUE(5,15))),
DBMS_RANDOM.STRING('U',round(DBMS_RANDOM.VALUE(5,15))),
DBMS_RANDOM.STRING('U',round(DBMS_RANDOM.VALUE(5,15))),
DBMS_RANDOM.STRING('U',round(DBMS_RANDOM.VALUE(10,20))),
'0',
'07'||''||ROUND(DBMS_RANDOM.VALUE(9999999,99999999))
);

end loop;
return 'ok';
end populareUseri;
----------
declare
mess varchar2(20);
begin
mess := populareUseri(200000);
end;


select count(*) from users;


