# encuesta_cgi
Correcto funcionamiento
---------------------------------------------------------------------------------------------------------------------------------

El script sin modulo depende un archivo llamdo fichero.txt que contiene los tipos de usuarios de la encuesta.

El script con modulo depende del modulo CGI que podemos encontrar en CPAN-->https://metacpan.org/pod/distribution/CGI/lib/CGI.pod

          cpan -i CGI

Para ejecutar los dos script debemos de meterlo en la carpeta cgi-bin de nuestro apache y dar permisos de ejecucion pero antes debemos de haber habilitado el modulo cgid de nuestro apache.
En la configuracion de apache tendremos que hacer una pequeña modificacion para que nuestro script pueda escribir en /tmp
En el fichero /lib/systemd/system/apache2.service comentar la linea
          PrivateTmp=true
Reiniciar apache para aplicar los cambios.


