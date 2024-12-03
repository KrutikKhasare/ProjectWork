
use manufacturing;

select *  from `manufacturing csv new`;

select count(*) from `manufacturing csv new`;
desc `manufacturing csv new`;

alter table `manufacturing csv new` change `Manufactured Qty` manufactured_Qyt int;
alter table `manufacturing csv new` change `Processed Qty` processed_Qyt int;
alter table `manufacturing csv new` change `Produced Qty` produced_Qyt int;
alter table `manufacturing csv new` change `Rejected Qty` Rejected_Qyt int;
alter table `manufacturing csv new` change `Emp Name` Emp_Name text(20);
alter table `manufacturing csv new` change `Employee Name` Employee_Name text(20);
alter table `manufacturing csv new` change `Machine Name` Machine_Name text(20);
alter table `manufacturing csv new` change `Department Name` Department_Name text(20);
alter table `manufacturing csv new` change `Operation Name` Operation_Name text(20);
alter table `manufacturing csv new` change `Delivery Period` Delivery_Period text(30);
set sql_safe_updates=0;


# KPI 1 Total Manufactired_Qyt
select concat(format(sum(manufactured_Qyt)/1000,2),"K")  as Manufactured_Qyt from `manufacturing csv new`;

# KPI 2 Total Rejected_Qyt
select concat(format(sum(Rejected_Qyt)/1000,2),"K") as Rejected_Qyt from `manufacturing csv new`;

# KPI 3 Total Processed_Qyt
select concat(format(sum(processed_Qyt)/1000,2),"K") as Processed_Qyt from `manufacturing csv new`;

# KPI 4 Wastage %
select concat(format(sum(Rejected_Qyt)/sum(Processed_Qyt) * 100,2),'%') AS "Wastage %" from `manufacturing csv new`;

# KPI 5 Employees wise Rejected_Qyt Top 30
select Employee_Name, sum(Rejected_Qyt) as Rejected from `manufacturing csv new`
group by Employee_Name
order by Rejected desc
limit 30;

# KPI 6 Machine wise Rejected_Qyt Top 50
select Machine_Name, sum(Rejected_Qyt) As Rejected from `manufacturing csv new`
group by Machine_Name
order by Rejected desc
limit 50;

# KPI 7 Manufactured vs Rejected Qyt
select concat(format(sum(manufactured_Qyt)/1000,2),"K") as Manufactured,
concat(format(sum(Rejected_Qyt)/1000,2),"K")  as Rejected from `manufacturing csv new`;
 
# KPI 8 Dept Wise Manufactured vs Rejected Qyt
 select Department_Name,concat(format(sum(manufactured_Qyt)/1000,2),"K") as Manufactured,
 concat(format(sum(Rejected_Qyt)/1000,2),"K") as Rejected from `manufacturing csv new`
 group by Department_Name;
 
 # KPI 9 Totalvalue
 select concat(format(sum(totalvalue)/1000000,2),"M") as Total_Value from `manufacturing csv new`;
 
 # KPI 10 Depaartment wise Total Values
 select Department_Name, concat(format(sum(totalvalue)/1000000,2),"M") as Total_value
 from `manufacturing csv new`
 group by Department_Name
 order by Total_value;
 
 # KPI 11 Operation Wise Rejected Quantity
 select Operation_Name, sum(Rejected_Qyt) as Rejected_Qyt
 from `manufacturing csv new`
 group by Operation_Name
 order by Rejected_Qyt desc;
 

 
