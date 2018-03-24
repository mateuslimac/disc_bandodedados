alter table empregados add constraint unique (cpf);

alter table empregados add constraint check (salario>0);
desc empregados;

select e.nome, p.nome from empregados e inner join projetos_empregados pe on
pe.mat_empregado = e.matricula inner join projetos p on p.codigo = pe.cod.projeto
where p.data_inicio>= '2017-01-01' and data_inicio <= '2017-12-31';

select e.nome from empregados e inner join departamentos d on d.codigo = e.cod_dep
inner join projetos_empregados pe on pe.mat_empregado = e.matricula
where pe.data_alocacao >= '2017-04-01'
and   pe.data_alocacao <= '2017-04-30'
and d.nome_dep = 'TI';

