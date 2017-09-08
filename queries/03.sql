SELECT
		t0.co_curso AS curso_codigo,
		t0.no_curso AS curso_nome,
		IFNULL(t1.masc_branca, 0) AS masc_branca,
		IFNULL(t2.masc_preta, 0) AS masc_preta,
		IFNULL(t3.masc_parda, 0) AS masc_parda,
		IFNULL(t4.fem_branca, 0) AS fem_branca,
		IFNULL(t5.fem_preta, 0) AS fem_preta,
		IFNULL(t6.fem_parda, 0) AS fem_parda
	FROM

		table1 as t0,
		table2 as t1,
		table3 as t2,
		table4 as t3,
		table5 as t4,
		table6 as t5,
		table7 as t6

	WHERE
		t0.co_curso = t1.co_curso AND
		t1.co_curso = t2.co_curso AND
		t2.co_curso = t3.co_curso AND
		t3.co_curso = t4.co_curso AND
		t4.co_curso = t5.co_curso AND
		t5.co_curso = t6.co_curso
		AND
		t0.no_curso = t1.no_curso AND
		t1.no_curso = t2.no_curso AND
		t2.no_curso = t3.no_curso AND
		t3.no_curso = t4.no_curso AND
		t4.no_curso = t5.no_curso AND
		t5.no_curso = t6.no_curso

	ORDER BY
		t0.no_curso,
		t0.co_curso
