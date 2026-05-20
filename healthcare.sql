create database healthcare;
use healthcare ;

-- (1) What is the total revenue, total insurance covered, and total patient payable amount overall? 

SELECT 
    ROUND(SUM(total_amount), 0) AS total_revenue,
    ROUND(SUM(insurance_covered_amount), 0) AS 'insaurance covered amount',
    ROUND(SUM(patient_payable_amount), 0) AS 'patient payable amount'
FROM
    billing;


-- (2) How many admissions are Emergency vs Elective, and what is the percentage split?

select * , 
(count/(select count(admission_id) from admission))*100 as percentage from
(select admission_type ,count(admission_id) as count
from admission 
group by admission_type) as t ;

-- (3) Which disease category has the highest number of admissions? 

with t as 
(select  d.disease_category ,a.admission_id 
from disease as d 
join
admission as a 
on d.disease_id = a.disease_id)
select count(admission_id) as count , disease_category
from t
group by disease_category 
order by count desc
limit 1 
;


-- (4) What is the most commonly prescribed drug category across all admissions?

select 
d.drug_category,
count(p.prescription_id) as count 
from prescription as p 
join drug as d 
on p.drug_id = d.drug_id
group by d.drug_category 
order by count desc
limit 5
;



-- (5) What is the average length of stay per department — and which department has the longest stays? 

select d.department_name ,
round(avg(datediff(a.discharge_date, a.admission_date)),1) 
as length_of_stay
from department as d 
join admission as a 
on d.department_id = a.department_id
group by d.department_name
order by length_of_stay desc;


-- (6) Which disease has the highest average billing amount per admission?

select d.disease_name as disease , 
d.disease_category as category ,
round(avg(b.total_amount),2) as avg_billing_amount
from disease as d 
join admission as a 
on d.disease_id = a.disease_id
join billing as b 
on a.admission_id = b.admission_id
group by disease ,category
order by avg_billing_amount desc
limit 5;


-- (7) What percentage of bills are pending vs paid per payment mode? 

select distinct payment_mode ,
sum(case when payment_status = 'pending' then 1 else 0 end)  as pending_count,
round(sum(case when payment_status = 'pending' then 1 else 0 end)*100/count(bill_id),2)
as pending_percentage
from billing 
group by payment_mode 
order by payment_mode;




-- (8) Identify patients admitted more than twice — find frequent admission patients with their total billing amount 

with t as  (select patient_id ,
count(admission_id) as frequency 
from admission 
group by patient_id
having frequency >1)
select  t.patient_id ,
t.frequency,
sum(b.total_amount ) as billing_amount
from t 
join admission as a 
on t.patient_id = a.patient_id 
join billing as b 
on a.admission_id = b.admission_id
group by t.patient_id
order by frequency desc, billing_amount desc ;


-- (9) For each admission type, what is the most prescribed drug using window functions?

select admission_type, drug_category , prescription_count from 
(select a.admission_type , d.drug_category,
count(p.prescription_id) as prescription_count, 
row_number() over (partition by a.admission_type order by count(p.prescription_id) desc ) as rnk 
from 
admission as a 
join prescription as p 
on p.admission_id = a.admission_id
join drug as d 
on p.drug_id = d.drug_id
group by a.admission_type  , d.drug_category
order by a.admission_type ) as t
where rnk= 1  ;

-- (10) What is the abnormal diagnostic test rate per disease category — and which disease has highest abnormal rate?

select d.disease_category , 
sum(case when p.result_status = 'Abnormal' then 1 else 0 end ) as abnormal_count,
count(p.patient_diagnostic_id) as total_tests,
round(sum(case when p.result_status = 'Abnormal' then 1 else 0 end )*100/
count(p.patient_diagnostic_id),2) as percentage
from disease as d 
join admission as a
on d.disease_id = a.disease_id
join patient_diagnostic as p 
on p.admission_id = a.admission_id 
group by d.disease_category
order by percentage desc;







