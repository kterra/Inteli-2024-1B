--drop table student;
--create schema zuyd_webapp;

CREATE TABLE zuyd_webapp.student(
	id SERIAL PRIMARY KEY,
	first_name TEXT,
	last_name TEXT,
	country_of_birth TEXT,
	gender CHAR(1), 
	university TEXT, 
	birthday DATE);

-- Brasil
INSERT INTO zuyd_webapp.student (first_name, last_name, country_of_birth, gender, university, birthday) VALUES
('João', 'Silva', 'Brasil', 'M', 'Universidade de São Paulo', '1998-05-15'),
('Maria', 'Santos', 'Brasil', 'F', 'Universidade Federal do Rio de Janeiro', '1999-07-23'),
('Pedro', 'Ferreira', 'Portugal', 'M', 'Universidade de Lisboa', '1997-11-02'),
('Ana', 'Martins', 'Portugal', 'F', 'Universidade do Porto', '1998-09-30'),
('Lucas', 'Oliveira', 'Brasil', 'M', 'Universidade Estadual de Campinas', '1999-02-18'),
('Juliana', 'Costa', 'Brasil', 'F', 'Universidade Federal de Minas Gerais', '2000-04-07'),
('Mateus', 'Rodrigues', 'Brasil', 'M', 'Universidade Federal do Rio Grande do Sul', '1998-12-11'),
('Camila', 'Gomes', 'Brasil', 'F', 'Universidade Federal de São Paulo', '1997-10-29'),
('Isabela', 'Almeida', 'Brasil', 'F', 'Universidade Estadual Paulista', '1999-06-25'),
('Rafael', 'Sousa', 'Brasil', 'M', 'Universidade Federal de Santa Catarina', '1998-08-13');


-- Egito
INSERT INTO zuyd_webapp.student (first_name, last_name, country_of_birth, gender, university, birthday) VALUES
('Ahmed', 'Mahmoud', 'Egypt', 'M', 'Alexandria University', '1998-04-05'),
('Fatima', 'Ali', 'Egypt', 'F', 'Ain Shams University', '1999-06-17'),
('Amr', 'Mohamed', 'Egypt', 'M', 'Cairo University', '2000-01-23'),
('Yasmine', 'Ahmed', 'Egypt', 'F', 'Helwan University', '1997-08-12'),
('Omar', 'Said', 'Egypt', 'M', 'University of Alexandria', '1998-11-29'),
('Nour', 'Ibrahim', 'Egypt', 'F', 'Assiut University', '1999-03-14'),
('Ali', 'Abdel', 'Egypt', 'M', 'Mansoura University', '1997-05-27'),
('Laila', 'Youssef', 'Egypt', 'F', 'Suez Canal University', '1998-09-03'),
('Khaled', 'Saleh', 'Egypt', 'M', 'Zagazig University', '2000-07-21'),
('Hala', 'Khalid', 'Egypt', 'F', 'Tanta University', '1997-12-18');

-- Alemanha
INSERT INTO zuyd_webapp.student (first_name, last_name, country_of_birth, gender, university, birthday) VALUES
('Max', 'Müller', 'Germany', 'M', 'Technical University of Munich', '1998-03-05'),
('Sophie', 'Schneider', 'Germany', 'F', 'University of Heidelberg', '1999-05-17'),
('Felix', 'Becker', 'Germany', 'M', 'Ludwig Maximilian University of Munich', '2000-09-21'),
('Hannah', 'Hoffmann', 'Germany', 'F', 'Humboldt University of Berlin', '1997-12-07'),
('Jakob', 'Schulz', 'Germany', 'M', 'University of Freiburg', '1998-02-14'),
('Lea', 'Wagner', 'Germany', 'F', 'RWTH Aachen University', '1999-08-28'),
('Paul', 'Koch', 'Germany', 'M', 'University of Hamburg', '1997-06-03'),
('Laura', 'Schäfer', 'Germany', 'F', 'University of Cologne', '1998-10-10'),
('David', 'Bauer', 'Germany', 'M', 'Goethe University Frankfurt', '2000-04-25'),
('Emma', 'Herrmann', 'Germany', 'F', 'University of Stuttgart', '1997-07-31');

