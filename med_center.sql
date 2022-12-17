CREATE TABLE "doctors"(
    "id" BIGINT NOT NULL,
    "specialty" TEXT NOT NULL,
    "licensed" BOOLEAN NULL,
    "years_in_practice" BIGINT NULL,
    "years_with_med_center" BIGINT NULL,
    "first_name" BIGINT NOT NULL,
    "last_name" BIGINT NOT NULL
);
ALTER TABLE
    "doctors" ADD PRIMARY KEY("id");
CREATE TABLE "patients"(
    "id" BIGINT NOT NULL,
    "first_name" TEXT NOT NULL,
    "last_name" BIGINT NOT NULL,
    "age" BIGINT NOT NULL
);
ALTER TABLE
    "patients" ADD PRIMARY KEY("id");
CREATE TABLE "diagnosis"(
    "id" BIGINT NOT NULL,
    "disease" BIGINT NOT NULL
);
ALTER TABLE
    "diagnosis" ADD PRIMARY KEY("id");
CREATE TABLE "doctors_patients"(
    "id" BIGINT NOT NULL,
    "doctor_id" BIGINT NOT NULL,
    "patient_id" BIGINT NOT NULL
);
ALTER TABLE
    "doctors_patients" ADD PRIMARY KEY("id");
ALTER TABLE
    "doctors_patients" ADD CONSTRAINT "doctors_patients_doctor_id_unique" UNIQUE("doctor_id");
ALTER TABLE
    "doctors_patients" ADD CONSTRAINT "doctors_patients_patient_id_unique" UNIQUE("patient_id");
CREATE TABLE "patient_diagnosis"(
    "id" BIGINT NOT NULL,
    "patient_id" BIGINT NOT NULL,
    "diagnosis_id" BIGINT NOT NULL
);
ALTER TABLE
    "patient_diagnosis" ADD PRIMARY KEY("id");
ALTER TABLE
    "patient_diagnosis" ADD CONSTRAINT "patient_diagnosis_patient_id_unique" UNIQUE("patient_id");
ALTER TABLE
    "patient_diagnosis" ADD CONSTRAINT "patient_diagnosis_diagnosis_id_unique" UNIQUE("diagnosis_id");
ALTER TABLE
    "doctors_patients" ADD CONSTRAINT "doctors_patients_doctor_id_foreign" FOREIGN KEY("doctor_id") REFERENCES "doctors"("id");
ALTER TABLE
    "doctors_patients" ADD CONSTRAINT "doctors_patients_patient_id_foreign" FOREIGN KEY("patient_id") REFERENCES "patients"("id");
ALTER TABLE
    "patient_diagnosis" ADD CONSTRAINT "patient_diagnosis_patient_id_foreign" FOREIGN KEY("patient_id") REFERENCES "patients"("id");
ALTER TABLE
    "patient_diagnosis" ADD CONSTRAINT "patient_diagnosis_diagnosis_id_foreign" FOREIGN KEY("diagnosis_id") REFERENCES "diagnosis"("id");