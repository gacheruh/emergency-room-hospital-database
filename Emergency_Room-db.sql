CREATE TABLE PERSON (
    person_id INT PRIMARY KEY,
    last_name VARCHAR(255),
    first_name VARCHAR(255),
    middle_name VARCHAR(255)
);

CREATE TABLE ADDRESS (
    address_id INT PRIMARY KEY,
    person_id INT,
    country VARCHAR(255),
    province VARCHAR(255),
    city VARCHAR(255),
    street VARCHAR(255),
    street_number VARCHAR(255),
    FOREIGN KEY (person_id) REFERENCES PERSON(person_id)
);

CREATE TABLE CONTACT (
    contact_id INT PRIMARY KEY,
    person_id INT,
    email_address VARCHAR(255),
    telephone_number VARCHAR(255),
    FOREIGN KEY (person_id) REFERENCES PERSON(person_id)
);

CREATE TABLE WORKER (
    worker_id INT PRIMARY KEY,
    worker_type VARCHAR(255),
    person_id INT,
    FOREIGN KEY (person_id) REFERENCES PERSON(person_id)
);

CREATE TABLE RECEPTIONIST (
    receptionist_id INT PRIMARY KEY,
    worker_id INT,
    FOREIGN KEY (worker_id) REFERENCES WORKER(worker_id)
);

CREATE TABLE NURSE (
    nurse_id INT PRIMARY KEY,
    worker_id INT,
    FOREIGN KEY (worker_id) REFERENCES WORKER(worker_id)
);

CREATE TABLE DOCTOR (
    doctor_id INT PRIMARY KEY,
    worker_id INT,
    FOREIGN KEY (worker_id) REFERENCES WORKER(worker_id)
);

CREATE TABLE SHIFT (
    shift_id INT PRIMARY KEY,
    start_time DATETIME,
    end_time DATETIME
);

CREATE TABLE Shift_Assignment (
    assignment_id INT PRIMARY KEY,
    shift_id INT,
    worker_id INT,
    triage_doctor BOOLEAN,
    FOREIGN KEY (shift_id) REFERENCES SHIFT(shift_id),
    FOREIGN KEY (worker_id) REFERENCES WORKER(worker_id)
);

CREATE TABLE PATIENT (
    patient_id INT PRIMARY KEY,
    person_id INT,
    FOREIGN KEY (person_id) REFERENCES PERSON(person_id)
);

CREATE TABLE ADMISSION (
    admission_id INT PRIMARY KEY,
    patient_id INT,
    receptionist_id INT,
    shift_id INT,
    FOREIGN KEY (patient_id) REFERENCES PATIENT(patient_id),
    FOREIGN KEY (receptionist_id) REFERENCES RECEPTIONIST(receptionist_id),
    FOREIGN KEY (shift_id) REFERENCES SHIFT(shift_id)
);

CREATE TABLE BED (
    bed_id INT PRIMARY KEY,
    nurse_id INT,
    FOREIGN KEY (nurse_id) REFERENCES NURSE(nurse_id)
);

