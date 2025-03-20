{ Leer desde un archivo números enteros ordenados de menor a mayor, puede haber elementos
repetidos.
Calcular y mostrar cada número con su respectiva frecuencia. }

Program ejercicio10;

var
 Numero,NumeroAnterior:integer;
 arch:text;
 frecuencia,i:byte;

begin
  assign(arch, 'Frecuencia.txt');reset(arch);
  NumeroAnterior:=999;
  frecuencia:=1;
  i:=1;

  while not eof (arch) do
   begin
     read(Arch, Numero);

     if Numero=NumeroAnterior then
      frecuencia:=frecuencia+1
     else
       begin
         if i<>1 then
           writeLn('El numero ',Numeroanterior,' tuvo una frecuencia de ',frecuencia,' veces.');
         frecuencia:=1;

       end;
     NumeroAnterior:=Numero;
     i:=i+1;
   end;
  close(Arch);
  readln

end.

