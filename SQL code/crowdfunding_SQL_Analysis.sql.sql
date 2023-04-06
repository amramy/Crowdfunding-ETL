-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
SELECT * FROM campaign;

-- I wanted to see the different types of outcomes
SELECT outcome
FROM campaign
GROUP BY outcome;


SELECT cf_id,
	backers_count, 
	outcome
FROM campaign
WHERE outcome = 'live'
ORDER BY backers_count DESC;

-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
SELECT * FROM backers;

SELECT COUNT (cf_id) cf_id 
FROM backers
GROUP BY cf_id
ORDER BY cf_id DESC;

-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 

SELECT co.first_name, 
	co.last_name, 
	co.email,
	ca.goal - ca.pledged AS Remaining_Goal_Amount
INTO email_contacts_ramaining_goal_amount
FROM contacts AS co
INNER JOIN campaign AS ca
ON co.contact_id = ca.contact_id
WHERE outcome = 'live'
ORDER BY Remaining_Goal_Amount DESC;
	
-- Check the table
SELECT * FROM email_contacts_ramaining_goal_amount

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 

-- LAST NAME Ascending order as shown in image of Challenge
SELECT ba.email,
	ba.first_name,
	ba.last_name,
	ba.cf_id,
	ca.company_name,
	ca.description,
	ca.end_date,
	ca.goal - ca.pledged AS left_of_goal
INTO email_backers_ascending_remaining_goal_amount
FROM backers AS ba
INNER JOIN campaign AS ca
ON ba.cf_id = ca.cf_id
WHERE ca.outcome = 'live'
ORDER BY last_name, first_name;

-- Check the table
SELECT * FROM email_backers_ascending_remaining_goal_amount;

-- LAST NAME Descending order as per the instructions
SELECT ba.email,
	ba.first_name,
	ba.last_name,
	ba.cf_id,
	ca.company_name,
	ca.description,
	ca.end_date,
	ca.goal - ca.pledged AS left_of_goal
INTO email_backers_descending_remaining_goal_amount
FROM backers AS ba
INNER JOIN campaign AS ca
ON ba.cf_id = ca.cf_id
WHERE ca.outcome = 'live'
ORDER BY last_name DESC;

SELECT * FROM email_backers_descending_remaining_goal_amount;