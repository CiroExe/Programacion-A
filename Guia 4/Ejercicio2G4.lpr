program Ejercicio2G4;

function factorial(N:integer):integer;
var
  i:byte;
  aux:integer;
begin
  aux:=1;
  for i:=1 to N do
   aux:=aux*i;

  factorial:=aux;
end;

var
  N:byte;

begin
  writeln('Ingrese un numero ');readln(N);

  if N=0 then
   writeln('El factorial es 1')
  else
   writeln('El factorial del numero ',N,' es ',factorial(N));
  readln
end.

