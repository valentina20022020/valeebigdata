########################
##                    ##
## http://flixtor.to/ ##
##                    ##
########################

#instalando paquetes

install.packages("rvest")
install.packages("curl")
install.packages("xml2")
install.packages("paths")

library("rvest")

# PÁGINA WEB
# http://flixtor.to/home
# ASIGNANDO LA URL 


direccion<- "http://flixtor.to/home"

######## Obtener el codigo html de la pagina web

Flixtor<-read_html(direccion)


######## revisando el contenido de Flixtor.to

print(html_text(Flixtor))

#### GENEROS DE PELÍCULAS #### 

css_generos <- ".genres"
generos_html <- html_nodes(Flixtor, css_generos)
generos_text <- html_text(generos_html)
generos_text

### CAPITULOS SERIES DE TV AÑADIDA HACE POCO  ### 

css_tvreciente <- ".contentListE .title"
tvreciente_html <- html_nodes(Flixtor, css_tvreciente)
tvreciente_text <- html_text (tvreciente_html)
tvreciente_html
tvreciente_text

### POPULARES DE HOY ###

css_popularhoy <- ".contentListR .title"
popularhoy_html <- html_nodes(Flixtor, css_popularhoy)
popularhoy_text <- html_text(popularhoy_html)
popularhoy_html
popularhoy_text

### PROGRAMAS DE TV AGREGADOS RECIENTEMENTE ###
css_showtv <- ".contentListT .title"
showtv_html <- html_nodes(Flixtor,css_showtv)
showtv_text <- html_text(showtv_html)
showtv_text

### PELICULAS AGREGADAS RECIENTEMENTE ###
css_pelireciente <- ".contentListM .title"
pelireciente_html <- html_nodes(Flixtor, css_pelireciente)
pelireciente_text <- html_text(pelireciente_html)
pelireciente_text

### ANIO LANZAMIENTO PELICULAS RECOMENDADAS ###
css_aniorecomendada <- ".contentListR .t12"
aniorecomendada_html <- html_nodes(Flixtor, css_aniorecomendada)
aniorecomendada_text <- html_text (aniorecomendada_html)
aniorecomendada_text

### GENERO DE PELICULA DE RECOMENDADOS ### 
css_generorecomendado <- ".contentListR .genres"
generorecomendado_html <- html_nodes (Flixtor, css_generorecomendado)
generorecomendado_text <- html_text (generorecomendado_html)
generorecomendado_text

### ANIO LANZAMIENTO PELICULAS AGREGADAS ### 
css_aniopelicula <- ".contentListM .t12"
aniopelicula_html <- html_nodes(Flixtor, css_aniopelicula)
aniopelicula_text <- html_text(aniopelicula_html)
aniopelicula_text

### GÉNERO PELÍCULA AGREGADA ### 
css_generopelicula <- ".contentListM .genres"
generopelicula_html <- html_nodes(Flixtor, css_generopelicula)
generopelicula_text <- html_text(generopelicula_html)
generopelicula_text

### PELICULAS RECIENTE Y SU TIPO DE GENERO ###

for(pelireciente_text in generopelicula_text) {  print("=====================")
  print(pelireciente_text) }


### CONVERSION A VECTORES ### 

tipogeneros <- generos_text
Seriestvreciente <-tvreciente_text
programasTvreciente <-showtv_text
peliculasreciente <-pelireciente_text
Peliculasrecomendadas <-popularhoy_text
Aniorecomendada <-aniorecomendada_text
Generorecomendado <-generorecomendado_text
Aniopeliculaagregada <- aniopelicula_text
Generopeliculaagregada <- generopelicula_text

### Data Frame General ###

BS <- data.frame(Seriestvreciente,programasTvreciente,peliculasreciente,Peliculasrecomendadas,Aniorecomendada, Generorecomendado, Aniopeliculaagregada, Generopeliculaagregada)

### Data Frame Peliculas Recomendadas ###
BDRECOMENDADOS <- data.frame(Peliculasrecomendadas,Aniorecomendada,Generorecomendado)
BDRECOMENDADOS