-- Irlanda
INSERT INTO zuyd_webapp.student (first_name, last_name, country_of_birth, gender, university, birthday) VALUES
('Sean', 'Neill', 'Ireland', 'M', 'University College Dublin', '1998-02-13'),
('Aoife', 'Murphy', 'Ireland', 'F', 'Trinity College Dublin', '1999-04-25'),
('Cian', 'Ryan', 'Ireland', 'M', 'University College Cork', '2000-08-29'),
('Niamh', 'Walsh', 'Ireland', 'F', 'Dublin City University', '1997-12-11'),
('Liam', 'Brien', 'Ireland', 'M', 'National University of Ireland Galway', '1998-06-17'),
('Ciara', 'Kennedy', 'Ireland', 'F', 'Maynooth University', '1999-10-23'),
('Eoin', 'Daly', 'Ireland', 'M', 'University of Limerick', '1997-09-05'),
('Roisin', 'McCarthy', 'Ireland', 'F', 'University College Dublin', '1998-03-21'),
('Conor', 'Byrne', 'Ireland', 'M', 'Trinity College Dublin', '2000-07-07'),
('Saoirse', 'Sullivan', 'Ireland', 'F', 'University College Cork', '1997-11-16');

-- México
INSERT INTO zuyd_webapp.student (first_name, last_name, country_of_birth, gender, university, birthday) VALUES
('Juan', 'Lopez', 'Mexico', 'M', 'National Autonomous University of Mexico', '1998-05-20'),
('Sofia', 'Garcia', 'Mexico', 'F', 'Tecnológico de Monterrey', '1999-07-02'),
('Carlos', 'Martinez', 'Mexico', 'M', 'Universidad Iberoamericana', '2000-09-14'),
('Ana', 'Hernandez', 'Mexico', 'F', 'Universidad Nacional Autónoma de México', '1997-10-28'),
('Miguel', 'Rodriguez', 'Mexico', 'M', 'Universidad Autónoma Metropolitana', '1998-12-10'),
('Maria', 'Gonzalez', 'Mexico', 'F', 'Benemérita Universidad Autónoma de Puebla', '1999-02-22'),
('Javier', 'Diaz', 'Mexico', 'M', 'Universidad de Guadalajara', '1997-04-05'),
('Fernanda', 'Perez', 'Mexico', 'F', 'Instituto Politécnico Nacional', '1998-06-17'),
('Ricardo', 'Flores', 'Mexico', 'M', 'Universidad Autónoma de Nuevo León', '2000-08-29'),
('Paulina', 'Sanchez', 'Mexico', 'F', 'Universidad Autónoma de Baja California', '1997-09-13');

-- Japão
INSERT INTO zuyd_webapp.student (first_name, last_name, country_of_birth, gender, university, birthday) VALUES
('Haruto', 'Suzuki', 'Japan', 'M', 'University of Tokyo', '1998-03-14'),
('Yui', 'Takahashi', 'Japan', 'F', 'Kyoto University', '1999-05-26'),
('Riku', 'Tanaka', 'Japan', 'M', 'Osaka University', '2000-08-08'),
('Sakura', 'Watanabe', 'Japan', 'F', 'Tohoku University', '1997-10-22'),
('Ren', 'Ito', 'Japan', 'M', 'Hokkaido University', '1998-01-04'),
('Aoi', 'Yamamoto', 'Japan', 'F', 'Tokyo Institute of Technology', '1999-02-16'),
('Yuto', 'Nakamura', 'Japan', 'M', 'Kyushu University', '1997-04-30'),
('Hina', 'Kobayashi', 'Japan', 'F', 'Nagoya University', '1998-06-13'),
('Taiga', 'Kato', 'Japan', 'M', 'Waseda University', '2000-09-25'),
('Mio', 'Yoshida', 'Japan', 'F', 'Keio University', '1997-11-07');

-- Espanha
INSERT INTO zuyd_webapp.student (first_name, last_name, country_of_birth, gender, university, birthday) VALUES
('Pablo', 'Garcia', 'Spain', 'M', 'University of Barcelona', '1998-04-17'),
('Lucia', 'Martinez', 'Spain', 'F', 'Complutense University of Madrid', '1999-06-29'),
('Alejandro', 'Lopez', 'Spain', 'M', 'Autonomous University of Madrid', '2000-09-11'),
('Carmen', 'Rodriguez', 'Spain', 'F', 'University of Valencia', '1997-10-25'),
('Javier', 'Hernandez', 'Spain', 'M', 'University of Granada', '1998-01-07'),
('Maria', 'Diaz', 'Spain', 'F', 'University of Seville', '1999-02-19'),
('Daniel', 'Perez', 'Spain', 'M', 'Technical University of Madrid', '1997-04-03'),
('Sara', 'Gomez', 'Spain', 'F', 'Polytechnic University of Catalonia', '1998-05-15'),
('Adrian', 'Sanchez', 'Spain', 'M', 'University of Zaragoza', '2000-08-27'),
('Paula', 'Martin', 'Spain', 'F', 'University of Santiago de Compostela', '1997-09-09');

