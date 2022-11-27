campaign
-
cf_id INT NOT NULL PK
contact_id INT NOT NULL FK - contacts.contact_id 
company_name VARCHAR(100) 
description TEXT
goal NUMERIC(10,2)
pledged NUMVERIC(10,2)
outcome VARCHAR(50)
backers_count INT
country VARCHAR(10)
currency VARCHAR(10)
launched_date DATE
end_date DATE
category_id VARCHAR(10) FK >- category.category_id
subcategory_id VARCHAR(10) FK >- subcategory.subcategory_id

CONTACTS
-
contact_id INT PK 
first_name VARCHAR(50)
last_name VARCHAR(50)
email VARCHAR(100)

SUBCATEGORY
-
subcategory_id VARCHAR(10) PK
subcategory VARCHAR

CATEGORY
-
category_id VARCHAR(10) PK
category VARCHAR(50)

BACKERS
-
backer_id VARCHAR(5) PK
cf_id INT FK >- campaign.cf_id
first_name VARCHAR 
last_name VARCHAR
email VARCHAR