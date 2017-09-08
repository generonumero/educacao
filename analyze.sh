#!/bin/bash

FIELDS_ALL="co_curso,no_curso,co_modalidade_ensino,co_nivel_academico,co_cor_raca_aluno,in_sexo_aluno"

for YEAR in 2013 2014 2015; do  # the only ones with OCDE
	echo $YEAR

	INPUT="data/$YEAR/DM_ALUNO.CSV"
	OUTPUT_DB="output/database/$YEAR-aluno.sqlite"
	OUTPUT_TEMP="output/aggregated/aluno-$YEAR-1.sqlite"
	OUTPUT_AGGREGATED_0="output/aggregated/aluno-$YEAR-2-0.sqlite"
	OUTPUT_AGGREGATED_1="output/aggregated/aluno-$YEAR-2-1.sqlite"
	OUTPUT_AGGREGATED_2="output/aggregated/aluno-$YEAR-2-2.sqlite"
	OUTPUT_AGGREGATED_3="output/aggregated/aluno-$YEAR-2-3.sqlite"
	OUTPUT_AGGREGATED_4="output/aggregated/aluno-$YEAR-2-4.sqlite"
	OUTPUT_AGGREGATED_5="output/aggregated/aluno-$YEAR-2-5.sqlite"
	OUTPUT_AGGREGATED_6="output/aggregated/aluno-$YEAR-2-6.sqlite"
	OUTPUT_FINAL="output/aggregated/aluno-$YEAR.csv"

	mkdir -p $(dirname $OUTPUT_DB)
	mkdir -p $(dirname $OUTPUT_FINAL)

	echo "    Preparing data to be analyzed..."
	time rows convert --import-fields="$FIELDS_ALL" "$INPUT" "$OUTPUT_DB"

	echo "    Counting occurrences for each sex/ethnicity..."
	time rows query "$(cat queries/01.sql)" "$OUTPUT_DB" --output="$OUTPUT_TEMP"

	echo "    Putting all counters together (8 steps)..."
	time rows query "$(cat queries/02-0.sql)" "$OUTPUT_TEMP" --output="$OUTPUT_AGGREGATED_0"
	time rows query "$(cat queries/02-1.sql)" "$OUTPUT_AGGREGATED_0" "$OUTPUT_TEMP" --output="$OUTPUT_AGGREGATED_1"
	time rows query "$(cat queries/02-2.sql)" "$OUTPUT_AGGREGATED_0" "$OUTPUT_TEMP" --output="$OUTPUT_AGGREGATED_2"
	time rows query "$(cat queries/02-3.sql)" "$OUTPUT_AGGREGATED_0" "$OUTPUT_TEMP" --output="$OUTPUT_AGGREGATED_3"
	time rows query "$(cat queries/02-4.sql)" "$OUTPUT_AGGREGATED_0" "$OUTPUT_TEMP" --output="$OUTPUT_AGGREGATED_4"
	time rows query "$(cat queries/02-5.sql)" "$OUTPUT_AGGREGATED_0" "$OUTPUT_TEMP" --output="$OUTPUT_AGGREGATED_5"
	time rows query "$(cat queries/02-6.sql)" "$OUTPUT_AGGREGATED_0" "$OUTPUT_TEMP" --output="$OUTPUT_AGGREGATED_6"
	time rows query "$(cat queries/03.sql)" "$OUTPUT_AGGREGATED_0" "$OUTPUT_AGGREGATED_1" "$OUTPUT_AGGREGATED_2" "$OUTPUT_AGGREGATED_3" "$OUTPUT_AGGREGATED_4" "$OUTPUT_AGGREGATED_5" "$OUTPUT_AGGREGATED_6" --output="$OUTPUT_FINAL"
done
