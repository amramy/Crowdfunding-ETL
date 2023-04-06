# Crowdfunding-ETL


## Overview:
Birtta and I are working for Independent Funding in which we were given a dataset about backers who have pledged to campaign projects. Our mission is to perform an ETL process on this dataset using Python, Pandas, and Jupyter Notebooks along with an ERD with Quick-DBD and data analysis using SQL queries. We also take a deeper look into "live" campaigns so Independent Funding can alert the contacts and backers of the remaining goal amounts. 

## The process:

* Upload  backer_info.csv  into Jupyter notebook Extract_Transform_final_code.ipynb  
* Extract data  
	*  using Regular Expressions creating 4 columns (backer_id, cf_id, name, email)  
		* (option to use Python Dictionary Methods… good follow up project)  
* Transform and Clean Data   
	* Spliting "name" column into "first_name" and "last_name"   
	* Then drop "name" column  
	* Reorder columns  
	* Convert cf_id column from an object to an integer  
* Export Data: backers.csv with utf-8 encoding and no index    


* Create ERD and Table Schema and Load the Data  
	* Create ERD in QuickDBD   
	* Save diagram as crowdfundding_db_relationships.png  
	* Update schema in PostgreSQL file crowdfunding_db_schema.sql  
	* Create the backers table and upload backers.csv into schema  
	* Save: crowdfunding_db_schema.sql    
	
* SQL Analysis  
	* Query number of backer_counts in descending order for "cf_id" for all "live" campaigns  
	* Query to Create new table = email_contacts_remaining_goal_amount   
		* This contains "Live" campaigns with remaining goal amount with contact information  
	* Export table as: email_contacts_remaining_goal_amount.csv  
	* Query to Create new table = email_backers_remaining_goal_amount  
		* This contains email addresses of backers, contact information, end date of campaign and remaining amount to reach goal.   
 * Export table as: email_backers_remaining_goal_amount.csv  

## Extract & Transform

* We transformed the dataset by extracting the "backer_id" numbers, the "cf_id" numbers, the "name", and "email" address for all backers. 
* Creating a dataframe with this information
* Proceeded to clean the data by changing the "cf_id" column from an "object" data type to "integer"
* Split the "name" column into "first_name" and "last_name"
* Dropped the "name" column from the dataframe
* Re-ordered the dataframe columns
* Exported this dataframe as a csv file named "backers.csv"

## Load

* Adding onto an ERD we had created in the module to include "backers" table with primary and foreign keys.

<img width="971" alt="crowdfunding_db_relationships" src="https://user-images.githubusercontent.com/111904266/204160259-c37809e2-4d5e-4656-8047-15d182667319.png">

## Analysis

* Using SQL queries in pgAdmin using the "campaign" table we retrieved the number of "backer_counts" in descending order for "live" campaigns. 

<img width="312" alt="campaign_backer_count" src="https://user-images.githubusercontent.com/111904266/204160979-8008909c-c40f-45a7-9993-5277ee5c13da.png">

  * We confirmed this information by extracting the same data from the "backers" table using the "cf_id" count of backers.

<img width="123" alt="backer_count_from_backers" src="https://user-images.githubusercontent.com/111904266/204160973-dbfa4cd4-d70a-4602-85a0-1c18a0176087.png">

* We then created a table of contact information for all "live" campaigns so we can motivate them of their goals which included a "ramaining_goal_amount" in the table. 
* Backers also needed to be alerted of this valuable information, so we created another table with backer information that included "left_of_goal" amounts so they had a heads up how much funding was still needed. 

Ascending Order

<img width="870" alt="email_backers_ascending" src="https://user-images.githubusercontent.com/111904266/204160848-b6ed29d0-e276-4314-9739-433bacf99100.png">

Descending Order

<img width="863" alt="email_backers_descending" src="https://user-images.githubusercontent.com/111904266/204160867-238067cb-f40f-4bf0-aa64-3ec1c68430ee.png">

____
## Resources and tools used: 

**Data** 
* backer_info.csv

**Tools Used**
* Jupyter Notebook
* Pandas
* JSON
* Regular Expressions
* QuickDBD : https://www.quickdatabasediagrams.com/
* PostgreSQL



