SELECT
	curso.co_curso,
	curso.no_curso,
	quant.contador AS fem_preta

FROM
	table1 AS curso

LEFT OUTER JOIN
	(
		SELECT
			co_curso,
			contador,
			no_curso
		FROM
			table2
		WHERE
			in_sexo_aluno = 1
			AND
			co_cor_raca_aluno = 2
	) AS quant
	ON
		curso.co_curso = quant.co_curso
		AND
		curso.no_curso = quant.no_curso
