-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
SELECT backers_count, cf_id, outcome
FROM campaign
WHERE outcome= ('live')
ORDER BY backers_count DESC;


-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
SELECT (cf_id), COUNT(*)
FROM backers
GROUP BY cf_id
Order BY count DESC; 


-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 

SELECT  b.first_name,
		b.last_name, 
		b.email,
		c.goal,
		c.goal - c.pledged AS goal_remaining
INTO live_goal
FROM backers AS b
INNER JOIN campaign AS c
ON (b.cf_id= c.cf_id)
WHERE c.outcome= ('live')
ORDER BY goal_remaining;


-- Check the table

SELECT * FROM live_goal

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 

SELECT  b.email,
		b.first_name,
		b.last_name,
		b.cf_id,
		c.company_name,
		c.description,
		c.end_date,
		c.goal - c.pledged AS left_of_goal
-- INTO email_backers_remaining_goal_amount
FROM backers AS b
INNER JOIN campaign AS c
ON (b.cf_id= c.cf_id)
WHERE c.outcome= ('live')
ORDER BY email DESC; 

-- Check the table

SELECT * FROM email_backers_remaining_goal_amount


SELECT  b.first_name,
		b.last_name, 
		b.email,
		b.cf_id,
		c.company_name,
		c.description,
		c.end_date,
		c.goal - c.pledged AS left_of_goal
-- INTO email_backers_remaining_goal_amount
FROM backers AS b
INNER JOIN campaign AS c
ON (b.cf_id= c.cf_id)
WHERE c.outcome= ('live')
ORDER BY left_of_goal DESC; 