# Município Exportador com Probabilidade Linear e Modelo Logit

Neste *post* vamos aprender ajustar um modelo probabilístico para os municípios exportadores brasileiros. Vamos exemplificar utilizando o modelo de probabilidade linear e modelo logit.

Vamos utilizar algumas funcionalidades importantes do R.

1. Download de arquivos zipados disponíveis na internet.
2. Extração de arquivos ZIP.
3. Importação de arquivos CSV e EXCEL.
4. Junção (*merge*) de bases de dados no R.
5. Análise de um modelo de probabilidade linear e modelo logit.

## Introdução
O modelo de *probabilidade linear* nada mais é que o método dos mínimos quadrados ordinários quando a variável dependente é binária (y=0 ou y=1).


``math
y_{i} = \beta_{0} + \beta_{1} x_{i}
``


\begin{equation}
y_{i} = \beta_{0} + \beta_{1} x_{i}
\end{equation}

\begin{foo}
y_{i} = \beta_{0} + \beta_{1} x_{i}
\end{foo}



Vamos utilizar os dados de PIB municipal do IBGE. Nossa variável dependente será o fato de um município ser ou não ser exportador.

Você pode baixar diretamente da internet os dados de importação e PIB municipal em formato ZIP. Porém, é mais divertido fazer isto com as funções download.file e unzip no R!


````
install.packages("utils") 
library(utils)
download.file( "http://www.mdic.gov.br/balanca/bd/MUN_SH4_2011_A_2013.zip" ,
               destfile="C:/Econometria/MUN_SH4_2011_A_2013.zip" )
 
unzip(zipfile="C:/Econometria/MUN_SH4_2011_A_2013.zip", exdir="C:/Econometria/Dados" )
````
