-- average score for each subject along with the score for the corresponding subject by each student 
SELECT subject, 
	avg(score) OVER (PARTITION BY subject) AS avg_score, 
	student_id, 
	score 
FROM students s 
ORDER BY subject, student_id ;


-- average score of each student (total score of a student divided by the number of subjects they have taken)
-- that is why we are partitioning by 'student_id', it's like grouping by 'student_id' in the pratical sense
SELECT student_id, 
	subject, 
	score,
	avg(score) OVER (PARTITION BY student_id) avg_score
FROM students s ;