-- Polônia
INSERT INTO zuyd_webapp.student (first_name, last_name, country_of_birth, gender, university, birthday) VALUES
('Jakub', 'Nowak', 'Poland', 'M', 'University of Warsaw', '1998-03-01'),
('Zuzanna', 'Kowalska', 'Poland', 'F', 'Jagiellonian University', '1999-04-13'),
('Kacper', 'Wójcik', 'Poland', 'M', 'Adam Mickiewicz University', '2000-07-25'),
('Maja', 'Lewandowska', 'Poland', 'F', 'Warsaw University of Technology', '1997-12-09'),
('Michał', 'Kowalczyk', 'Poland', 'M', 'Wrocław University of Science and Technology', '1998-05-23'),
('Julia', 'Duda', 'Poland', 'F', 'AGH University of Science and Technology', '1999-06-04'),
('Piotr', 'Zieliński', 'Poland', 'M', 'University of Wrocław', '1997-09-17'),
('Natalia', 'Szymańska', 'Poland', 'F', 'University of Gdańsk', '1998-02-28'),
('Adam', 'Lis', 'Poland', 'M', 'Jagiellonian University', '2000-08-11'),
('Aleksandra', 'Pawlak', 'Poland', 'F', 'University of Łódź', '1997-11-24');

-- Holanda
INSERT INTO zuyd_webapp.student (first_name, last_name, country_of_birth, gender, university, birthday) VALUES
('Daan', 'De Jong', 'Netherlands', 'M', 'University of Amsterdam', '1998-04-02'),
('Emma', 'Van Der Berg', 'Netherlands', 'F', 'Leiden University', '1999-06-14'),
('Lucas', 'Bakker', 'Netherlands', 'M', 'Utrecht University', '2000-09-26'),
('Sophie', 'Van Dijk', 'Netherlands', 'F', 'Erasmus University Rotterdam', '1997-10-10'),
('Noah', 'Visser', 'Netherlands', 'M', 'University of Groningen', '1998-01-22'),
('Lotte', 'De Vries', 'Netherlands', 'F', 'Delft University of Technology', '1999-03-05'),
('Thijs', 'Jansen', 'Netherlands', 'M', 'University of Twente', '1997-05-17'),
('Fleur', 'Van Den Heuvel', 'Netherlands', 'F', 'Eindhoven University of Technology', '1998-07-29'),
('Milan', 'Vermeer', 'Netherlands', 'M', 'Wageningen University & Research', '2000-11-10'),
('Fenna', 'Bos', 'Netherlands', 'F', 'Tilburg University', '1997-12-24');

-- Estados Unidos
INSERT INTO zuyd_webapp.student (first_name, last_name, country_of_birth, gender, university, birthday) VALUES
('Jacob', 'Smith', 'United States', 'M', 'Harvard University', '1998-03-11'),
('Emma', 'Johnson', 'United States', 'F', 'Stanford University', '1999-05-23'),
('Michael', 'Williams', 'United States', 'M', 'Massachusetts Institute of Technology', '2000-08-05'),
('Olivia', 'Brown', 'United States', 'F', 'California Institute of Technology', '1997-10-19'),
('Ethan', 'Jones', 'United States', 'M', 'Princeton University', '1998-01-31'),
('Ava', 'Miller', 'United States', 'F', 'Columbia University', '1999-04-12'),
('Matthew', 'Davis', 'United States', 'M', 'Yale University', '1997-06-24'),
('Sophia', 'Wilson', 'United States', 'F', 'University of Chicago', '1998-09-06'),
('William', 'Taylor', 'United States', 'M', 'University of Pennsylvania', '2000-11-18'),
('Isabella', 'Anderson', 'United States', 'F', 'Northwestern University', '1997-12-02');

