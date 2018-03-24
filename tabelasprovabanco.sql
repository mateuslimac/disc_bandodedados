create table empregados (
	matricula int,
    nome varchar(50),
    cpf char(11),
    endereco varchar(255),
    salario decimal (10,2),
    cod_dep int,
    primary key (matricula),
    foreign key (cod_dep) references departamentos (codigo)
);

desc empregados;
desc projetos_empregados;

create table projetos_empregados (
	cod_projeto int not null,
    mat_empregado int not null,
    data_alocacao date,
    primary key (cod_projeto, mat_empregado),
    foreign key (cod_projeto) references projetos (codigo),
    foreign key (mat_empregado) references empregados (matricula)
);

create table departamentos (
	codigo int not null,
    nome varchar(50),
    primary key (codigo)
);

create table projetos (
	codigo int not null,
    nome varchar(50),
    data_inicio date,
    data_termino date,
    primary key (codigo)
);