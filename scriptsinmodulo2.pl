#!/usr/bin/perl
print "Content-Type: text/html\n\n";
if($ENV{'QUERY_STRING'} eq "") {
	print "<B>Introduce tu nombre</B>"
	<form name=\"form1\" method=\"get\">";
	print "<input type=\"text\" name=\"nombre\" ><br><br>";
	print "<input type=\"submit\" value=\"enviar\">";
}
if($ENV{'QUERY_STRING'} ne "") {
	@arGet=split("=", $ENV{'QUERY_STRING'});
	if (@arGet[0] eq "nombre") {
    	$datos = $ENV{'QUERY_STRING'};
    	@array = split('&', $datos);

    	foreach $pair (@array) {
      	($name, $value) = split('=', $pair);
      	$FORM{$name} = $value;
    	};
	$nombre = $FORM{nombre};
	print "<form name=\"form2\" method=\"get\" >"; 
	print "<h3>Hola $nombre</h3>";
	print "<h3>confirma tu nombre pulsando en si</h3>"
	print "<input type=\"submit\" value=\"si\">";
}
if(@arGet[0] eq "si") {

print "<h1>¿Que usario crees mas apropiado para un usuario que no sabe informatica?</h1>
          <form name=\"Enviar\" method=\"get\" >";
   open F, "fichero.txt";
   while(<F>) {
     chomp;
     @campos=split(":");
     $ar{$campos[0]}=$campos[0];
   }
   print "<select name = \"usuario\">";
   for (keys %ar){
     print "<option value=$_";
     print ">$_</option>";
   }
   print "</select>
         <input type=\"submit\" value=\"Enviar\" />";
}else {
   open T,">>/tmp/resultencuesta";
   @arGet=split("=",$ENV{'QUERY_STRING'});
   $arGet[1]=~ s/%2F/\//g;
   print "<br>";
   if($arGet[1] eq "standar"){
    print "<h2>Elegiste standar,Gracias por su aportacion</h2>";
    print T "standar";
  }
   if ($arGet[1] eq "root"){
    print "<h2>Elegiste root,gracias por su aportacion</h2>";
    print T "root";
   }

