program Ejercicio9G4;
{ Dado un archivo que contiene en cada línea 4 números (N1, D1, N2, D2) numerador y denominador
de dos fracciones. Se pide leer los pares de fracciones y por cada uno de ellos informe:
a) La suma como fracción.
b) El producto como fracción. }

function suma(N1,N2,D1,D2:integer):integer;
begin
  suma:=((N1*D2)+(N2*D1)) div (D1*D2);
end;

function producto(N1,N2,D1,D2:integer):integer;
begin
  producto:=(N1*N2) div (D1*D2);
end;


var
  N1,N2,D1,D2,sum:integer;


begin
  writeln('Ingrese el primer numerador');Readln(N1);
  writeln('Ingrese el primer denominador');Readln(D1);
  writeln('Ingrese el segundo numerador');Readln(N2);
  writeln('Ingrese el segundo denominador');Readln(D2);
  sum:=Suma(N1,N2,D1,D2);
  writeln('La suma entre las fracciones es: ', sum);
  writeln('El producto de las fracciones es: ' ,producto(N1,N2,D1,D2));
  readln
end.

