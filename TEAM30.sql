
-- drop database nyahomedical;
CREATE DATABASE nyahomedical;
USE nyahomedical;

-- Person table
CREATE TABLE person (
	first_name varchar(25) NOT NULL,
    middle_name varchar(25),
    last_name varchar(25) NOT NULL,
    gender enum('Male', 'Female'),
    age INT,
    phone_number varchar(12),
    email varchar(25) check (email like '%@%'),
    person_id INT PRIMARY KEY NOT NULL 
);
INSERT INTO person (first_name, middle_name, last_name, gender,age, phone_number,email,person_id)
 VALUES ('Chris','Martin','Kelvin','M','19','01123147789','aiudni@gmail.com',0111111),
 ('Chrisie','Martn','Kelsa','M','19','0113147789','aiudn@gmail.com',0111122),
 ('Mark','Watkins','Dan','M','01174592013',29040,'sks@gmail.com',0111123),
 ('Diel','Williams','Walter','M',NULL,null,01111124),
 ('Sarah','Taylor','Serop','F','01176348290','39','sjns@gmail.com',0111125),
 ('Katie','Armstrong','Sena','F','01145787353','239','wjsi@hotmail.com',0111126),
 ('Kat','Atrong','Sean','F','0114577353','29','Wiggle@hotmail.com',0111127),
 ('Kok','Aong','Yaw','F','01145787353','239','wjsi@hotmail.com',0111128),
 ('Kok','Armstrong','Sena','F','01145787353','239','wjsi@hotmail.com',0111129),
 ('Kok','Armstrong','Sena','F','01145787353','239','wjsi@hotmail.com',01111200);

 
-- Doctor table
CREATE TABLE doctor (
	doctor_id int PRIMARY KEY NOT NULL,
    person_id int,
    foreign key doctor(person_id) references person(person_id)
);
insert into doctor values(01011,0111111);
insert into doctor values(01022,0111122);
insert into doctor values(01031,0111123);
insert into doctor values(01042,0111124);
insert into doctor values(01045,0111125);
insert into doctor values(01012,0111116);
insert into doctor values(01023,0111127);
insert into doctor values(01034,0111128);
insert into doctor values(01065,0111129);
insert into doctor values(01075,0111100);

-- Diagnosis table
CREATE TABLE diagnosis(
	diagnosis_id INT PRIMARY KEY NOT NULL,
    diagnosis_name varchar (50)
);
insert into diagnosis values('tuberculosis');
insert into diagnosis values('malaria');
insert into diagnosis values('asthma');
insert into diagnosis values('stomachache');
insert into diagnosis values('diarrhea');
insert into diagnosis values('chlamydia');
insert into diagnosis values('syphilis');
insert into diagnosis values('allergies');
insert into diagnosis values('avianinfluenza');
insert into diagnosis values('arthritis');

-- Patient table
CREATE TABLE patient(
	patient_id INT PRIMARY KEY NOT NULL ,
    person_id INT NOT NULL,
    diagnosis_id INT NOT NULL,
    doctor_id INT NOT NULL,
    
    foreign key (person_id) references person(person_id),
    foreign key (doctor_id) references doctor(doctor_id),
    foreign key (diagnosis_id) references diagnosis(diagnosis_id)
);


-- Surgeon table
CREATE TABLE surgeon (
	doctor_id int NOT NULL,
    specialty varchar(25) NOT NULL,
    foreign key surgeon(doctor_id) references doctor(doctor_id)
);
insert into surgeon values(01011,'Cardiologists');
insert into surgeon values(01022,'Colon Surgeon');
insert into surgeon values(01031,'Dermatologist');
insert into surgeon values(01042,'Endocrinologists');
insert into surgeon values(01045,'Endocrinologists');
insert into surgeon values(01014,'Hematologists');
insert into surgeon values(01015,'Gastroenterologists');
insert into surgeon values(01014,'hematologists');
insert into surgeon values(01014,'hematologists');
insert into surgeon values(01014,'Family Physicians');

-- Nurse table
CREATE TABLE nurse(
	nurse_id INT PRIMARY KEY NOT NULL,
    person_id INT NOT NULL,
    doctor_id INT NOT NULL,
    foreign key (person_id) references person(person_id),
    foreign key (doctor_id) references doctor(doctor_id)
);

-- Laboratory table
CREATE TABLE laboratory(
	lab_id INT PRIMARY KEY NOT NULL,
    patient_id INT,
    doctor_id INT,
    date_visited datetime,
    amount decimal,
    
    foreign key (patient_id) references patient(patient_id),
    foreign key (doctor_id) references doctor(doctor_id)
);


-- Medication table
CREATE table medication(
	medication_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    medication_name varchar(50)
);
INSERT INTO medication VALUES ('Amoxacylin');
INSERT INTO medication VALUES ('panadol');
INSERT INTO medication VALUES ('paracetamol');
INSERT INTO medication VALUES ('Keratin');
INSERT INTO medication VALUES ('flaxin');

-- Bill table
CREATE TABLE bill(
	bill_id INT PRIMARY KEY NOT NULL,
    doctor_charge decimal NOT NULL,
    room_charge decimal,
    number_of_days int,
    lab_charge decimal,
    patient_id int NOT NULL,
    
    foreign key (patient_id) references patient(patient_id)
);

-- Inpatient table
CREATE TABLE inpatient(
	patient_id INT NOT NULL,
    room_number INT NOT NULL,
    date_of_admission datetime NOT NULL,
    date_of_discharge datetime,
    time_of_death datetime,
    doctor_id INT,
    lab_id INT,
    
    foreign key (doctor_id) references doctor(doctor_id),
    foreign key (lab_id) references laboratory(lab_id)
);

-- Outpatient table
CREATE table outpatient(
	patient_id INT NOT NULL,
    date_of_discharge datetime NOT NULL,
    doctor_id INT,
    
    foreign key (patient_id) references patient(patient_id),
    foreign key (doctor_id) references doctor(doctor_id)
);

-- Blood Bank table
CREATE TABLE bloodbank(
	donor_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    blood_type varchar(4) NOT NULL,
    person_id INT,
    
    foreign key (person_id) references person(person_id)
);


-- Ward table
CREATE TABLE ward(
	ward_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    ward_name varchar(25)
);

-- Room table
CREATE TABLE room(
	room_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    roomType varchar(25),
    room_status enum('0', '1', '2', '3', '4'),
    ward_id INT NOT NULL,
    nurse_id INT,
    
    foreign key (ward_id) references ward(ward_id),
    foreign key (nurse_id) references nurse(nurse_id)
);
