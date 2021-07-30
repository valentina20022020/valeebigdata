
#instalando paquetes

install.packages("rvest")
install.packages("curl")
install.packages("xml2")

library("rvest")


################################################################################
#############################PÁGINA WEB EN ESTUDIO##############################
#############################REPELISHD.ME ######################################

########ASIGNANDO LA URL 

direccion<- "https://repelishd.me"

########Obtener el codigo html de la pagina web

RepelisHD<-read_html(direccion)

########revisando el contenido de REPELISHD.ME

print(html_text(RepelisHD))

##################### CATEGORIAS DE PELICULAS Y SERIES #####################

categorias_html<-html_nodes(RepelisHD,css="#nav_menu-15 .menu-item")
categorias_text<-html_text(categorias_html)
categorias_text

####################### CONTENIDO DESTACADO DE LA PAGINA ###################

destacado_html<-html_nodes(RepelisHD,css="#dtw_content_views-63 h3")
destacado_text<-html_text(destacado_html)
destacado_text

######################## RECOMENDACIONES ALEATORIAS##########################

recomendale_html<-html_nodes(RepelisHD,css="#dtw_content_views-64 h3")
recomendale_text<-html_text(recomendale_html)
recomendale_text


######################## ULTIMOS ESTRENOS EN LA PAGINA ######################


#####CODIGO HTML QUE CONTIENE LOS ULTIMOS ESTRENOS

pelicula_html <- html_nodes(RepelisHD,css = "#featured-titles .movies")
pelicula_text <- html_text(pelicula_html)

#####VECTOR ULTIMOS ESTRENOS

EstrenosHD <-pelicula_text
EstrenosHD


##################### PELICULAS RECOMENDADAS POR LA PAGINA ###################


recomendadas_html<-html_nodes(RepelisHD,css="#genre_actualizada h3")
recomendadas_text<-html_text(recomendadas_html)

####VECTOR PELICULAS RECOMENDADAS

Recomendadas <- recomendadas_text
Recomendadas

####RATING DE PELICULAS RECOMENDADAS

Rating_recomendadas<-html_nodes(RepelisHD,css="#genre_actualizada .rating")
Rating_recomend_text<-html_text(año_recomendadas)

####VECTOR DE RATINGS

Rating_peliculasrecomendadas<-Rating_recomend_text
Rating_peliculasrecomendadas

####GENERANDO UN DATA.FRAME CON LAS PELICULAS RECOMENDADAS Y SUS RATINGS

recomendadas_rating <- data.frame( 
  "Pelicula Recomendada" = Recomendadas, 
  "Rating" = Rating_peliculasrecomendadas
)
recomendadas_rating


########################## -ULTIMAS PELICULAS AGREGADAS- ####################


ultimas_html<-html_nodes(RepelisHD,css="#movload+ .items h3")
ultimas_text<-html_text(ultimas_html)

###VECTOR DE ULTIMAS PELICULAS AGREGADAS

ultimas_agregadas<- ultimas_text
ultimas_agregadas

###RATING DE ULTIMAS PELICULAS AGREGADAS
ratingultimas_html<-html_nodes(RepelisHD,css= "#movload+ .items .movies .rating")
ratingultimas_text<-html_text(ratingultimas_html)

###VECTOR RATING
rating_ultimasagregadas <- ratingultimas_text

###DATAFRAME ULTIMAS AGREGADAS Y SUS RATINGS
agregadas_df <- data.frame( 
  "Ultima Pelicula Agregada" = ultimas_agregadas, 
  "Rating" = rating_ultimasagregadas
)
agregadas_df

########################### -ULTIMAS SERIES AGREGADAS- #########################

Series_html<-html_nodes(RepelisHD,css="#slider-tvshows .item")
series_text<-html_text(Series_html)

###VECTOR SERIES
Ultimas_series <- series_text
Ultimas_series


##################### -ULTIMAS TEMPORADAS DE SERIES AGREGADAS- #################

temporadas_html<-html_nodes(RepelisHD,css=".seasons")
temporadas_text<-html_text(temporadas_html)

###VECTOR DE ULTIMAS TEMPORADAS AGREGADAS

ultimas_temporadas<-temporadas_text
ultimas_temporadas

######################## -TOP 5 DE PELICULAS MEJORES RANKEADAS- ################

top5_html<-html_nodes(RepelisHD,css= ".tleft .title")
top5_text<-html_text(top5_html)

###VECTOR TOP 5 PELICULAS MAS VALORADAS

top5_peliculas <- top5_text
top5_peliculas
for (Peliculasmostvalue in top5_peliculas) {
  print("============================")
  print(Peliculasmostvalue)
}

###RATING TOP 5 PELICULAS MAS VALORADAS
ratingtop5_html<-html_nodes(RepelisHD,css= ".tleft .rating")
ratingtop5_text<-html_text(ratingtop5_html)

###mostrando RATING TOP 5 PELICULAS MAS VALORADAS
ratingtop5_peliculas<-ratingtop5_text
ratingtop5_peliculas
for (Peliculasvalue in ratingtop5_peliculas) {
  print("============================")
  print(Peliculasvalue)
}

###TOP 5 PELICULAS MAS VALORADAS
TOP5_PELICULASDF <- data.frame( 
  "Nombre pelicula" = top5_peliculas, 
  "Rating" = ratingtop5_peliculas
)

TOP5_PELICULASDF

######################## -TOP 5 DE SERIES MAS VALORADAS- #######################

top5_serieshtml<-html_nodes(RepelisHD,css= ".tright .title")
top5_seriestext<-html_text(top5_serieshtml)

###Mostrando TOP 5 SERIES MAS VALORADAS

top5_series <- top5_seriestext
top5_series
for (Seriestop in top5_series) {
  print("============================")
  print(Seriestop)
}

###RATING TOP 5 SERIES MAS VALORADAS
ratingtop5series_html<-html_nodes(RepelisHD,css= ".tright .rating")
ratingtop5series_text<-html_text(ratingtop5series_html)



###Mostrando RATING TOP 5 SERIES MAS VALORADAS
ratingtop5_series<-ratingtop5series_text
ratingtop5_series

for (Ratingtopseries in ratingtop5_series) {
  print("============================")
  print(Ratingtopseries)
}


###TOP 5 SERIES MAS VALORADAS
TOP5_SERIESDF <- data.frame( 
  "Nombre Serie" = top5_series, 
  "Rating" = ratingtop5_series
)
TOP5_SERIESDF

