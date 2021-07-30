### web scraping pelisgratishd######
### instalamos la libreria ####
install.packages("rvest")

####invocar librerias####
library(rvest)
library(robotstxt)
library(selectr)
library(xml2)
library(dplyr)
library(stringr)
library(forcats)
library(magrittr)
library(tidyr)
library(ggplot2)
library(lubridate)
library(tibble)
library(lenght)

##### caso estudio pelisgratihd###
url<-"https://pelisgratishd.com/"
#### preguntamos si esta permitido bajar la pagina###

pagina<-read_html(url)


###asignar clase###
css_producto<-"#contenedor > div.module"

#### obtener codigo html####
producto_html<-html_nodes(pagina,css_producto)
prodcto_texto<-html_text(producto_html)

### exhibir los datos##
producto_texto

#####clases##

#### generos###

css_generos<-"archive tax-genres term-series-destacadas term-25483"
htmlgeneros<-html_nodes(pagina,css_generos)
textgeneros<-html_text(pagina,css_generos)

#### episodios###

css_episodios<-"archive post-type-archive post-type-archive-episodes"
htmlepisodios<-html_nodes(pagina,css_episodios)
textoepisodios<-html_text(pagina,css_episodios)

##### estrenos####

css_strenos<-"archive tax-dtyear term-32140"
htmlstrenos<-html_nodes(pagina,css_strenos)
textosstrenos<-html_text(pagina,css_strenos)

####series destacadas####

css_seriesdest<-"archive tax-genres term-series-destacadas term-25483"
htmlseriesdest<-html_nodes(pagina,css_seriesdestacadas)
textoseriesdest<-html_text(pagina,css_seriesdestacadas)

##### peliculas animadas####

css_peliculasanimadas<-"archive tax-genres term-animacion term-37"
htmlpeliculasanimadas<-html_nodes(pagina,css_peliculasanimadas)
textopeliculasanimadas<-html_text(pagina,css_peliculasanimadas)

###### sugerencias de peliculas###

css_sugerencias<-"widget-title"
htmlsugerencias<-html_nodes(pagina,css_sugerencias)
textosugerencias<-html_text(pagina,css_sugerencias)

### años lanzamiento##

css_añoslanz<-"releases scrolling mCustomScrollbar _mCS_3 mCS-autoHide"
htmlañoslanz<-html_nodes(pagina,css_añoslanz)
textoaños<-html_text(pagina,css_añoslanz)
#### creamos un data frame ####
datanew<-data.frame(css_añoslanz,css_seriesdest,css_peliculasanimadas,css_generos,css_strenos)