#!/usr/bin/perl
print "Content-Type: text/html; charset=utf-8\n\n";
if($ENV{'QUERY_STRING'} eq "") {
print "<B>Introduce tu nombre</B>
       <form name=\"form1\" method=\"get\" >";
print "<input type=\"text\" name=\"nombre\" ><br><br>";
print "<input type=\"submit\" value=\"enviar\">";
}
else{
	@arGet=split("=",$ENV{'QUERY_STRING'});
	$arGet[1]=~ s/%2F/\//g;
	if($arGet[0] eq "nombre"){
	print "<B>Te llamas</B>
        <form name=\"form2\" method=\"get\" >";
	print $arGet[1];
	print "<input type=\"submit\" name=\"si\" value=\"si\" >";
	}
        if($arGet[0] eq "si") {
          print "<h1>¿Qué usario crees más apropiado para un usuario que no sabe informática?</h1>
          <form name=\"Enviar\" method=\"get\" >";
          open F, "fichero.txt";
          while(<F>) {
            chomp;
            push @ar, $_
          }
          print "<select name = \"usuario\">";
          for (@ar){
            print "<option value=$_";
            print ">$_</option>";
          }
          print "</select><input type=\"submit\" value=\"Enviar\" >";
        }
        if($arGet[0] eq "usuario") {
          open T,">>/tmp/resultencuesta";
          @arGet=split("=",$ENV{'QUERY_STRING'});
          #$arGet[1]=~ s/%2F/\//g;
          print "<br>";
          open F, "fichero.txt";
          while(<F>) {
            chomp;
            $values{$_} = 1
          }
          if(exists($values{$arGet[1]})){
             print "<h2>Elegiste $arGet[1], gracias por tu aportación</h2>";
             print T "$arGet[1]\n"
          }
          else {
             print "<h2>No es correcta la elección</h2>";
          }
        }
}
