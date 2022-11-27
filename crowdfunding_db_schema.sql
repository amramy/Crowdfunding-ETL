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


CREATE TABLE "campaign" (
    "cf_id" int   NOT NULL,
    "contact_id" int   NOT NULL,
    "company_name" varchar(100)   NOT NULL,
    "description" text   NOT NULL,
    "goal" numeric(10,2)   NOT NULL,
    "pledged" numeric(10,2)   NOT NULL,
    "outcome" varchar(50)   NOT NULL,
    "backers_count" int   NOT NULL,
    "country" varchar(10)   NOT NULL,
    "currency" varchar(10)   NOT NULL,
    "launch_date" date   NOT NULL,
    "end_date" date   NOT NULL,
    "category_id" varchar(10)   NOT NULL,
    "subcategory_id" varchar(10)   NOT NULL,
    CONSTRAINT "pk_campaign" PRIMARY KEY (
        "cf_id"
     )
);

CREATE TABLE "category" (
    "category_id" varchar(10)   NOT NULL,
    "category_name" varchar(50)   NOT NULL,
    CONSTRAINT "pk_category" PRIMARY KEY (
        "category_id"
     )
);

CREATE TABLE "subcategory" (
    "subcategory_id" varchar(10)   NOT NULL,
    "subcategory_name" varchar(50)   NOT NULL,
    CONSTRAINT "pk_subcategory" PRIMARY KEY (
        "subcategory_id"
     )
);

CREATE TABLE "contacts" (
    "contact_id" int   NOT NULL,
    "first_name" varchar(50)   NOT NULL,
    "last_name" varchar(50)   NOT NULL,
    "email" varchar(100)   NOT NULL,
    CONSTRAINT "pk_contacts" PRIMARY KEY (
        "contact_id"
     )
);

DROP TABLE "backers";

CREATE TABLE "backers" (
	"backer_id" VARCHAR(5) NOT NULL,
	"cf_id" INT NOT NULL,
	"first_name" VARCHAR NOT NULL,
	"last_name" VARCHAR NOT NULL,
	"email" VARCHAR NOT NULL,
	CONSTRAINT "pk_backers" PRIMARY KEY ("backer_id")
);


ALTER TABLE "backers" ADD CONSTRAINT "fk_backers_cf_id" FOREIGN KEY ("cf_id")
REFERENCES "campaign" ("cf_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_contact_id" FOREIGN KEY("contact_id")
REFERENCES "contacts" ("contact_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_category_id" FOREIGN KEY("category_id")
REFERENCES "category" ("category_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_subcategory_id" FOREIGN KEY("subcategory_id")
REFERENCES "subcategory" ("subcategory_id");

SELECT * FROM contacts;

SELECT * FROM category;

SELECT * FROM campaign;

SELECT * FROM subcategory;

SELECT * FROM backers;