program Ejercicio6G4;

function Aleatorio(A,B:integer):integer;
begin
  randomize;
  Aleatorio:=random(B-A+1);
end;

var
  A,B:integer;
begin
  writeln('Ingrese el primer numero del intervalo');Readln(A);
  writeln('Ingrese el segundo numero del intervalo');readln(B);

  writeln('Numero aleatorio ',Aleatorio(A,B));
  readln

end.

