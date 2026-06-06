/**
 * Schema for the hospital database.
 */


CREATE TABLE province_names (
    province_id    CHAR(2)  PRIMARY KEY,
    province_name  TEXT
);

CREATE TABLE doctors (
    doctor_id   INT   PRIMARY KEY,
    first_name  TEXT,
    last_name   TEXT,
    specialty   TEXT
);

CREATE TABLE patients (
    patient_id   INT     PRIMARY KEY,
    first_name   TEXT,
    last_name    TEXT,
    gender       CHAR(1),
    birth_date   DATE,
    city         TEXT,
    province_id  CHAR(2),
    allergies    TEXT,
    height       INT,
    weight       INT,

    FOREIGN KEY (province_id) REFERENCES province_names(province_id)
);

CREATE TABLE admissions (
    patient_id          INT,
    admission_date      DATE,
    discharge_date      DATE,
    diagnosis           TEXT,
    attending_doctor_id INT,

    PRIMARY KEY (patient_id, admission_date),
    FOREIGN KEY (patient_id)          REFERENCES patients(doctor_id),
    FOREIGN KEY (attending_doctor_id) REFERENCES doctors(doctor_id)
);