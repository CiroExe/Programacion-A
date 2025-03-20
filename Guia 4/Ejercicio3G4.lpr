program Ejercicio3G4;
{Dado un número natural N, calcular y mostrar la suma de los N primeros números naturales.  }

function Suma(N:integer):integer;
var
  i:byte;
  sum:integer;
begin
  sum:=0;
  for i:=1 to N do
   sum:=sum+i;

  Suma:=sum;
end;



var
  N:integer;

begin
  write('Ingrese un numero natural');readln(N);
  if N>0 then
   writeln('La suma de los primeros ',N,' numeros naturales es ',Suma(N))
  else
   writeln('Ingrese un numero valido');
  readln
end.

