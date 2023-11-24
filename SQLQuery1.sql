SELECT *
FROM [HR-Employee-Attrition];


---Count the total no. of employees ---
SELECT COUNT(EmployeeNumber)
FROM [HR-Employee-Attrition];

---Find the highest salary among the employees---
SELECT EmployeeNumber, MonthlyIncome AS Highest_Salary
FROM [HR-Employee-Attrition]
ORDER BY Highest_Salary DESC;

---List the unique departments---

SELECT DISTINCT Department, EmployeeNumber
FROM [HR-Employee-Attrition]
ORDER BY Department;
 
--- List the employees who work in Human Resource department, order by departments---
SELECT EmployeeNumber, Department
FROM [HR-Employee-Attrition]
WHERE Department = 'Human Resources'
ORDER BY Department;

---Identify the employees with the longest tenure in the company---
SELECT EmployeeNumber, TotalWorkingYears
FROM [HR-Employee-Attrition]
Where TotalWorkingYears >= 5
ORDER BY TotalWorkingYears;

---Calculate the percentage of employees who resigned compared to the total number of employees.---
SELECT
    (COUNT(CASE WHEN Attrition = 1 THEN 1 END) * 100.0) / COUNT(*) AS ResignationPercentage
FROM [HR-Employee-Attrition];

---Determine the average age of employees in each department---

SELECT DISTINCT Department, AVG(AGE) AS Average_age
FROM [HR-Employee-Attrition]
GROUP BY Department;

---List the employees who have resigned and had a performance rating of 4 or above.---

SELECT EmployeeNumber, PerformanceRating
FROM [HR-Employee-Attrition]
WHERE Attrition = 1 AND PerformanceRating >= 4
ORDER BY PerformanceRating DESC;

---Find the department with the highest average salary for employees who have resigned.---
SELECT Department, AVG(MonthlyIncome) AS AverageSalary
FROM [HR-Employee-Attrition]
WHERE Attrition = 1
GROUP BY Department
ORDER BY AverageSalary DESC;

---Find the distinct job roles present in the dataset.---

SELECT DISTINCT JobRole
FROM [HR-Employee-Attrition];

---Calculate the total number of employees in each department.---

SELECT Department, COUNT(EmployeeNumber) AS Total_Employees
FROM [HR-Employee-Attrition]
GROUP BY Department;

---Identify employees with a salary above the average salary in their respective departments.---

SELECT EmployeeNumber, Department, MonthlyIncome
FROM [HR-Employee-Attrition] AS E1
WHERE MonthlyIncome > (
         SELECT AVG(MonthlyIncome)
		 FROM [HR-Employee-Attrition] AS E2
		 WHERE E1.Department = E2.Department);

---Find the top 5 departments with the highest average years of experience.---

SELECT TOP 5 Department, AVG(YearsAtCompany) AS Average_Experience
FROM [HR-Employee-Attrition]
GROUP BY Department
ORDER BY Average_Experience DESC;

---Calculate the average salary for employees who have resigned, grouped by gender---

SELECT EmployeeNumber, Gender, AVG(MonthlyIncome) AS Average_Salary
FROM [HR-Employee-Attrition] 
WHERE Attrition = 1
GROUP BY EmployeeNumber,Gender;
 
---List employees who have a performance rating below 3 and are still with the company.---

SELECT EmployeeNumber, PerformanceRating
FROM [HR-Employee-Attrition]
WHERE PerformanceRating < 3 AND Attrition = 0;

---Find the employees who have the same manager and are in the same department.---

SELECT EmployeeNumber, Department, YearsWithCurrManager
FROM [HR-Employee-Attrition];

---Retrieve employee names along with their department names.---

SELECT TOP 10 EmployeeNumber, Department
FROM [HR-Employee-Attrition]
ORDER BY Department;

---List the employees who have resigned, including their job roles. ---

SELECT A.EmployeeNumber, A.JobRole
FROM [HR-Employee-Attrition] A
JOIN [HR-Employee-Attrition] B ON A.EmployeeNumber = A.EmployeeNumber
WHERE A.Attrition = 1;

---Find the average salary for each department, along with the department name. ---

SELECT Department, AVG(MonthlyIncome) AS Average_Salary_Of_Each_Department
FROM [HR-Employee-Attrition]
GROUP BY Department
ORDER BY Average_Salary_Of_Each_Department;

---Show the employees who have resigned, along with their performance rating. ---

SELECT EmployeeNumber, PerformanceRating
FROM [HR-Employee-Attrition]
WHERE Attrition = 1;