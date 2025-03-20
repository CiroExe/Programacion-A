program Ejercicio4G4;
{ Desarrollar una función que calcule la potencia n-ésima de un número X ( X^n) }

function potencia(X,N:integer):integer;
var
  i:byte;
  pot:integer;
begin
  pot:=1;
  for i:=1 to N do
   pot:=pot*X;
  potencia:=pot;
end;

var
  X,n:integer;

begin
  write('Ingrese un numero base ');Readln(X);
  write('Ingrese el exponente de la base ');Readln(n);

  writeln('La productoria del numero ',X,' es ',potencia(X,N));
  readln



end.

