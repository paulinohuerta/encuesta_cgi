#!/usr/bin/perl

use CGI qw/:standard/;
print header,
      start_html('Encuesta'),
      start_form,
      h1('¿como te llamas?'),textfield('name'),p,
      submit,
      end_form,
      hr;
print header,
      start_html('Encuesta'),
      start_form,
      
      h1('¿Que cuenta de usuario crees mas apropiado para un usuario que no sabe informatica?'),p,
      popup_menu(-name=>'elecion',
                 -values=>['standar','root']),p,
      submit,
      end_form,
      hr;

 if (param()) {
     my $elecion     = param('elecion');
     my $name      = param('name');
     print 
            "Muy buena elecion ",em(escapeHTML($name)),p,
           "Elegiste ",em(escapeHTML($elecion))," gracias por su aportacion",
           hr;
 }