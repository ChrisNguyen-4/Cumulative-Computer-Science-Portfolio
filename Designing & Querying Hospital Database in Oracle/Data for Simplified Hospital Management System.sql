-- Create tables
CREATE TABLE Patients (
    patient_id VARCHAR2(10) PRIMARY KEY,
    first_name VARCHAR2(50),
    last_name VARCHAR2(50),
    gender CHAR(1),
    birth_date DATE,
    city VARCHAR2(50)
);
CREATE TABLE Doctors (
    doctor_id VARCHAR2(10) PRIMARY KEY,
    first_name VARCHAR2(50),
    last_name VARCHAR2(50),
    specialty VARCHAR2(50)
);
CREATE TABLE Visits (
    visit_id VARCHAR2(10) PRIMARY KEY,
    patient_id VARCHAR2(10),
    doctor_id VARCHAR2(10),
    visit_date DATE,
    reason VARCHAR2(100),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);
CREATE TABLE Diagnoses (
    diagnosis_id VARCHAR2(10) PRIMARY KEY,
    visit_id VARCHAR2(10),
    name VARCHAR2(100),
    icd_code VARCHAR2(20),
    FOREIGN KEY (visit_id) REFERENCES Visits(visit_id)
);
CREATE TABLE Bills (
    bill_id VARCHAR2(10) PRIMARY KEY,
    visit_id VARCHAR2(10),
    total_amount NUMBER,
    insurance_covered NUMBER,
    payment_status VARCHAR2(20),
    amount_due NUMBER,
    FOREIGN KEY (visit_id) REFERENCES Visits(visit_id)
);

-- Insert data
INSERT INTO Patients VALUES ('P001', 'Michael', 'Wang', 'M', TO_DATE('1967-08-16','YYYY-MM-DD'), 'Houston');
INSERT INTO Patients VALUES ('P002', 'Ava', 'Brown', 'M', TO_DATE('2001-01-10','YYYY-MM-DD'), 'Boston');
INSERT INTO Patients VALUES ('P003', 'Sophia', 'Lopez', 'M', TO_DATE('1984-12-14','YYYY-MM-DD'), 'Chicago');
INSERT INTO Patients VALUES ('P004', 'Ava', 'Kim', 'M', TO_DATE('1996-06-29','YYYY-MM-DD'), 'Houston');
INSERT INTO Patients VALUES ('P005', 'Liam', 'Wang', 'M', TO_DATE('2009-06-15','YYYY-MM-DD'), 'Boston');
INSERT INTO Patients VALUES ('P006', 'Noah', 'Singh', 'M', TO_DATE('1967-06-19','YYYY-MM-DD'), 'Boston');
INSERT INTO Patients VALUES ('P007', 'Michael', 'Lopez', 'M', TO_DATE('1982-10-14','YYYY-MM-DD'), 'Boston');
INSERT INTO Patients VALUES ('P008', 'Michael', 'Kim', 'F', TO_DATE('1988-04-14','YYYY-MM-DD'), 'New York');
INSERT INTO Patients VALUES ('P009', 'Sophia', 'Lee', 'F', TO_DATE('1980-08-08','YYYY-MM-DD'), 'New York');
INSERT INTO Patients VALUES ('P010', 'Ava', 'Nguyen', 'F', TO_DATE('2006-01-05','YYYY-MM-DD'), 'Boston');
INSERT INTO Patients VALUES ('P011', 'Daniel', 'Brown', 'M', TO_DATE('1985-12-06','YYYY-MM-DD'), 'Houston');
INSERT INTO Patients VALUES ('P012', 'James', 'Green', 'M', TO_DATE('1962-09-01','YYYY-MM-DD'), 'Houston');
INSERT INTO Patients VALUES ('P013', 'Sarah', 'Wang', 'F', TO_DATE('1966-04-20','YYYY-MM-DD'), 'Houston');
INSERT INTO Patients VALUES ('P014', 'Noah', 'Brown', 'F', TO_DATE('2010-07-10','YYYY-MM-DD'), 'Houston');
INSERT INTO Patients VALUES ('P015', 'Sophia', 'Lopez', 'M', TO_DATE('1969-09-06','YYYY-MM-DD'), 'Boston');

