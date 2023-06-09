use MonitorMind;

create table Empresa (
idEmpresa int primary key auto_increment,
nomeEmpresa varchar(45),
cnpj char(14),
telefone char(10)
);

create table Usuario (
idUsuario int auto_increment,
nomeUsuario varchar (45),
email varchar (45),
senha varchar (45),
tipo varchar(6),
constraint ctTipo check (tipo in ('Owner', 'Admin', 'Normal')),
fkEmpresa int, 
constraint ctFkEmpresaUser foreign key (fkEmpresa) references Empresa (idEmpresa),
primary key (idUsuario, fkEmpresa)
);

create table Endereco (
idEndereco int auto_increment,
cep char(8),
numero varchar(7),
fkEmpresa int,
constraint ctFkEmpresaEnd foreign key (fkEmpresa) references Empresa (idEmpresa),
primary key (idEndereco, fkEmpresa)
); 

create table Localizacao (
idLocalizacao int primary key auto_increment,
setor varchar(45)
);

create table tipoComponente (
idTipoComponente int primary key auto_increment,
nome varchar(45)
);

create table Componente (
idComponente int primary key auto_increment,
numeroChave double,
unidadeMedida varchar(45),
fkTipo int,
foreign key (fkTipo) references tipoComponente (idTipoComponente)
);

create table Computador (
hostname varchar(45) primary key,
status varchar(15),
constraint ctStatus check (status in ('Operando', 'Manutenção', 'Interrompido')),
sistemaOperacional varchar(45),
mac varchar(45),
fkLocalizacao int,
foreign key (fkLocalizacao) references Localizacao (idLocalizacao),
fkEmpresa int,
foreign key (fkEmpresa) references Empresa (idEmpresa)
);

create table Config(
idConfig int primary key auto_increment,
fkComputador varchar(45),
fkComponente int,
foreign key (fkComputador) references Computador(hostname),
foreign key (fkComponente) references Componente(idComponente)
);

create table Metrica(
idMetrica int primary key auto_increment,
valor float,
unidade varchar(45),
dtCaptura datetime,
fkConfig int,
foreign key (fkConfig) references Config(idConfig)
);

INSERT INTO Empresa (nomeEmpresa, cnpj, telefone) values ('Contax', '12345678901234', '1187878787');
INSERT INTO Usuario (nomeUsuario, email, senha, tipo, fkEmpresa) VALUES ('Monitor Mind','monitormind@email.com', '123', 'Owner', 1);
INSERT INTO Endereco (cep, numero, fkEmpresa) VALUES ('05163020', '8', 1);
INSERT INTO tipoComponente (nome) values ('rede');
INSERT INTO tipoComponente (nome) values ('ram');
INSERT INTO tipoComponente (nome) values ('cpu');
INSERT INTO tipoComponente (nome) values ('ssd');
INSERT INTO tipoComponente (nome) values ('hd');