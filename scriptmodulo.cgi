#!/usr/bin/perl

use CGI;
$query = new CGI;

print $query->header;
print $query->start_html('Encuesta');
if(!$query->param) {
	print $query->start_form;
      	print $query->h1('¿como te llamas?');
	print $query->textfield('name');
      	print $query->submit;
      	print $query->end_form;
      	print $query->br;
}
else{
	if (!$query->param('name') eq "") {
		print $query->start_form;
     		print $query->h3('Hola confirma que te llamas '),$query->param('name'),$query->h3('para ello pulsa el boton de si');
		print $query->br;
		print $query->submit(-name=>'envio',-value=>'si');
	      	print $query->end_form;
		print $query->br;

	}
}


if (!$query->param('envio') eq ""){
	print $query-> header;
      	print $query->start_html('Encuesta');
      	print $query->start_form;
      	print $query->h1('¿Que cuenta de usuario crees mas apropiado para un usuario que no sabe informatica?');
      	print $query->popup_menu(-name=>'elecion',
                 	-values=>['standar','root']),p;
      	print $query->submit;
      	print $query->end_form;
      	print $query->br;
}
if ($query->param('elecion') ne "") {
        open T,">>/tmp/resultadoencuesta.txt";
        print $query->h3('Gracias por su aportacion ');
        print $query->param('elecion');
        print T $query->param('elecion');
}



