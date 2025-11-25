-- Hospital Queries

-- Query 1: Total visits per doctor– Find how many visits each doctor handled.
SELECT v.doctor_id, COUNT(v.doctor_id) AS total_visits_per_doctor
FROM  Visits v
GROUP BY v.doctor_id;

-- Query 2: Top 5 patients by total bill amount– Identify which patients owe or paid the most.
SELECT *
FROM (
    SELECT p.patient_id, SUM(b.total_amount) AS total_bill_amount
    FROM Patients p, Bills b, Visits v
    WHERE p.patient_id = v.patient_id AND v.visit_id = b.visit_id
    GROUP BY p.patient_id
    ORDER BY total_bill_amount DESC
)
WHERE ROWNUM <=5;

-- Query 3: Most common diagnosis– Which diagnosis appears most frequently in the dataset?
SELECT d.name, COUNT(*) AS frequency
FROM Diagnoses d
GROUP BY d.name
HAVING COUNT(*) >= ALL (
    SELECT COUNT(*)
    FROM Diagnoses d1
    GROUP BY d1.name
);

-- Query 4: Visits per city– Find the number of visits grouped by patients’ city.
SELECT p.city, COUNT(*) AS frequency
FROM Patients p, Visits v
WHERE v.patient_id = p.patient_id
GROUP BY p.city;

-- Query 5: Average bill per doctor– Compute the average amount due per doctor across visits
SELECT v.doctor_id, AVG(b.total_amount)
FROM Visits v, Bills b
WHERE v.visit_id = b.visit_id
GROUP BY v.doctor_id
ORDER BY AVG(b.total_amount) DESC;

-- Query 6: Patients who had unpaid bills– List patients whose bills remain unpaid.
SELECT v.patient_id
FROM Visits v, Bills b
WHERE b.payment_status = 'Unpaid' AND v.visit_id = b.visit_id;

-- Query 7: Doctors with patients diagnosed with Diabetes– Find doctors who treated at least one diabetic patient.
SELECT v.doctor_id
FROM Visits v, Diagnoses d
WHERE v.visit_id = d.visit_id AND d.name = 'Diabetes';

-- Query 8: Average total bill amount by payment status– Compare average bill amounts among payment statuses (Paid, Unpaid, Pending)
SELECT b.payment_status, AVG(b.total_amount) AS avg_bill
FROM Bills b
GROUP BY b.payment_status;

-- Query 9: List visits and their diagnoses– Display each visit with patient name, doctor, and diagnosis name.
COLUMN visit_id FORMAT A6
COLUMN patient_first_name FORMAT A12
COLUMN patient_last_name FORMAT A12
COLUMN doctor_first_name FORMAT A12
COLUMN doctor_last_name FORMAT A12
COLUMN diagnosis_name FORMAT A20

SELECT 
    v.visit_id,
    p.first_name AS patient_first_name,
    p.last_name  AS patient_last_name,
    d.first_name AS doctor_first_name,
    d.last_name  AS doctor_last_name,
    diag.name    AS diagnosis_name
FROM Visits v, Patients p, Doctors d, Diagnoses diag
WHERE p.patient_id = v.patient_id 
  AND d.doctor_id = v.doctor_id
  AND v.visit_id = diag.visit_id;

-- Query 10: Top doctors by total billed revenue– Rank doctors by total revenue generated.
SELECT v.doctor_id, SUM(b.total_amount) AS total_revenue
FROM Visits v, Bills b
WHERE v.visit_id = b.visit_id
GROUP BY v.doctor_id
ORDER BY SUM(b.total_amount) DESC;
