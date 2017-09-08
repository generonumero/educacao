# Microdados do Censo da Educação Superior (INEP)

## Requisitos

- [wget](https://www.gnu.org/software/wget/)
- [unar](https://theunarchiver.com/)
- Dependências Python: `pip install requirements.txt`


## Rodando

Baixe os microdados do INEP para os anos 2013, 2014 e 2015, executando:

    ./download.sh

Os dados ficarão na pasta `data`. Então basta rodar as análises:

    ./analyze.sh

Serão feiras análises nos arquivos `DM_ALUNO.CSV` para todos os anos baixados.

## Resultado

Os arquivos resultantes das análises ficarão em `output/aluno-ANO.csv`.
