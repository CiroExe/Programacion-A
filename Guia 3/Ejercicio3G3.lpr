program Ejercicio3G3;
(*Ingresar N números enteros, informar cuántas veces un número supera al anterior.*)
var
  Numero, Anterior :integer;
  i, N,cont:byte;



begin
  write('Ingrese la cantidad de numeros que desea escribrir');readln(N);
  cont:=0;
  Anterior:=MaxInt;
  for i:=1 to N do
   begin
     write('Ingrese un numero');readln(Numero);
     if Numero>Anterior then
      cont:=cont+1;

     Anterior:=Numero;
   end;

  writeln(cont,' es la cantidad de veces que un numero supera al anterior');
  readln()


end.

