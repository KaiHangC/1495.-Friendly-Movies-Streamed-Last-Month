# 1495. Friendly Movies Streamed Last Month
Here is my answer to Leetcode question 1495. Friendly Movies Streamed Last Month

# Intuition
Using JOIN to combine tables for more infomation and filter the out the unnecessary rows.

# Approach
First step is to use LEFT JOIN to combine TVProgram table and Content table on content_id.

```MySQL
SELECT *
FROM TVProgram t 
LEFT JOIN Content c ON c.content_id = t.content_id
```
Result

| program_date | content_id | channel    | content_id | title          | Kids_content | content_type |
| ------------ | ---------- | ---------- | ---------- | -------------- | ------------ | ------------ |
| 2020-06-10   | 1          | LC-Channel | "1"        | Leetcode Movie | N            | Movies       |
| 2020-05-11   | 2          | LC-Channel | "2"        | Alg. for Kids  | Y            | Series       |
| 2020-05-12   | 3          | LC-Channel | "3"        | Database Sols  | N            | Series       |
| 2020-05-13   | 4          | Disney Ch  | "4"        | Aladdin        | Y            | Movies       |
| 2020-06-18   | 4          | Disney Ch  | "4"        | Aladdin        | Y            | Movies       |
| 2020-07-15   | 5          | Disney Ch  | "5"        | Cinderella     | Y            | Movies       |


Then select all the row that meet the all conditions with WHERE and use DISTINCT() to only show same title once
```MySQL
WHERE t.program_date LIKE "2020-06-%" AND c.Kids_content = "Y" AND content_type = "Movies"
```
# Code
```mysql []
SELECT DISTINCT(c.title)
FROM TVProgram t 
LEFT JOIN Content c ON c.content_id = t.content_id
WHERE t.program_date LIKE "2020-06-%" AND c.Kids_content = "Y" AND content_type = "Movies"
```