CREATE TABLE MEDICATION (
    medication_id INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE PRESCRIPTION (
    prescription_id INT PRIMARY KEY,
    patient_id INT,
    medication_id INT,
    dosage VARCHAR(255),
    frequency_per_day INT,
    FOREIGN KEY (patient_id) REFERENCES PATIENT(patient_id),
    FOREIGN KEY (medication_id) REFERENCES MEDICATION(medication_id)
);

CREATE TABLE Medication_Administration (
    administration_id INT PRIMARY KEY,
    prescription_id INT,
    nurse_id INT,
    FOREIGN KEY (prescription_id) REFERENCES Prescription(prescription_id),
    FOREIGN KEY (nurse_id) REFERENCES NURSE(nurse_id)
);

INSERT INTO Person (person_id, last_name, first_name, middle_name)
VALUES
    (1, 'Omondi', 'John', 'Achieng'),
    (2, 'Wanjiku', 'Mary', 'Njeri'),
    (3, 'Mutua', 'Peter', 'Kamau'),
    (4, 'Kamau', 'Grace', 'Wambui'),
    (5, 'Mwangi', 'Daniel', 'Kariuki'),
    (6, 'Kariuki', 'Jane', 'Nyambura'),
    (7, 'Nyambura', 'Patrick', 'Njoroge'),
    (8, 'Njoroge', 'Mercy', 'Wanjiru'),
    (9, 'Wanjiru', 'Joseph', 'Kamau'),
    (10, 'Kamau', 'Anne', 'Wambui'),
    (11, 'Maina', 'Michael', 'Kirui'),
    (12, 'Korir', 'Susan', 'Chebet'),
    (13, 'Muthoni', 'David', 'Kimani'),
    (14, 'Wambui', 'Lucy', 'Muthoni'),
    (15, 'Kipchoge', 'Eliud', 'Komen');

SELECT * FROM PERSON;

INSERT INTO Address (address_id, person_id, country, province, city, street, street_number)
VALUES
    (1, 1, 'Kenya', 'Nairobi', 'Nairobi', 'Moi Avenue', '123'),
    (2, 2, 'Kenya', 'Nairobi', 'Nairobi', 'Kenyatta Avenue', '456'),
    (3, 3, 'Kenya', 'Kiambu', 'Thika', 'Juja Road', '789'),
    (4, 4, 'Kenya', 'Nairobi', 'Nairobi', 'Tom Mboya Street', '1011'),
    (5, 5, 'Kenya', 'Mombasa', 'Mombasa', 'Digo Road', '1213'),
    (6, 6, 'Kenya', 'Nairobi', 'Nairobi', 'Koinange Street', '1415'),
    (7, 7, 'Kenya', 'Nairobi', 'Nairobi', 'Kenyatta Avenue', '1617'),
    (8, 8, 'Kenya', 'Kisumu', 'Kisumu', 'Oginga Odinga Street', '1819'),
    (9, 9, 'Kenya', 'Nairobi', 'Nairobi', 'Kimathi Street', '2021'),
    (10, 10, 'Kenya', 'Nairobi', 'Nairobi', 'Moi Avenue', '2223'),
    (11, 11, 'Kenya', 'Nairobi', 'Nairobi', 'Mama Ngina Street', '2425'),
    (12, 12, 'Kenya', 'Nairobi', 'Nairobi', 'Koinange Street', '2627'),
    (13, 13, 'Kenya', 'Nairobi', 'Nairobi', 'Kenyatta Avenue', '2829'),
    (14, 14, 'Kenya', 'Nairobi', 'Nairobi', 'Tom Mboya Street', '3031'),
    (15, 15, 'Kenya', 'Nairobi', 'Nairobi', 'Moi Avenue', '3233');

SELECT * FROM ADDRESS;

INSERT INTO CONTACT (contact_id, person_id, email_address, telephone_number)
VALUES
    (1, 1, 'john.omondi@gmail.com', '+254701234567'),
    (2, 2, 'mary.wanjiku@yahoo.com', '+254712345678'),
    (3, 3, 'peter.mutua@outlook.com', '+254723456789'),
    (4, 4, 'grace.kamau@email.com', '+254734567890'),
    (5, 5, 'daniel.mwangi@example.com', '+254745678901'),
    (6, 6, 'jane.kariuki@example.com', '+254756789012'),
    (7, 7, 'patrick.nyambura@gmail.com', '+254767890123'),
    (8, 8, 'mercy.njoroge@gmail.com', '+254778901234'),
    (9, 9, 'joseph.wanjiru@yahoo.com', '+254789012345'),
    (10, 10, 'anne.kamau@outlook.com', '+254798123456'),
    (11, 11, 'michael.maina@yahoo.com', '+254707234567'),
    (12, 12, 'susan.korir@gmail.com', '+254727345678'),
    (13, 13, 'david.muthoni@gmail.com', '+254747456789'),
    (14, 14, 'lucy.wambui@outlook.com', '+254767567890'),
    (15, 15, 'eliud.kipchoge@gmail.com', '+254787678901');

SELECT * FROM CONTACT;

INSERT INTO WORKER (worker_id, worker_type, person_id)
VALUES
    (1, 'Receptionist', 1),
    (2, 'Nurse', 2),
    (3, 'Doctor', 3),
    (4, 'Nurse', 4),
    (5, 'Doctor', 5),
    (6, 'Receptionist', 6),
    (7, 'Nurse', 7),
    (8, 'Doctor', 8);

SELECT * FROM WORKER;

INSERT INTO RECEPTIONIST (receptionist_id, worker_id)
VALUES
    (1, 1),
    (2, 6);

SELECT * FROM RECEPTIONIST;

INSERT INTO NURSE (nurse_id, worker_id)
VALUES
    (1, 2),
    (2, 4),
    (3, 7);

SELECT * FROM NURSE;

INSERT INTO DOCTOR (doctor_id, worker_id)
VALUES
    (1, 3),
    (2, 5),
    (3, 8);

SELECT * FROM DOCTOR;
    
INSERT INTO PATIENT (patient_id, person_id)
VALUES
    (1, 9),
    (2, 10),
    (3, 11),
    (4, 12),
    (5, 13),
    (6, 14),
    (7, 15);

SELECT * FROM PATIENT;

INSERT INTO SHIFT (shift_id, start_time, end_time)
VALUES
    (1, '2024-03-07 08:00:00', '2024-03-07 16:00:00'),
    (2, '2024-03-07 16:00:00', '2024-03-08 00:00:00'),
    (3, '2024-03-08 08:00:00', '2024-03-08 16:00:00');

INSERT INTO Shift_Assignment (assignment_id, shift_id, worker_id, triage_doctor)
VALUES
    (1, 1, 1, 0),
    (2, 1, 2, 0),
    (3, 2, 3, 1),
    (4, 2, 4, 0),
    (5, 3, 5, 1),
    (6, 3, 6, 0),
    (7, 3, 7, 0),
    (8, 3, 8, 0);

SELECT * FROM SHIFT_ASSIGNMENT;

INSERT INTO ADMISSION (admission_id, patient_id, receptionist_id, shift_id)
VALUES
    (1, 1, 1, 1),
    (2, 4, 2, 2),
    (3, 6, 1, 3),
    (4, 7, 2, 3);

INSERT INTO BED (bed_id, nurse_id)
VALUES
    (1, 1),
    (2, 1),
    (3, 2),
    (4, 2);

INSERT INTO MEDICATION (medication_id, name)
VALUES
    (1, 'Paracetamol'),
    (2, 'Ibuprofen'),
    (3, 'Amoxicillin'),
    (4, 'Omeprazole');

INSERT INTO Medication_Administration (administration_id, prescription_id, nurse_id)
VALUES
    (1, 1, 1),
    (2, 2, 2),
    (3, 3, 3),
    (4, 4, 1),
    (5, 5, 2),
    (6, 6, 3),
    (7, 7, 1);

SELECT * FROM Medication_Administration;

INSERT INTO PRESCRIPTION (prescription_id, patient_id, medication_id, dosage, frequency_per_day)
VALUES
    (1, 1, 3, '500mg', 3),
    (2, 2, 2, '200mg', 2),
    (3, 3, 3, '500mg', 3),
    (4, 4, 4, '20mg', 1),
    (5, 5, 4, '500mg', 2),
    (6, 6, 1, '200mg', 1),
    (7, 7, 2, '500mg', 2),
    (8, 7, 4, '20mg', 1);

SELECT * FROM PRESCRIPTION;

