#**********************************************************
#http://www.scimagojr.com/journalrank.php?year=2016&out=xls
#install.packages("httr")
library('httr')
url <- 'http://www.scimagojr.com/countryrank.php?year=2016&out=xls'
POST(url,write_disk("C:/Users/Patrick/Documents/R/scimagojr2016.xls"))



#Fazendo o download do site através de loop!
for (ano in 2012:2016) {
    site  <- "http://www.scimagojr.com/countryrank.php?year="
    site2 <- paste(site , ano ,"&out=xls", sep="")
    #print(site2)
    way = "C:/Learning/Econometrick/scimagojr"
    way2 <- paste(way , ano ,".xlsx", sep="")
    Sys.sleep(1)
    POST(site2,write_disk(way2))
}


#Leitura dos dados
library(xlsx)

for (ano in 2012:2016) {
  way   <- "C:/Learning/Econometrick/scimagojr"
  way2  <- paste(way , ano ,".xlsx"     , sep="")
  assign( paste0("scimagojr",ano)       , read.xlsx2( way2 , sheetName = "Sheet1" ) ) 
}

scimagojr2012$ano<-2012
scimagojr2013$ano<-2013
scimagojr2014$ano<-2014
scimagojr2015$ano<-2015
scimagojr2016$ano<-2016

scimago <- rbind(scimagojr2012,scimagojr2013,scimagojr2014,scimagojr2015,scimagojr2016)