INSERT INTO Doctors VALUES ('D001', 'John', 'Carter', 'Neurology');
INSERT INTO Doctors VALUES ('D002', 'Emily', 'Zhao', 'Pediatrics');
INSERT INTO Doctors VALUES ('D003', 'Robert', 'Singh', 'Pediatrics');
INSERT INTO Doctors VALUES ('D004', 'Sophia', 'Patel', 'Cardiology');
INSERT INTO Doctors VALUES ('D005', 'David', 'Kim', 'Pediatrics');
INSERT INTO Doctors VALUES ('D006', 'Grace', 'Nguyen', 'Pediatrics');
INSERT INTO Doctors VALUES ('D007', 'Michael', 'Lopez', 'Cardiology');

-- Visits
INSERT INTO Visits VALUES ('V001', 'P007', 'D006', TO_DATE('2025-09-08','YYYY-MM-DD'), 'Chest pain');
INSERT INTO Visits VALUES ('V002', 'P013', 'D007', TO_DATE('2025-08-13','YYYY-MM-DD'), 'Headache');
INSERT INTO Visits VALUES ('V003', 'P015', 'D002', TO_DATE('2024-04-12','YYYY-MM-DD'), 'Headache');
INSERT INTO Visits VALUES ('V004', 'P002', 'D004', TO_DATE('2024-02-13','YYYY-MM-DD'), 'Chest pain');
INSERT INTO Visits VALUES ('V005', 'P003', 'D006', TO_DATE('2024-05-29','YYYY-MM-DD'), 'Cough');
INSERT INTO Visits VALUES ('V006', 'P004', 'D004', TO_DATE('2024-08-06','YYYY-MM-DD'), 'Fever');
INSERT INTO Visits VALUES ('V007', 'P012', 'D001', TO_DATE('2025-03-28','YYYY-MM-DD'), 'Chest pain');
INSERT INTO Visits VALUES ('V008', 'P002', 'D004', TO_DATE('2024-09-21','YYYY-MM-DD'), 'Cough');
INSERT INTO Visits VALUES ('V009', 'P001', 'D004', TO_DATE('2024-01-10','YYYY-MM-DD'), 'Back pain');
INSERT INTO Visits VALUES ('V010', 'P001', 'D002', TO_DATE('2025-09-16','YYYY-MM-DD'), 'Chest pain');
INSERT INTO Visits VALUES ('V011', 'P008', 'D001', TO_DATE('2024-12-02','YYYY-MM-DD'), 'Fever');
INSERT INTO Visits VALUES ('V012', 'P013', 'D003', TO_DATE('2024-10-30','YYYY-MM-DD'), 'Back pain');
INSERT INTO Visits VALUES ('V013', 'P008', 'D007', TO_DATE('2025-01-30','YYYY-MM-DD'), 'Cough');
INSERT INTO Visits VALUES ('V014', 'P003', 'D007', TO_DATE('2024-03-16','YYYY-MM-DD'), 'Fever');
INSERT INTO Visits VALUES ('V015', 'P011', 'D005', TO_DATE('2024-03-17','YYYY-MM-DD'), 'Follow-up');
INSERT INTO Visits VALUES ('V016', 'P009', 'D003', TO_DATE('2024-04-02','YYYY-MM-DD'), 'Fever');
INSERT INTO Visits VALUES ('V017', 'P004', 'D001', TO_DATE('2024-08-01','YYYY-MM-DD'), 'Headache');
INSERT INTO Visits VALUES ('V018', 'P008', 'D002', TO_DATE('2025-08-19','YYYY-MM-DD'), 'Fever');
INSERT INTO Visits VALUES ('V019', 'P009', 'D002', TO_DATE('2024-09-05','YYYY-MM-DD'), 'Back pain');
INSERT INTO Visits VALUES ('V020', 'P004', 'D004', TO_DATE('2024-01-16','YYYY-MM-DD'), 'Chest pain');

