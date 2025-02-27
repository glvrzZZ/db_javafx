create table material_type (
	id int primary key,
	name text not null,
	percent int not null
);

insert into material_type (id, name, percent) values (1,'Òèï ìàòåðèàëà 1', '10');
insert into material_type (id, name, percent) values (2,'Òèï ìàòåðèàëà 2', '95');
insert into material_type (id, name, percent) values (3,'Òèï ìàòåðèàëà 3', '28');
insert into material_type (id, name, percent) values (4,'Òèï ìàòåðèàëà 4', '55');
insert into material_type (id, name, percent) values (5,'Òèï ìàòåðèàëà 5', '34');

create table production_type (
	id int primary key,
	name text not null,
	coeff float not null
);

insert into production_type (id, name, coeff) values (1,'Ëàìèíàò',		2.35);
insert into production_type (id, name, coeff) values (2,'Ìàññèâíàÿ äîñêà',	5.15);
insert into production_type (id, name, coeff) values (3,'Ïàðêåòíàÿ äîñêà',	4.34);
insert into production_type (id, name, coeff) values (4,'Ïðîáêîâîå ïîêðûòèå', 	1.5);


create table partner (
	id int primary key,
	partner_type text not null,
	name text not null,
	director text not null,
	director_email text not null,
	partner_phone text not null,
	partner_legal_address text not null,
	inn text not null,
	rating int not null
);

insert into partner (id, partner_type, name, director, director_email, partner_phone, partner_legal_address, inn, rating) values (1, 'ÇÀÎ','Áàçà Ñòðîèòåëü',	'Èâàíîâà Àëåêñàíäðà Èâàíîâíà',		'aleksandraivanova@ml.ru', 	'493 123 45 67','652050, Êåìåðîâñêàÿ îáëàñòü, ãîðîä Þðãà, óë. Ëåñíàÿ, 15',		'2222455179',7);
insert into partner (id, partner_type, name, director, director_email, partner_phone, partner_legal_address, inn, rating) values (2, 'ÎÎÎ','Ïàðêåò 29',		'Ïåòðîâ Âàñèëèé Ïåòðîâè÷',		'vppetrov@vl.ru',		'987 123 56 78','164500, Àðõàíãåëüñêàÿ îáëàñòü, ãîðîä Ñåâåðîäâèíñê, óë. Ñòðîèòåëåé, 18','3333888520',7);
insert into partner (id, partner_type, name, director, director_email, partner_phone, partner_legal_address, inn, rating) values (3, 'ÏÀÎ','Ñòðîéñåðâèñ',		'Ñîëîâüåâ Àíäðåé Íèêîëàåâè÷',		'ansolovev@st.ru',		'812 223 32 00','188910, Ëåíèíãðàäñêàÿ îáëàñòü, ãîðîä Ïðèìîðñê, óë. Ïàðêîâàÿ, 21',	'4440391035',7);
insert into partner (id, partner_type, name, director, director_email, partner_phone, partner_legal_address, inn, rating) values (4, 'ÎÀÎ','Ðåìîíò è îòäåëêà',	'Âîðîáüåâà Åêàòåðèíà Âàëåðüåâíà',	'ekaterina.vorobeva@ml.ru',	'444 222 33 11','143960, Ìîñêîâñêàÿ îáëàñòü, ãîðîä Ðåóòîâ, óë. Ñâîáîäû, 51',		'1111520857',5);
insert into partner (id, partner_type, name, director, director_email, partner_phone, partner_legal_address, inn, rating) values (5, 'ÇÀÎ','ÌîíòàæÏðî',		'Ñòåïàíîâ Ñòåïàí Ñåðãååâè÷',		'stepanov@stepan.ru',		'912 888 33 33','309500, Áåëãîðîäñêàÿ îáëàñòü, ãîðîä Ñòàðûé Îñêîë, óë. Ðàáî÷àÿ, 122',	'5552431140',10);


create table production (
	id int primary key,
	type_id int not null,
	name text not null,
	articul text not null,
	min_price float not null
);


alter table production
	add constraint production_type_id foreign key (type_id) references production_type (id);




insert into production (id, type_id, name, articul,min_price) values (1, 3, 'Ïàðêåòíàÿ äîñêà ßñåíü òåìíûé îäíîïîëîñíàÿ 14 ìì',		'8758385',4456.90);
insert into production (id, type_id, name, articul,min_price) values (2, 3, 'Èíæåíåðíàÿ äîñêà Äóá Ôðàíöóçñêàÿ åëêà îäíîïîëîñíàÿ 12 ìì',	'8858958',7330.99);
insert into production (id, type_id, name, articul,min_price) values (3, 1, 'Ëàìèíàò Äóá äûì÷àòî-áåëûé 33 êëàññ 12 ìì',			'7750282',1799.33);
insert into production (id, type_id, name, articul,min_price) values (4, 1, 'Ëàìèíàò Äóá ñåðûé 32 êëàññ 8 ìì ñ ôàñêîé',			'7028748',3890.41);
insert into production (id, type_id, name, articul,min_price) values (5, 4, 'Ïðîáêîâîå íàïîëüíîå êëååâîå ïîêðûòèå 32 êëàññ 4 ìì',		'5012543',5450.59);

create table partner_production (
	id int primary key,
	production_id int not null,
	partner_id int not null,
	quantity bigint not null,
	sell_date date not null
);


alter table partner_production
	add constraint partner_production_production_id foreign key (production_id) references production (id);


alter table partner_production
	add constraint partner_production_partner_id foreign key (partner_id) references partner (id);



insert into partner_production (id,production_id,partner_id,quantity,sell_date) values (1,1,	1,	15500,	'2023-03-23');
insert into partner_production (id,production_id,partner_id,quantity,sell_date) values (2,3,	1,	12350,	'2023-12-18');
insert into partner_production (id,production_id,partner_id,quantity,sell_date) values (3,4,	1,	37400,	'2024-06-07');
insert into partner_production (id,production_id,partner_id,quantity,sell_date) values (4,2,	2,	35000,	'2022-12-02');
insert into partner_production (id,production_id,partner_id,quantity,sell_date) values (5,5,	2,	1250,	'2023-05-17');
insert into partner_production (id,production_id,partner_id,quantity,sell_date) values (6,3,	2,	1000,	'2024-06-07');
insert into partner_production (id,production_id,partner_id,quantity,sell_date) values (7,1,	2,	7550,	'2024-07-01');
insert into partner_production (id,production_id,partner_id,quantity,sell_date) values (8,1,	3,	7250,	'2023-01-22');
insert into partner_production (id,production_id,partner_id,quantity,sell_date) values (9,2,	3,	2500,	'2024-07-05');
insert into partner_production (id,production_id,partner_id,quantity,sell_date) values (10,4,	4,	59050,	'2023-03-20');
insert into partner_production (id,production_id,partner_id,quantity,sell_date) values (11,3,	4,	37200,	'2024-03-12');
insert into partner_production (id,production_id,partner_id,quantity,sell_date) values (12,5,	4,	4500,	'2024-05-14');
insert into partner_production (id,production_id,partner_id,quantity,sell_date) values (13,3,	5,	50000,	'2023-09-19');
insert into partner_production (id,production_id,partner_id,quantity,sell_date) values (14,4,	5,	670000,	'2023-11-10');
insert into partner_production (id,production_id,partner_id,quantity,sell_date) values (15,1,	5,	35000,	'2024-04-15');
insert into partner_production (id,production_id,partner_id,quantity,sell_date) values (16,2,	5,	25000,	'2024-06-12');
