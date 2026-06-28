create database hospital;

use hospital;


CREATE TABLE hospital_data (
    Hospital_Name VARCHAR(255),
    Location VARCHAR(255),
    Department VARCHAR(255),
    Doctors_Count INT,
    Patients_Count INT,
    Admission_Date VARCHAR(20),
    Discharge_Date VARCHAR(20),
    Medical_Expenses DECIMAL(10,2)
);
SELECT * FROM hospital_data;

-- Total Number of Patients
select sum(Patients_Count) as Total_patients
from hospital_data;

-- Average Number of Doctors per Hospital 
select Hospital_Name, avg(Doctors_Count) as Average_Doctor
from hospital_data
group by Hospital_Name;

-- Top 3 Departments with the Highest Number of Patients
select Department , sum(Patients_Count) as Total_patients
from hospital_data
group by Department
order by Department desc 
limit 3;

-- Hospital with the Maximum Medical Expenses 
select Hospital_Name , max(Medical_Expenses) as Medical_Expenses
from hospital_data
group by Hospital_Name
order by Medical_Expenses 
limit 1;

-- Daily Average Medical Expenses
select Hospital_Name, avg(Medical_Expenses) as Avg_Daily_Expense
from hospital_data
group by Hospital_Name;

-- Longest Hospital Stay
SELECT Hospital_Name,
DATEDIFF(
    STR_TO_DATE(Discharge_Date, '%d-%m-%Y'),
    STR_TO_DATE(Admission_Date, '%d-%m-%Y')
) AS Total_Stay_Days
FROM hospital_data
ORDER BY Total_Stay_Days DESC
LIMIT 1;

-- Total Patients Treated Per City
select Location, sum(Patients_Count) as Total_patients
from hospital_data
group by Location;


-- Average Length of Stay Per Department 
SELECT Department,
AVG(
    DATEDIFF(
        STR_TO_DATE(Discharge_Date, '%d-%m-%Y'),
        STR_TO_DATE(Admission_Date, '%d-%m-%Y')
    )
) AS Avg_Stay
FROM hospital_data
GROUP BY Department;

--  Identify the Department with the Lowest Number of Patients
select Department , sum(Patients_Count) as Total_patients
from hospital_data
group by Department
order by Total_patients asc 
limit 1;

--  Monthly Medical Expenses Report 
SELECT MONTH(
    STR_TO_DATE(Admission_Date, '%d-%m-%Y')
) AS Month,
SUM(Medical_Expenses) AS Total_Expenses
FROM hospital_data
GROUP BY MONTH(
    STR_TO_DATE(Admission_Date, '%d-%m-%Y')
)
ORDER BY Month;




