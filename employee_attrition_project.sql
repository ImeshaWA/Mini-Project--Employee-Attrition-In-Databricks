-- Databricks notebook source
select * from details

-- COMMAND ----------

-- DBTITLE 1,Total Employee Count
select sum(EmployeeCount) from details

-- COMMAND ----------

-- DBTITLE 1,Find Out Attrition Divition
select sum(EmployeeCount), Attrition from details
group by 2

-- COMMAND ----------

-- DBTITLE 1,Age Analysis -- let find out which particular age attrition is high (18-24, 25-31,32-38, 39-45, 46-52, 52+)
SELECT 
    SUM(EmployeeCount) AS TotalEmployees,
    CASE 
        WHEN age BETWEEN 18 AND 24 THEN '18-24'
        WHEN age BETWEEN 25 AND 31 THEN '25-31'
        WHEN age BETWEEN 32 AND 38 THEN '32-38'
        WHEN age BETWEEN 39 AND 45 THEN '39-45'
        WHEN age BETWEEN 46 AND 52 THEN '46-52'
        ELSE '52+' 
    END AS age_group
FROM details
WHERE Attrition = 'Yes'
GROUP BY age_group;


-- COMMAND ----------

-- DBTITLE 1,Find out attrition by Department
select sum(EmployeeCount), department from details
where Attrition ='Yes'
group by Department

-- COMMAND ----------

-- DBTITLE 1,Attrition by Education - (1- below college, 2- collage, 3- bachelor, 4- master, 5- doctor
select sum(EmployeeCount),
case when Education=1 then 'bellow college' 
when Education=2 then 'college'
when Education=3 then 'bachelor'
when Education=4 then 'master'
else 'doctor' end ed_group

from details
where Attrition ='Yes'
group by Education

-- COMMAND ----------

-- DBTITLE 1,Attrition by Environmental Satisfaction (1- low, 2- medium, 3- high, 4- highly satisfied.)
select sum(EmployeeCount),
case when EnvironmentSatisfaction =1 then 'low' 
when EnvironmentSatisfaction=2 then 'medium'
when EnvironmentSatisfaction=3 then 'high'
else 'highly satisfied' end Environment_Satisfaction

from details
where Attrition ='Yes'
group by 2

-- COMMAND ----------

-- DBTITLE 1,Attrition by Business Travel
select sum(EmployeeCount),
BusinessTravel
from details
where Attrition ='Yes'
group by BusinessTravel

-- COMMAND ----------

-- DBTITLE 1,Attrition by Monthly Income
select sum(EmployeeCount),
case when MonthlyIncome between 1000 and 3000 then '1000-3000'
when MonthlyIncome between 3001 and 5000 then '3001-5000'
when MonthlyIncome between 5001 and 7000 then '5001-7000'
else '7000+' end MonthlyIncome

from details
where Attrition ='Yes'
group by 2
