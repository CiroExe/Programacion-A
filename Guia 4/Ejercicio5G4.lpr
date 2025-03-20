program Ejercicio5G4;
{  Calcular la solución por determinantes de un sistema de dos ecuaciones lineales con dos incógnitas
(se supone compatible y determinado). Desarrollar la función que dados a,b,d,e obtenga x }

function Determinante(a,b,d,e:integer):integer;
var
  X:integer;
begin
  X:=(a*e)-(d*b);

  Determinante:=X;
end;


var
  a,b,d,e:integer;
begin
  writeln('Ingrese el numero de la primera fila y primer columna');Readln(a);
  writeln('Ingrese el numero de la primera fila y segunda columna');Readln(b);
  writeln('Ingrese el numero de la segunda fila y primer columna');Readln(d);
  writeln('Ingrese el numero de la segunda fila y segunda columna');Readln(e);

  writeln('El determinante es: ', Determinante(a,b,d,e));
  readln



end.
