create schema
  if not exists hospital;

create table if not exists
  hospital.especialidade (id serial primary key, nome varchar);

create table if not exists
  hospital.medico (
    id serial primary key,
    nome varchar,
    celular varchar,
    id_especialidade int references hospital.especialidade (id)
  );

create table if not exists
  hospital.paciente (
    id serial primary key,
    nome varchar,
    celular varchar
  );

create table if not exists
  hospital.consulta (
    id serial primary key,
    id_medico int references hospital.medico (id),
    id_paciente int references hospital.paciente (id),
    inicio timestamp,
    fim timestamp
  );
