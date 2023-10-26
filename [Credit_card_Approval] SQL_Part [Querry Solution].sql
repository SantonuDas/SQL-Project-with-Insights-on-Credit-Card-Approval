
############################# CREDIT APPROVAL PROJEJCT ##############################

create database credit_approval_db   
      #### Created "credit_approval_db" database and imported the "master_dataframe.csv" file to MySQL 
      ####  Workbench as "master_dataframe" table under "credit_approval_db" database.

use credit_approval_db
      #### Using the "credit_approval_db" database.

select* from master_dataframe
      #### Checking the imported csv file in MySQL workbench


                      ###### Now Here I Have to Perform Some Tasks ######

##||Task-1|| Group the customers based on their income type and find the average of their annual income.

select Type_income,ceil(avg(Annual_income)) as Avg_annual_income from master_dataframe
group by Type_income

##||Task-2|| Find the female owners of cars and property.

select Ind_ID,Gender,Car_owner,Property_owner from master_dataframe
where Gender="F" and Car_owner="Y" and Property_owner="Y"

##||Task-3|| Find the male customers who are staying with their families.

select Ind_ID,Gender,Family_members from master_dataframe
where Gender="M" and Family_members > 1

##||Task-4|| Please list the top five people having the highest income.

select Ind_ID,Gender,Annual_income from master_dataframe 
order by Annual_income desc
limit 5

##||Task-5|| How many married people are having bad credit?

select count(Ind_ID) as count_of_applicants,Marital_status,label as credit_status from master_dataframe
where Marital_status="Married" and label=1
#### HERE "label" is 1 MEANS "Bad Credit" and "label" is 0 MEANS "Good Credit" ####

##||Task-6|| What is the highest education level and what is the total count?

select distinct(Education) from master_dataframe
#### With This Code it is Found that "Academic degree" is the highest education level here ####

select count(Ind_ID) as total_count,Education from master_dataframe
where Education="Academic degree"

##||Task-7|| Between married males and females, who is having more bad credit? 

select count(Ind_ID) as Total_count,Gender,Marital_status,label as Credit_status from master_dataframe 
where Marital_status="Married" and label=1
group by Gender
    ##### Here With This Code It is Found that Married Females are More in Numbers then Married Males
      ### in terms of Bad Credit.
	#### HERE "label" is 1 MEANS "Bad Credit" and "label" is 0 MEANS "Good Credit" ####




