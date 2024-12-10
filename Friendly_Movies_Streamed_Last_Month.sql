SELECT DISTINCT(c.title)
FROM TVProgram t 
LEFT JOIN Content c ON c.content_id = t.content_id
WHERE t.program_date LIKE "2020-06-%" AND c.Kids_content = "Y" AND content_type = "Movies"