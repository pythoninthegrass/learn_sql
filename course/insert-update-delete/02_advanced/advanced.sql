-- show all rows from table
SELECT * FROM student;

-- insert partial values
INSERT into student (id, last_name) VALUES
	(11, 'Barry');

-- insert null
-- * valid _result_
-- INSERT INTO exam
--     (id, student_id, subject, written_exam_date, written_exam_score, written_score_date)
-- VALUES (17, 12, 'Mathematics', '2018-10-14', 12, '2018-10-16');
-- * _correct_ answer
INSERT INTO exam
VALUES (17, 12, 'Mathematics', '2018-10-14', 12, '2018-10-16', null, null, null);

-- update with null set
UPDATE student
SET middle_name = NULL
WHERE id = 10;

-- get id, student_id, and subject of missing written exam scores
SELECT id, student_id, subject FROM exam
WHERE written_exam_score IS NULL;

-- is null in update
UPDATE exam
SET written_exam_score = 43
WHERE written_exam_score IS NULL;

-- is null in delete
DELETE FROM exam
WHERE oral_exam_score IS NULL;

-- update with conditions
UPDATE exam
SET
  oral_exam_score = 3
WHERE oral_score_date is NULL
  AND subject = 'English';

-- delete with conditions
DELETE FROM exam
WHERE subject = 'Spanish' OR subject = 'Mathematics'
  AND (written_exam_date IS NOT NULL
    OR oral_exam_date IS NOT NULL
  );

-- update using value from another column
UPDATE exam
SET oral_exam_date = written_exam_date + 4
WHERE oral_exam_date IS NULL

-- swap values with variables
UPDATE student
SET
  last_name = (@last := last_name),
  first_name = (@first := first_name),
  first_name = @last,
  last_name = @first
WHERE id = 6;