-- Diagnoses
INSERT INTO Diagnoses VALUES ('DX001', 'V008', 'Diabetes', 'E11');
INSERT INTO Diagnoses VALUES ('DX002', 'V007', 'Diabetes', 'J45');
INSERT INTO Diagnoses VALUES ('DX003', 'V006', 'Flu', 'J10');
INSERT INTO Diagnoses VALUES ('DX004', 'V018', 'Migraine', 'G43');
INSERT INTO Diagnoses VALUES ('DX005', 'V007', 'Flu', 'J45');
INSERT INTO Diagnoses VALUES ('DX006', 'V013', 'Fracture', 'J10');
INSERT INTO Diagnoses VALUES ('DX007', 'V016', 'COVID-19', 'U07.1');
INSERT INTO Diagnoses VALUES ('DX008', 'V020', 'Migraine', 'J45');
INSERT INTO Diagnoses VALUES ('DX009', 'V003', 'Diabetes', 'J10');
INSERT INTO Diagnoses VALUES ('DX010', 'V014', 'Fracture', 'I10');
INSERT INTO Diagnoses VALUES ('DX011', 'V002', 'Fracture', 'I10');
INSERT INTO Diagnoses VALUES ('DX012', 'V004', 'Hypertension', 'U07.1');
INSERT INTO Diagnoses VALUES ('DX013', 'V004', 'Migraine', 'J45');
INSERT INTO Diagnoses VALUES ('DX014', 'V002', 'Diabetes', 'E11');
INSERT INTO Diagnoses VALUES ('DX015', 'V017', 'Anxiety', 'I10');
INSERT INTO Diagnoses VALUES ('DX016', 'V009', 'COVID-19', 'I10');
INSERT INTO Diagnoses VALUES ('DX017', 'V008', 'Fracture', 'G43');
INSERT INTO Diagnoses VALUES ('DX018', 'V013', 'Hypertension', 'U07.1');
INSERT INTO Diagnoses VALUES ('DX019', 'V009', 'Hypertension', 'G43');
INSERT INTO Diagnoses VALUES ('DX020', 'V014', 'Flu', 'E11');

-- Bills
INSERT INTO Bills VALUES ('B001', 'V011', 778, 92, 'Unpaid', 686);
INSERT INTO Bills VALUES ('B002', 'V005', 491, 315, 'Paid', 176);
INSERT INTO Bills VALUES ('B003', 'V003', 488, 313, 'Pending', 175);
INSERT INTO Bills VALUES ('B004', 'V003', 696, 65, 'Pending', 631);
INSERT INTO Bills VALUES ('B005', 'V015', 112, 208, 'Pending', -96);
INSERT INTO Bills VALUES ('B006', 'V018', 723, 357, 'Paid', 366);
INSERT INTO Bills VALUES ('B007', 'V012', 173, 94, 'Pending', 79);
INSERT INTO Bills VALUES ('B008', 'V002', 182, 296, 'Pending', -114);
INSERT INTO Bills VALUES ('B009', 'V005', 192, 61, 'Pending', 131);
INSERT INTO Bills VALUES ('B010', 'V011', 754, 167, 'Paid', 587);
INSERT INTO Bills VALUES ('B011', 'V012', 218, 107, 'Pending', 111);
INSERT INTO Bills VALUES ('B012', 'V003', 363, 304, 'Paid', 59);
INSERT INTO Bills VALUES ('B013', 'V016', 526, 364, 'Paid', 162);
INSERT INTO Bills VALUES ('B014', 'V003', 438, 387, 'Pending', 51);
INSERT INTO Bills VALUES ('B015', 'V014', 497, 298, 'Paid', 199);
INSERT INTO Bills VALUES ('B016', 'V001', 694, 180, 'Pending', 514);
INSERT INTO Bills VALUES ('B017', 'V016', 568, 55, 'Paid', 513);
INSERT INTO Bills VALUES ('B018', 'V019', 551, 238, 'Paid', 313);
INSERT INTO Bills VALUES ('B019', 'V001', 573, 204, 'Paid', 369);
INSERT INTO Bills VALUES ('B020', 'V020', 654, 123, 'Pending', 531);

