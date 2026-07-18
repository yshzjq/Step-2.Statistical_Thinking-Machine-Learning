WITH tuition AS (
  SELECT
	year,
    school_id,
	AVG(tuition_grad_lecture_fee) AS avg_fee
  FROM school_tuitions
  GROUP BY year, school_id
  ),
  tuition_with_school AS (
    SELECT
      t.year,
	  t.school_id,
      s.name,
      t.avg_fee
    FROM tuition t
    LEFT JOIN schools s
      ON t.school_id = s.id 
    WHERE s.name IS NOT NULL -- 이름이 공란인 경우 제외
    AND t.avg_fee > 0 -- 수업료가 0원인 경우 제외
)
SELECT *
FROM tuition_with_school;