SELECT
	co_cor_raca_aluno,
	co_curso,
	in_sexo_aluno,
	no_curso,
	COUNT(*) AS contador

FROM
	table1

WHERE
	co_cor_raca_aluno IN (1, 2, 3)
	AND
	co_modalidade_ensino = 1
	AND
	co_nivel_academico = 1

GROUP BY
	co_curso,
	no_curso,
	co_cor_raca_aluno,
	in_sexo_aluno
