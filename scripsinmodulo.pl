#!/usr/bin/perl
print "Content-Type: text/html\n\n";
if($ENV{'QUERY_STRING'} eq "") {
print "<B>Introduce tu nombre</B>
       <form name=\"form1\" method=\"get\" >";
print "<input type=\"text\" name=\"nombre\" ><br><br>";
print "<input type=\"submit\" value=\"enviar\">";
}
else{
	@arGet=split("=",$ENV{'QUERY_STRING'});
	$arGet[1]=~ s/%2F/\//g;
########################################################################
	if($arGet[0] eq "nombre"){
	print "<B>Te llamas</B>
        <form name=\"form2\" method=\"get\" >";
	print $arGet[1];
	print "<input type=\"submit\" name=\"si\" value=\"si\" >";
	}
########################################################################
if($arGet[0] eq "si") {
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
         <input type=\"submit\" value=\"Enviar\" >";
}
##############################################################################################
if($arGet[0] eq "usuario") {
open T,">>/tmp/resultencuesta";
   @arGet=split("=",$ENV{'QUERY_STRING'});
   $arGet[1]=~ s/%2F/\//g;
   print "<br>";
   if($arGet[1] eq "standar"){
    print "<h2>Elegiste standar,Gracias por su aportacion</h2>";
    print T "standar";
  }
   if ($arGet[2] eq "root"){
    print "<h2>Elegiste root,gracias por su aportacion</h2>";
    print T "root"
}
}

#############################################################################################333

}
