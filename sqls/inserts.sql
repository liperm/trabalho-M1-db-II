INSERT INTO
  hospital.especialidade (nome)
VALUES
  ('Cardiologia'),
  ('Pediatria'),
  ('Ortopedia'),
  ('Dermatologia'),
  ('Oftalmologia');

-- Inserting data into the hospital.medico table
INSERT INTO
  hospital.medico (nome, celular, id_especialidade)
VALUES
  ('Dr. Smith', '123-456-7890', 1), -- Cardiologia
  ('Dr. Garcia', '987-654-3210', 2), -- Pediatria
  ('Dr. Johnson', '555-555-5555', 3), -- Ortopedia
  ('Dr. Brown', '111-111-1111', 4), -- Dermatologia
  ('Dr. White', '222-222-2222', 5);

 -- Oftalmologia
-- Inserting data into the hospital.paciente table
INSERT INTO
  hospital.paciente (nome, celular)
VALUES
  ('John Doe', '111-222-3333'),
  ('Jane Doe', '444-555-6666'),
  ('Alice Smith', '777-888-9999'),
  ('Michael Johnson', '333-333-3333'),
  ('Emily Wilson', '444-444-4444'),
  ('Sophia Lee', '555-555-5555');

-- Inserting data into the hospital.consulta table
INSERT INTO
  hospital.consulta (id_medico, id_paciente, inicio, fim)
VALUES
  (
    1,
    1,
    '2024-04-17 09:00:00',
    '2024-04-17 09:30:00'
  ),
  (
    2,
    2,
    '2024-04-17 10:00:00',
    '2024-04-17 10:30:00'
  ),
  (
    3,
    3,
    '2024-04-17 11:00:00',
    '2024-04-17 11:30:00'
  ),
  (
    4,
    4,
    '2024-04-18 09:00:00',
    '2024-04-18 09:30:00'
  ),
  (
    5,
    5,
    '2024-04-18 10:00:00',
    '2024-04-18 10:30:00'
  );
