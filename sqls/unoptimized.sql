 --------------------------------------------------------------------
-- Não Otimizado
-- 1- Mostre o nome, em ordem alfabética, e a quantidade consultas que cada médico irá realizar.
select
  m.nome,
  count(m.id) as numero_consultas
from
  hospital.medico m
  join hospital.consulta c on c.id_medico = m.id
group by
  m.id
order by
  m.nome asc;

-- 2- Mostre o nome e a quantidade de consultas de cada especialidade.
select
  e.nome,
  count(e.id) as numero_consultas
from
  hospital.consulta c
  join hospital.medico m on m.id = c.id_medico
  join hospital.especialidade e on e.id = m.id_especialidade
group by
  e.id;

-- 3- Mostre o dia e o mês (formato DD/MM), e a maior duração (diferença entre início e fim) nas consultas de cada dia.
select
  to_char(inicio, 'dd/mm') as dia_mes,
  max(
    extract(
      epoch
      from
        (fim - inicio)
    )
  ) as maior_duracao_segundos
from
  hospital.consulta
group by
  to_char(inicio, 'dd/mm');

-- 4- Mostre a quantidade, o nome da especialidade e o nome do médico que mais realizou consultas.
select
  m.nome as nome,
  e.nome as especialidade,
  count(m.id) as nmr_consultas
from
  hospital.medico m
  join hospital.especialidade e on e.id = m.id_especialidade
  join hospital.consulta c on c.id_medico = m.id
group by
  m.id,
  m.nome,
  e.nome
order by
  count(m.id) desc
limit
  1;

-- 5- Mostre o nome do paciente, o nome do médico, o nome da especialidade e o dia 
-- e hora do início de todas as consultas. Ordenar pela data e hora de início. Apelidar todas as colunas da seguinte forma: paciente, médico, especialidade e data.
select
  m.nome as medico,
  p.nome as paciente,
  e.nome,
  c.inicio as data
from
  hospital.consulta c
  join hospital.medico m on m.id = c.id_medico
  join hospital.paciente p on p.id = c.id_paciente
  join hospital.especialidade e on e.id = m.id_especialidade
order by
  c.inicio asc;
