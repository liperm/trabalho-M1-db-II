-------------------------------------------------------------------
-- Otimizado
-- 1- Mostre o nome, em ordem alfabética, e a quantidade consultas que cada médico irá realizar.
create index idx_nome_medico on hospital.medico (nome);

explain analyze select
  m.nome,
  count(m.id) as numero_consultas
from
  hospital.medico m
  inner join hospital.consulta c on c.id_medico = m.id
group by
  m.id
order by
  m.nome asc;

  -- 2- Mostre o nome e a quantidade de consultas de cada especialidade.
create index idx_id_medico on hospital.consulta (id_medico);
create index idx_id_especialidade on hospital.medico (id_especialidade);


-- 2
explain analyze select
  e.nome,
  count(e.id) as numero_consultas
from
  hospital.consulta c
  inner join hospital.medico m on m.id = c.id_medico
  inner join hospital.especialidade e on e.id = m.id_especialidade
group by
  e.id;


create index idx_nome_medico on hospital.medico (nome);
create index idx_nome_especialidade on hospital.especialidade (nome);

-- 4
explain
analyze
select
  m.nome as nome,
  e.nome as especialidade,
  count(m.id) as nmr_consultas
from
  hospital.medico m
  inner join hospital.especialidade e on e.id = m.id_especialidade
  inner join hospital.consulta c on c.id_medico = m.id
group by
  m.id,
  m.nome,
  e.nome
order by
  nmr_consultas desc
limit
  1;

  -- 5
  create index idx_dt_inicio on hospital.consulta(inicio);
create index idx_id_paciente on hospital.consulta(id_paciente);

explain analyze select
  m.nome as medico,
  p.nome as paciente,
  e.nome,
  c.inicio as data
from
  hospital.consulta c
  inner join hospital.medico m on m.id = c.id_medico
  inner join hospital.paciente p on p.id = c.id_paciente
  inner join hospital.especialidade e on e.id = m.id_especialidade
-- order by
--   c.inicio asc;