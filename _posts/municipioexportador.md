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


$$$$
y_{i} = \beta_{0} + \beta_{1} x_{i}
$$$$


\begin{equation}
y_{i} = \beta_{0} + \beta_{1} x_{i}
\end{equation}

\begin{foo}
y_{i} = \beta_{0} + \beta_{1} x_{i}
\end{foo}


\begin{equation}
\sum_{\forall i}{x_i^{2}}
\end{equation}
or inline equations

$ \sum_{\forall i}{x_i^{2}} $


Vamos utilizar os dados de PIB municipal do IBGE. Nossa variável dependente será o fato de um município ser ou não ser exportador.

Você pode baixar diretamente da internet os dados de importação e PIB municipal em formato ZIP. Porém, é mais divertido fazer isto com as funções download.file e unzip no R! :satisfied:


``
install.packages("utils") 
library(utils)
download.file( "http://www.mdic.gov.br/balanca/bd/MUN_SH4_2011_A_2013.zip" ,
               destfile="C:/Econometria/MUN_SH4_2011_A_2013.zip" )
 
unzip(zipfile="C:/Econometria/MUN_SH4_2011_A_2013.zip", exdir="C:/Econometria/Dados" )
``


No comando download.file a opção url indica o site onde encontra-se o arquivo compactado e a opção destfile é o local na sua máquina onde você deseja salvar seu arquivo ZIP.

Você deverá modificar o caminho "C:/Econometria" para a pasta correspondente na sua máquina. Não esqueça de colocar as barras invertidas. A opção exdir do comando unzip irá criar uma nova pasta no seu computador (*_C:/Econometria/Dados_*) onde armazenará os arquivos formato CSV que foram extraídos.

Agora vamos carregar um data.frame com o arquivo CSV contendo os dados de exportação já descompactados:

``
EXP<-read.csv("C:/Econometria/Dados/EXP_2013_MUN.csv")
``

Vamos dar uma olhada no data frame EXP.



Os dados de exportação contém as informações: Ano (CO_ANO), Mês de exportação (CO_MES), Código do produto exportado (CO_NCM_POS), país de destino das exportações (CO_PAIS), unidade da federação (CO_UF), porto (CO_PORTO), código do município (CO_MUN_GEO), peso dos produtos exportados (KG_LIQUIDO) e valor de exportação (VL_FOB).

Vamos agregar esta base de dados e utilizar somente o total anual exportado em 2013 por município. A agregação da base de dados por ano é feita com a função summaryBy pertencente ao pacote doBy.

install.packages("doBy") 
library(doBy)
Exp2013 <-summaryBy(VL_FOB ~ CO_MUN_GEO , data=EXP , FUN=c(sum))
Onde VL_FOG é variável quantitativa que desejamos somar e CO_MUN_GEO é uma variável categórica contendo o código do município. A opção FUN=c(sum) indica uma operação de soma, que será repetida para cada município. Os resultados serão armazenados no data.frame “Exp2013”.

Em seguida vamos renomear as variáveis do código do município e o valor total exportado. Os nomes COD_MUN e EXP são mais intuitivos.
