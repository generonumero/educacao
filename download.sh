#!/bin/bash

mkdir -p data/
cd data/
for YEAR in 2013 2014 2015; do  # the only ones with OCDE
	echo $YEAR

	filename=microdados_censo_superior_$YEAR.zip

	wget -c -t 3 -O $filename http://download.inep.gov.br/microdados/$filename
	unar $filename

	mkdir -p $YEAR
	aluno=$(find . | grep --color=no $YEAR | grep --color=no DM_ALUNO)
	mv $aluno ./$YEAR/
	filename=./$YEAR/$(basename $aluno)
	if [ "$(echo $aluno | sed 's/.*\.//')" = "rar" ]; then
		cd $YEAR
		unar $(basename $filename)
		cd ..
		rm $filename
	fi
done
cd ..
