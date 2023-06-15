create table medico(
	crm_med integer not null,
	nome_med varchar(255) not null,
	ender_med varchar(255) not null,
	cidade_med varchar(255) not null, 
	uf_med varchar(5) not null,
	primary key(crm_med)
);
 select * from medico

create table paciente(
	cod_pac integer not null,
	nome_pac varchar(255) not null,
	ender_pac varchar(255) not null,
	cidade_pac varchar(255) not null,
	uf_pac varchar(5) not null,
	fone_pac varchar(255),
	primary key(cod_pac)
);
select * from paciente

create table consulta(
	cod_cons integer not null,
	data_cons DATE not null,
	hora_conse TIME not null,
	crm_med_cons integer not null,
	cod_pac_cons integer not null,
	hist_cons varchar(255) not null,
	primary key(cod_cons),
	foreign key(crm_med_cons) references medico(crm_med),
	foreign key(cod_pac_cons) references paciente(cod_pac)
);
select * from consulta

create table especialidade(
	cod_esp integer not null,
	especialidade varchar(255) not null,
	primary key(cod_esp)
);

select * from especialidade

create table fonemedico(
	cod_fone integer not null,
	crm_med_fone integer not null,
	numero_fone varchar(255) not null,
	primary key(cod_fone),
	foreign key(crm_med_fone)references medico(crm_med)
);

select * from fonemedico

create table espMedico(
	cod_espMedico integer not null,
	crm_med_espMedico integer not null,
	cod_esp_espMedico integer not null,
	primary key(cod_espMedico),
	foreign key(crm_med_espMedico) references medico(crm_med),
	foreign key(cod_esp_espMedico) references especialidade(cod_esp)
);

select * from espMedico
 
 insert into medico values(1000,'Maria da Dores','Rua das acacias','Chapecó','SC');
insert into medico values(1001,'Joao da Silva','Rua dos coqueiros','Xaxim','SC');
insert into medico values(1002,'Ana Paula','Rua São Paulo','Chapecó','SC');
insert into medico values(1003,'Flavio','Rua São João','Xanxere','SC');

insert into paciente values(1,'Maria Ana Soares','Av Getulio Vargas','Chapecó','SC','3238888');
insert into paciente values(2,'Carlos','Av Fernando Machado','Chapecó','SC','3234598');
insert into paciente values(3,'Pedro','Rua do Comercio','Xaxim','SC','3222020');

insert into consulta values(1,'2000-05-01','14:00:00',1001,1,'Fratura');
insert into consulta values(2,'2000-05-30','09:00:00',1002,3,'Refluxo');
insert into consulta values(3,'2000-11-11','13:15:00',1001,1,'Pé quebrado');
insert into consulta values(4,'2000-11-22','08:00:00',1000,2,'Dor de cabeça');

insert into especialidade values(100,'Otorrinolagingologista');
insert into especialidade values(101,'Ortopedista');
insert into especialidade values(102,'Pediatra');
insert into especialidade values(103,'Gatro');
insert into especialidade values(104,'Cirurgião');
insert into especialidade values(105,'Clinico Geral');

insert into fonemedico values(1,1000,'99876565');
insert into fonemedico values(2,1001,'99876060');
insert into fonemedico values(3,1001,'99972309');
insert into fonemedico values(4,1002,'3232120');
insert into fonemedico values(5,1002,'3234478');
insert into fonemedico values(6,1003,'3249087');

insert into espMedico values(1,1000,105);
insert into espMedico values(2,1001,101);
insert into espMedico values(3,1002,102);
insert into espMedico values(4,1003,103);
							
	select from consulta;
	
	
	/*Retornar o nome, endereço e telefone do paciente*/
	select  nome_pac,ender_pac,fone_pac from paciente;
	
	/* Retornar os nomes e telefones de cada médico*/
	select nome_med,numero_fone from medico JOIN fonemedico ON crm_med = crm_med_fone;
	
	/* Retornar os nome,enderço de cada médico*/
	select nome_med,ender_med,numero_fone from medico JOIN fonemedico ON crm_med = crm_med_fone;
	
	/* Retornar o nome de cada paciente, a data e hora de suas  consultas*/
	select nome_pac,data_cons,hora_conse from paciente JOIN consulta ON cod_pac = cod_pac_cons;
	
	/*Retornar o nome dos médicos e suas especialidades*/
	select nome_med,especialidade from medico
									JOIN espMedico on crm_med = crm_med_espMedico
									JOIN especialidade on cod_esp = cod_esp_espMedico;
									
	/*-Retornar o nome do paciente, data e hora da consulta eo nome do médico que vai atender*/
	select nome_pac,data_cons,hora_conse,nome_med,especialidade from paciente 
														JOIN consulta ON cod_pac = cod_pac_cons
														JOIN medico ON crm_med = crm_med_cons
														JOIN espMedico on crm_med = crm_med_espMedico
														JOIN especialidade on cod_esp = cod_esp_espMedico;
	