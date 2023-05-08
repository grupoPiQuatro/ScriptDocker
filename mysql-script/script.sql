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
serialComputador varchar(15) primary key,
sistemaOperacional varchar(45),
status varchar(15),
constraint ctStatus check (status in ('Operando', 'Manutenção', 'Interrompido')),
fkLocalizacao int,
constraint ctFkLocalizacao foreign key (fkLocalizacao) references Localizacao (idLocalizacao),
fkEmpresa int,
constraint ctFkEmpresa foreign key (fkEmpresa) references Empresa (idEmpresa)
);