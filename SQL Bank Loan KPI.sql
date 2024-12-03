SELECT * FROM finanace.`finanace csv new`;

use  finanace;


#KPI-1 Year Wise Loam Amount Stats
SELECT  year(issue_d) as Issue_year, concat(format(sum(loan_amnt)/1000000,2),"M") as "Total Loan Amount" FROM `finanace csv new`
group by year(issue_d)
order by year(issue_d);


#KPI-2 Grade and Sub_Grade Wise Revol Balance

select grade, sub_grade, 
concat(format(sum(revol_bal)/1000,2),"K")As "Total Revol Balance" from `finanace csv new`
group by grade,sub_grade
order by 1;

#KPI-3 Total Payment for Verified Status Vs Total Payment for Non Verified Status

select verification_status,
concat(format(sum(total_pymnt)/1000,2),"K") As "Payment" from `finanace csv new`
group by verification_status;

#KPI-4 State wise and last_credit_pull_d wise loan status

select addr_state as State, monthname(last_credit_pull_d) as "Last Credit Pull Month", loan_status As "Loan Status",
count(loan_status)As Count from `finanace csv new`
group by monthname(last_credit_pull_d), addr_state,loan_status
order by count(loan_status) desc;

#KPI-5 Home Owernship Vs Last Payment Date Stats

select year(last_pymnt_d), monthname(last_pymnt_d), home_ownership , count(home_ownership)
from `finanace csv new`
group by home_ownership,year(last_pymnt_d),monthname(last_pymnt_d)
order by year(last_pymnt_d),monthname(last_pymnt_d),count(home_ownership) desc;


