WITH yearly_fee AS (
  SELECT
	  year,
    school_id,
    AVG(tuition_grad_lecture_fee) AS avg_fee
  FROM school_tuitions
  GROUP BY year, school_id
  ORDER BY school_id, year
)
SELECT *
FROM yearly_fee;
